# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=git-annex-standalone
pkgver=10.20220121
pkgrel=1
pkgdesc="Manage files with git, without checking their contents into git. Standalone version, with no Haskell dependency."
arch=(x86_64)
url="https://git-annex.branchable.com/"
license=('GPL')
depends=("bzip2" "file" "git" "gmp" "libffi" "lsof" "rsync" "sqlite" "xz" "zlib")
provides=("git-annex")
conflicts=("git-annex")

# Fetch info about the last release before setting the source URL
_info_source="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz.info"
_last_info=$(curl -s "${_info_source}")
_last_pkgver=$(echo "${_last_info}" | awk 'NR==4')
_last_sha256=$(echo "${_last_info}" | awk 'NR==3' | cut -d- -f 4 | cut -d. -f1)

source=("git-annex-standalone-amd64-${_last_pkgver}.tar.gz::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
        "git-annex-standalone-amd64-${_last_pkgver}.tar.gz.sig::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz.sig")
sha256sums=("${_last_sha256}"
            'SKIP')
validpgpkeys=("40055C6AFD2D526B2961E78F5EE1DBA789C809CB")

pkgver() {
  echo "${_last_pkgver}"
}

package() {
  cd "$srcdir/git-annex.linux"

  # for lib in libffi.so.8; do
  #   install -Dm644 lib/x86_64-linux-gnu/$lib "$pkgdir/usr/share/$pkgname/lib/$lib"
  # done

  for exe in git-annex git-annex-shell; do
    install -Dm755 shimmed/$exe/$exe "$pkgdir/usr/share/$pkgname/bin/$exe"
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$exe" <<EOF
#!/bin/bash
export LD_LIBRARY_PATH="/usr/share/$pkgname/lib":\$LD_LIBRARY_PATH
exec "/usr/share/$pkgname/bin/$exe" "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$exe"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/git-annex.svg"
  install -Dm644 logo_16x16.png "$pkgdir/usr/share/pixmaps/git-annex_16x16.png"

  for f in usr/share/man/man1/*.1; do
    install -Dm644 $f "$pkgdir/$f"
  done
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
