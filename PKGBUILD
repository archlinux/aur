# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=arch-audit-git
pkgver=0.1.13.r1.g74a490c
pkgrel=1
pkgdesc='A utility like pkg-audit based on Arch Security Team data'
url='https://gitlab.com/ilpianista/arch-audit'
depends=('curl')
makedepends=('cargo' 'pkg-config' 'git')
provides=('arch-audit')
conflicts=('arch-audit')
arch=('i686' 'x86_64')
license=('MIT')
source=('git://gitlab.com/ilpianista/arch-audit.git')
md5sums=('SKIP')

pkgver() {
  cd arch-audit
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd arch-audit
  cargo build --release
}

package() {
  cd arch-audit
  install -Dm755 target/release/arch-audit "$pkgdir/usr/bin/arch-audit"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 doc/arch-audit.1 "${pkgdir}/usr/share/man/man1/arch-audit.1"

  install -Dm644 systemd/arch-audit.service \
    "${pkgdir}/usr/share/${pkgname}/arch-audit.service"
  install -Dm644 systemd/arch-audit.timer \
    "${pkgdir}/usr/share/${pkgname}/arch-audit.timer"

  install -Dm644 completions/zsh/_arch-audit \
    "${pkgdir}"/usr/share/zsh/site-functions/_arch-audit

  install -Dm644 hooks/arch-audit.hook \
    "${pkgdir}"/usr/share/${pkgname}/arch-audit.hook
}
