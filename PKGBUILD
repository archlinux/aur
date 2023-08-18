# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Yann Büchau <nobodyinperson at posteo de>
pkgname=git-annex-standalone
pkgver=10.20230627
pkgrel=1
pkgdesc="Manage files with git, without checking their contents into git. Standalone version, with no Haskell dependency."
arch=(x86_64 aarch64)
url="https://git-annex.branchable.com/"
license=('GPL')
depends=("bzip2" "file" "git" "gmp" "libffi" "lsof" "rsync" "sqlite" "xz" "zlib")
provides=("git-annex")
conflicts=("git-annex")

case $CARCH in
  x86_64) _arch=amd64 ;;
  aarch64)
    _arch=arm64
    depends+=("libffi7")   # arm64 build of git-annex still requires libffi.so.7
    ;;
  default) _arch=amd64 ;;
esac

# Fetch info about the last release before setting the source URL
_info_source="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-${_arch}.tar.gz.info"
_last_info=$(curl -s "${_info_source}")
_last_pkgver=$(echo "${_last_info}" | awk 'NR==4')
_last_sha256=$(echo "${_last_info}" | awk 'NR==3' | cut -d- -f 4 | cut -d. -f1)

source=("git-annex-standalone-${_arch}-${_last_pkgver}.tar.gz::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-${_arch}.tar.gz"
        "git-annex-standalone-${_arch}-${_last_pkgver}.tar.gz.sig::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-${_arch}.tar.gz.sig")
sha256sums=("${_last_sha256}"
            'SKIP')
validpgpkeys=("40055C6AFD2D526B2961E78F5EE1DBA789C809CB")

pkgver() {
  echo "${_last_pkgver}"
}

package() {
  cd "$srcdir/git-annex.linux"

  for exe in git-annex git-annex-shell; do
    install -Dm755 shimmed/$exe/$exe "$pkgdir/usr/bin/$exe"
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
