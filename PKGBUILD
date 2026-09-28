# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
# Contributor: nycex <nycex / cccp.org>

pkgname=zls-git
_pkgname=${pkgname%-git}
pkgver=0.16.0.r71.g0ea69abd
pkgrel=1
pkgdesc="A language server for Zig (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/zigtools/zls"
license=('MIT')
depends=('zig')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  zig build --fetch
}

build() {
  cd "$_pkgname"
  DESTDIR="build" zig build \
    --summary all \
    --system zig-pkg \
    --prefix /usr \
    --release=safe \
    --build-id=sha1 \
    -Dcpu=baseline \
    -Dpie=true
}

package() {
  cd "$_pkgname"
  cp -a build/* "$pkgdir"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
