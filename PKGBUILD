# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Vinh Nguyen <kurei [at] axcoto.com>
# Contributor: Kim Brandt <myrveln@gmail.com>

pkgname=newrelic-php5
pkgver=8.0.0.204
_libver=20170718
pkgrel=2
pkgdesc="NewRelic PHP Monitoring Agent"
arch=("x86_64")
url="https://newrelic.com/php"
license=("non-free")
depends=("glibc" "php")
backup=("etc/php/conf.d/newrelic.ini")
install="${pkgname}.install"
source=("https://download.newrelic.com/php_agent/archive/${pkgver}/${pkgname}-${pkgver}-linux.tar.gz"
        "newrelic-daemon.service")
md5sums=("fdfd6a91e192c061cdf40b6bbddc0dea"
         "4fc78347663adcb32ed28eddb546619c")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-linux"

  mkdir -p  ${pkgdir}/usr/bin/ \
            ${pkgdir}/usr/lib/php/modules/ \
            ${pkgdir}/usr/share/doc/newrelic-php5/ \
            ${pkgdir}/usr/lib/systemd/system/ \
            ${pkgdir}/etc/php/conf.d/;

  # Binary Daemon
  install -v -Dm755 ./daemon/newrelic-daemon.x64 ${pkgdir}/usr/bin/newrelic-daemon
  # PHP extension
  install -v -Dm755 ./agent/x64/newrelic-${_libver}-zts.so ${pkgdir}/usr/lib/php/modules/newrelic-zts.so
  install -v -Dm755 ./agent/x64/newrelic-${_libver}.so ${pkgdir}/usr/lib/php/modules/newrelic.so

  install -v -Dm644 ./README.txt ./LICENSE.txt ${pkgdir}/usr/share/doc/newrelic-php5/

  install -v -Dm644 ./scripts/newrelic.ini.template ${pkgdir}/etc/php/conf.d/newrelic.ini
  install -v -Dm644 ./scripts/newrelic.ini.template ${pkgdir}/etc/php/conf.d/newrelic.ini.template

  install -v -Dm644 ../newrelic-daemon.service ${pkgdir}/usr/lib/systemd/system/
}
