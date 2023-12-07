# Maintainer: Aman Gupta <aman.iv0012@gmail.com>
pkgname=logstash
pkgver=8.11.2
pkgrel=1
pkgdesc="Logstash - transport and process your logs, events, or other data"
arch=('x86_64')
url="https://www.elastic.co/logstash/"
license=('Apache')
# groups=()
depends=('jre17-openjdk-headless' 'ruby' 'ruby-bundler' 'coreutils' 'awk')
makedepends=('jdk17-openjdk' 'git')
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
backup=('etc/conf.d/logstash'
        'etc/logstash/jvm.options'
        'etc/logstash/log4j2.properties'
        'etc/logstash/logstash.yml'
        'etc/logstash/pipelines.yml')
# options=()
# install=
# changelog=
source=(https://github.com/elastic/logstash/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        logstash.service
        logstash@.service
        logstash-sysuser.conf
        logstash-tmpfile.conf
        bundle.config)
# noextract=()
md5sums=('9381f1f9761d7d2f1d96266940437468'
         '4c3efce8ba4da2605c1f2e839e3af55c'
         '54523d10c53cf5461a40a33d775c12c1'
         '7ef5efbe99cf9f4c29a221999ec41248'
         '9b1d67aedd308f9eb978a1f049130d1f'
         'e79a8d6e3b207a2dc52f3bfbac64cea5') #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"
  # export OSS=true
  ./gradlew installDevelopmentGems
  rake bootstrap
  rake plugin:install-default
}

package() {
  cd ${pkgname}-${pkgver}

  install -dm 755 "${pkgdir}/usr/share/logstash" "${pkgdir}/etc/conf.d"
  mv config/startup.options "${pkgdir}/etc/conf.d/logstash"
  mv config "${pkgdir}/etc/logstash"
  chmod 750 "${pkgdir}/etc/logstash"

  cp -a bin data lib logstash* modules vendor Gemfile* "${pkgdir}/usr/share/logstash"
  rm -rf "${pkgdir}/usr/share/logstash/logstash-core/"{.lock,benchmarks,*gradle*}
  rm -rf "${pkgdir}/usr/share/logstash/logstash-core/build/tmp/"
  chmod -R go-w "${pkgdir}/usr/share/logstash/"

  install -Dm 644 "${srcdir}"/{logstash.service,logstash@.service} -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/logstash-sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/logstash.conf"
  install -Dm 644 "${srcdir}/logstash-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/logstash.conf"
  install -Dm 644 "${srcdir}/bundle.config" "${pkgdir}/usr/share/logstash/.bundle/config"

  install -dm 755 "${pkgdir}/var/lib/logstash"
  install -dm 755 "${pkgdir}/var/log/logstash"
  install -dm 755 "${pkgdir}/etc/logstash/conf.d"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/logstash/bin/logstash "${pkgdir}/usr/bin/logstash"
}
