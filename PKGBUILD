# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Morten Linderud <foxboron@archlinux.org>

# pacman-selinux: drop-in replacement for pacman built from a small SELinux fork
# (gitlab.archlinux.org/nbryskin/pacman, branch `selinux`). libalpm is patched to
# NOT apply package security.selinux xattrs on extract (it still applies
# security.capability, so setcap'd binaries keep working): on this system file
# labels come from the loaded policy + restorecon, not package payloads. Without
# it, baked labels transiently mislabel freshly extracted files until the relabel
# hook runs, tripping the confined package-manager domain (rpm_t) and leaving
# stragglers. See ~/src/pacman, commit "libalpm: do not apply package
# security.selinux labels on extract".

pkgname=pacman-selinux
_srcname=pacman
pkgver=7.1.0.r10.g6ae3fde
pkgrel=1
# Pinned to the fork commit (selinux branch = v7.1.0.r9 + the libalpm patch) so
# the build is reproducible. The fork already encapsulates the patch-level state,
# so no rebase step is needed here.
_fork_commit=6ae3fdebac89214e0968bf0af2bc9f6b23c5134d
pkgdesc="A library-based package manager with dependency support (SELinux fork: libalpm ignores package security.selinux labels)"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL-2.0-or-later')
depends=(
  bash
  coreutils
  curl libcurl.so
  gawk
  gettext
  glibc
  gnupg
  gpgme libgpgme.so
  grep
  libarchive libarchive.so
  openssl libcrypto.so
  pacman-mirrorlist
  systemd
  libmakepkg-dropins
)
makedepends=(
  asciidoc
  doxygen
  git
  meson
)
checkdepends=(
  fakechroot
  python
)
optdepends=(
  'base-devel: required to use makepkg'
  'perl-locale-gettext: translation support in makepkg-template'
)
# versioned provide so versioned deps (e.g. yay's `pacman>6.1`) are satisfied
provides=("pacman=$pkgver" 'libalpm.so')
conflicts=('pacman')
replaces=('pacman')
backup=(etc/pacman.conf
        etc/makepkg.conf
        etc/makepkg.conf.d/fortran.conf
        etc/makepkg.conf.d/rust.conf)
source=("$_srcname::git+https://gitlab.archlinux.org/nbryskin/pacman.git#commit=${_fork_commit}"
        "revertme-makepkg-remove-libdepends-and-libprovides.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/354a300cd26bb1c7e6551473596be5ecced921de.patch"
        "patch-reproducible-builds.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/f4bdb77470528019aaba4d8b8f947e918c6db17d.patch"
        '0001-libalpm-invalidate-curl-data-in-child.patch'
        pacman.conf
        makepkg.conf
        alpm.sysusers
        fortran.conf
        rust.conf)
sha256sums=('SKIP'
            'b3bce9d662e189e8e49013b818f255d08494a57e13fc264625f852f087d3def2'
            'de428b496a825772ef49ec5555a386a4b23ffa10b9dfd9907f0671d5c1dc2178'
            '9a734e5d75be603d58aa92e8d29a15466b3ac2af6b7d6f6728dd5c3e5ed8758d'
            'd6f6ca86104df026462ab634efa1ecc850bccfa748ed5a6a88283e7659ec90c5'
            '20497c90cbb678a9ca1a71eca66cf2a1d0c991c3e695f7b7d10fb68fc0ac4f12'
            '9c14afbc7dabee5a563202c833a043bd3b80c4522f8943c33d550641d7d1bbf1'
            '933b0b878fa611bf24b92f655040a3bcb4a1b67841d929013802abbb09b2ccf4'
            '6fe03e6ea3f69d99d59a48847a8ae97c2160fca847c7aedf7b89d05e4aa9386d')

pkgver() {
  cd "$_srcname"
  git describe --abbrev=7 --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname"

  # handle patches
  local -a patches
  patches=($(printf '%s\n' "${source[@]}" | grep '.patch'))
  patches=("${patches[@]%%::*}")
  patches=("${patches[@]##*/}")

  if (( ${#patches[@]} != 0 )); then
    for patch in "${patches[@]}"; do
      if [[ $patch =~ revertme-* ]]; then
        msg2 "Reverting patch $patch..."
        patch -RNp1 < "../$patch"
      else
        msg2 "Applying patch $patch..."
        patch -Np1 < "../$patch"
      fi
    done
  fi
}

build() {
  cd "$_srcname"

  meson --prefix=/usr \
        --buildtype=plain \
        -Ddoc=enabled \
        -Ddoxygen=enabled \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        build

  meson compile -C build
}

check() {
  cd "$_srcname"

  meson test -C build
}

package() {
  cd "$_srcname"

  DESTDIR="$pkgdir" meson install -C build

  # install Arch specific stuff
  install -dm755 "$pkgdir/etc"
  install -m644 "$srcdir/pacman.conf" "$pkgdir/etc"
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
  install -D -m644 "$srcdir/alpm.sysusers" "${pkgdir}"/usr/lib/sysusers.d/alpm.conf
  install -m644 "$srcdir/fortran.conf" "$pkgdir/etc/makepkg.conf.d"
  install -m644 "$srcdir/rust.conf" "$pkgdir/etc/makepkg.conf.d"

  local wantsdir="$pkgdir/usr/lib/systemd/system/sockets.target.wants"
  install -dm755 "$wantsdir"

  local unit
  for unit in dirmngr gpg-agent gpg-agent-{browser,extra,ssh} keyboxd; do
    ln -s "../${unit}@.socket" "$wantsdir/${unit}@etc-pacman.d-gnupg.socket"
  done
}

# vim: set ts=2 sw=2 et:
