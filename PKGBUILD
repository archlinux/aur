# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=arch-audit-git
pkgver=0.1.15.r65.g68d6daa
pkgrel=1
pkgdesc='A utility like pkg-audit based on Arch Security Team data'
url='https://gitlab.com/ilpianista/arch-audit'
depends=('glibc' 'gcc-libs' 'curl' 'libcurl.so' 'libalpm.so')
makedepends=('cargo' 'pkg-config' 'git' 'scdoc')
provides=('arch-audit')
conflicts=('arch-audit')
arch=('i686' 'x86_64')
license=('MIT')
source=('git+https://gitlab.com/ilpianista/arch-audit.git')
md5sums=('SKIP')

pkgver() {
  cd arch-audit
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd arch-audit
  cargo build --release --locked
}

check() {
  cd arch-audit
  cargo test --release --locked
}

package() {
  cd arch-audit

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm 644 contrib/hooks/arch-audit.hook -t "${pkgdir}/usr/share/${pkgname}"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
