# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hys-git
_pkgname="${pkgname%-git}"
pkgver=0.1.1
pkgrel=2
pkgdesc="Terminal RSS Reader for Digital Minimalists in Zig — Tool for Escaping the Doomscroll"
url="https://github.com/superstarryeyes/hys"
arch=('i686' 'x86_64')
license=('MIT')
options=()
depends=('curl')
makedepends=(zig)
install=
provides=(hys)
conflicts=("${pkgname%-*}")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=(SKIP)
# validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname" || exit 1
  zig build -Doptimize=ReleaseSafe
}

package() {
  cd "$_pkgname" || exit 1
  # shellcheck disable=SC2154
  install -Dm755 zig-out/bin/hys "$pkgdir/usr/bin/hys"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
