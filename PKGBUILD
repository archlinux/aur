# Maintainer: Gianluca Recchia <gianluca dot recchia97 at libero dot it>

pkgname=rusty-tags-git
_pkgname="${pkgname%-git}"
pkgver=3.5.1.r17.gc18ae34
pkgrel=1
pkgdesc='Create ctags/etags for a cargo project and all of its dependencies'
url="https://github.com/dan-t/$_pkgname"
depends=('ctags')
makedepends=('cargo' 'git')
arch=('x86_64')
license=('BSD')
provides=('rusty-tags')
conflicts=('rusty-tags')
source=("${pkgname}::git+$url" 'lto.patch')
sha1sums=('SKIP' 'dd652e1f20291e60e5f4e2fc773c35990168c768')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git apply ../lto.patch
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
