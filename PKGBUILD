# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd-git'
pkgver=0.1.2.r11.g3a8dbd9
pkgrel=1
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('i686' 'x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('cargo' 'git' 'rust')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=('git+https://github.com/stratis-storage/stratisd.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"

  git describe --long --tags \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname/-git}"

  cargo build --release
  cargo doc --no-deps
}

check() {
  cd "${pkgname/-git}"

  make test
}

package() {
  cd "${pkgname/-git}"

  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/doc/"
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname/-git}"

  install -m 755 target/release/${pkgname/-git} "${pkgdir}/usr/bin/${pkgname/-git}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname/-git}/LICENSE"
  cp -r target/doc/* "${pkgdir}/usr/share/doc/"
}

# vim: ts=2 sw=2 et:
