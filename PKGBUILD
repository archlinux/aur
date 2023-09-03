# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=sway-scratch
pkgver=0.2.1
pkgrel=1
pkgdesc='Automatically starting named scratchpads for sway'
arch=('x86_64')
url='https://github.com/aokellermann/sway-scratch'
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(git cargo)
optdepends=('sway: sway support'
            'i3-wm: i3 support')
_tag=e1af0f5ab37f5eb9ef4bef57a4ae512675671d81 # git rev-parse v${pkgver}
source=("${pkgname}::git+${url}?signed#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//'
}

build() {
  cd ${pkgname}
  cargo build --release
  DESTDIR=target/release cargo docs
}

package() {
  install -Dm755 ${srcdir}/${pkgname}/target/release/${pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm644 ${srcdir}/${pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 ${srcdir}/${pkgname}/target/release/${pkgname}.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 ${srcdir}/${pkgname}/target/release/${pkgname}-show.1 -t "${pkgdir}"/usr/share/man/man1/
}
