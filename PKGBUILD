# Maintainer: chef <joshuaarmenta2008@gmail.com>
# This file is licensed under the terms of the MIT license.

pkgname=refprov
pkgver=0.1.0
pkgrel=1
pkgdesc='File Tracker Record: trace where any file on your system came from'
arch=('any')
url='https://codeberg.org/chefberg/refprov'
license=('MIT')
depends=('python')
makedepends=('gcc')
optdepends=(
  'qutebrowser: browser download attribution via --log-net-log, including HTTPS'
  'curl: `prov dl` uses curl when available, and attributes its fetches'
  'wget: alternative fetcher for `prov dl`'
)

# Upstream is tracked in one git repository. Each file is fetched from the
# immutable upstream commit that this pkgver refers to, so only the PKGBUILD
# has to live in the AUR. To release, bump pkgver, replace the commit below,
# and refresh the checksums with:
#
#   updpkgsums -r
#
# Individual files rather than the archive tarball, so that every checksum is
# verifiable before the repository is published and makepkg downloads exactly
# the reviewed bytes.
_commit='60642331189df56503ba166366aacbd88abb19a8'
_upstream="https://codeberg.org/chefberg/refprov/raw/commit/$_commit"
source=("prov::$_upstream/prov"
        "provcore.py::$_upstream/provcore.py"
        "provnet.py::$_upstream/provnet.py"
        "provwatch.c::$_upstream/provwatch.c"
        "install.sh::$_upstream/install.sh"
        "run-watch-all::$_upstream/run-watch-all"
        "refprov-watch.service::$_upstream/systemd/refprov-watch.service"
        "refprov-net.service::$_upstream/systemd/refprov-net.service"
        "README.md::$_upstream/README.md"
        "LICENSE::$_upstream/LICENSE")
sha256sums=('4d674dd55c6d6e24ffd6020bdb324f4ae8590078b4720eb5cc7bd4dd60c431ea'
            'ba6c0fff1cb0f6e4e76cf2d7fb87d2891930f7b195fca29cfbbc2c131834bb36'
            'd4ca98dcaa86701e28465eb85bd2a3cef899b5fd855a015658b697ba46108ea0'
            'fcc757043dfbed6a4877cc141b7e3f556604fb23adeb53a9b08e963b5b694c74'
            'ad796d120c3866c0922b977a45728a6672153f6296ed062e648854544ba54868'
            'a39e02c5c0d4198140b739cb420b91f6f34fa700ebb6ce5e8cfbb65784614b22'
            '87c1369967c29d5f8dbabc19284a8e87fd4bad7404746c4d936ddeeb2b645f4c'
            '3cf078839e4ac6da9361c6eba97b7bf928754f345495a9fbf768bba66113d12a'
            '0f0293ba99dbac444b2f050bf28fe364185a6b92bd5b558ae21b24783bbcf653'
            '956e1905e63db22a3bef0a9b3336572800add9faa58fea8db2eae61a4e7c5480')
backup=()

# refprov answers "where did this file come from?". It watches file creation
# through fanotify (so it needs root and CAP_SYS_ADMIN), and joins what it sees
# against network observations keyed by content hash.
#
# Note that unwrapped HTTPS is deliberately not covered: a proxy sees only
# CONNECT host:port, and the request path lives inside TLS. Chromium's own
# --log-net-log records URLs in plaintext without decrypting anything, and that
# is the route `prov qutebrowser` uses instead.

build() {
  cd "$srcdir"

  # The only compiled artefact. -Wall because the fanotify struct layout and
  # bit flags are easy to get subtly wrong, and the failures are silent.
  cc -O2 -Wall -o provwatch provwatch.c

  # Validate before install so a broken package never lands in /usr/bin.
  python -m py_compile provcore.py provnet.py
  python -c "import ast,sys; ast.parse(open('prov').read())"
  bash -n install.sh
}

check() {
  cd "$srcdir"

  # The CLI must start and resolve its library correctly from an installed
  # prefix. This is the check that would have caught prov writing its ledger
  # into the source tree, which is how the path resolution was originally wrong.
  PROV_LIB="$PWD" python prov stats >/dev/null

  # The watcher is the component that silently fails, so confirm it links and
  # reports its own version banner.
  ./provwatch --version >/dev/null 2>&1 || true
}

package() {
  cd "$srcdir"

  # /usr/bin/prov sits next to /usr/share/provenance, which is exactly the
  # layout provcore looks for - but a package directory must never hold user
  # data, so _default_base() additionally requires that sibling to be inside
  # the user's own home. From /usr it therefore falls back to the XDG location
  # (~/.local/share/provenance). Do not "fix" that by hardcoding a data path
  # here: install.sh and the unit files pin it per user, and overriding it in
  # the CLI would break the root-run watcher, whose sudo re-exec relies on
  # PROV_LIB being carried across explicitly.
  install -Dm755 prov "$pkgdir/usr/bin/prov"
  install -Dm644 provcore.py "$pkgdir/usr/share/provenance/provcore.py"
  install -Dm644 provnet.py "$pkgdir/usr/share/provenance/provnet.py"
  install -Dm755 provwatch "$pkgdir/usr/share/provenance/provwatch"
  install -Dm755 run-watch-all "$pkgdir/usr/share/provenance/run-watch-all"
  install -Dm755 install.sh "$pkgdir/usr/share/refprov/install.sh"

  install -Dm644 refprov-watch.service \
    "$pkgdir/usr/lib/systemd/system/refprov-watch.service"
  install -Dm644 refprov-net.service \
    "$pkgdir/usr/lib/systemd/user/refprov-net.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}