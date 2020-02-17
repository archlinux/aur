# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=nikto-git
_gitname=nikto
pkgver=2.1.6.601.7ac0457
pkgrel=1
pkgdesc='A web server scanner which performs comprehensive tests against web servers for multiple items'
url='https://github.com/sullo/nikto'
arch=('any')
license=('GPL')
depends=('sh' 'openssl' 'perl-net-ssleay' 'perl-json')
makedepends=('git')
backup=('etc/nikto.conf')
provides=('nikto')
conflicts=('nikto')
source=(${pkgname}::git+https://github.com/sullo/${_gitname}
        nikto.sh)
sha512sums=('SKIP'
            '75b9be1f1cacbca09a5e72f8125aadc24938a3ac36b2337bf68916231af52e2af846a0dedb36782f45716d2c6d590a3606cb5879339528e7a744f1d2d880120d')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  find . -type f ! -name nikto.pl -exec chmod 644 {} +
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/usr/share/nikto"
  cp -a program/* "${pkgdir}/usr/share/nikto"

  install -Dm 755 "${srcdir}/nikto.sh" "${pkgdir}/usr/bin/nikto"
  install -Dm 644 program/nikto.conf.default "${pkgdir}/etc/nikto.conf"
  install -Dm 644 documentation/nikto.1 "${pkgdir}/usr/share/man/man1/nikto.1"
  install -Dm 644 program/docs/nikto_manual.html "${pkgdir}/usr/share/doc/${pkgname}/manual.html"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
