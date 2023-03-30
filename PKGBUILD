# Maintainer: Yann Büchau <nobodyinperson at posteo de>
# Contributor: Thomas Jost <schnouki@schnouki.net>
pkgname=git-annex-standalone-nightly
pkgver=10.20230329+ge6a337e8e
pkgrel=1
pkgdesc="Manage files with git, without checking their contents into git. Standalone nightly autobuild version, with no Haskell dependency."
arch=(x86_64 aarch64)
url="https://git-annex.branchable.com/"
license=('GPL')
depends=("bzip2" "file" "git" "gmp" "libffi" "lsof" "rsync" "sqlite" "xz" "zlib")
makedepends=("sed")
provides=("git-annex")
conflicts=("git-annex")

case $CARCH in
     x86_64) _arch=amd64;;
    aarch64) 
        _arch=arm64
        depends+=("libffi7")   # arm64 build of git-annex still requires libffi.so.7
        ;;
    default) _arch=amd64;;
esac

_tarball_url="https://downloads.kitenet.net/git-annex/autobuild/${_arch}/git-annex-standalone-${_arch}.tar.gz"

source=(
    "git-annex-standalone-${_arch}.tar.gz::$_tarball_url"
    git-annex.desktop
)
sha256sums=('87417606f28651d440f9df7531aab09e6fcb8d00710297ae6b659fdb502246a2'
            '39c60aea8b8be8bab6639614542de02c4014f43867ee2afe75737f772484178d')

pkgver() {
  cd "$srcdir/git-annex.linux"
  raw_version="$(shimmed/git-annex/git-annex version --raw || (strings shimmed/git-annex/git-annex | grep -Pm1 '\d+\.\d+-g[a-z0-9]{9}'))"
  echo "$raw_version" | sed  's|-|+|g'
}

package() {
  cd "$srcdir/git-annex.linux"

  for exe in git-annex git-annex-shell; do
    install -Dm755 shimmed/$exe/$exe "$pkgdir/usr/bin/$exe"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/git-annex.svg"
  install -Dm644 logo_16x16.png "$pkgdir/usr/share/pixmaps/git-annex_16x16.png"
  install -Dm644 "$startdir"/git-annex.desktop -t "$pkgdir"/usr/share/applications

  for f in usr/share/man/man1/*.1; do
    install -Dm644 $f "$pkgdir/$f"
  done
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
