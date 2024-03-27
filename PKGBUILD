# Maintainer: Aman Gupta <aman.iv0012@gmail.com>
pkgname=logstash
pkgver=8.13.0
pkgrel=1
pkgdesc="Transport and process your logs, events, or other data"
arch=('x86_64')
url="https://www.elastic.co/logstash/"
license=('Apache-2.0 OR Elastic-2.0')
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
options=(!debug)
# install=
changelog="ChangeLog"
source=(https://github.com/elastic/logstash/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        logstash.service
        logstash@.service
        logstash-sysuser.conf
        logstash-tmpfile.conf
        bundle.config)
# noextract=()
md5sums=('3b7dbdaa8da5c0837ac03e6be6785e6a'
         '4c3efce8ba4da2605c1f2e839e3af55c'
         '54523d10c53cf5461a40a33d775c12c1'
         '7ef5efbe99cf9f4c29a221999ec41248'
         '9b1d67aedd308f9eb978a1f049130d1f'
         'e79a8d6e3b207a2dc52f3bfbac64cea5')

build() {
  cd "$pkgname-$pkgver"
  
  # export OSS=true
  # export JRUBY_OPTS="-Xms1g -Xmx1g"
  
  export JAVA_OPTS="--add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED"
  export GRADLE_OPTS="-Dorg.gradle.daemon=false -Dorg.gradle.jvmargs=-Xmx2g -Dfile.encoding=UTF-8"
  
  ./gradlew clean installDefaultGems --no-daemon --warning-mode all
}

package() {
  cd ${pkgname}-${pkgver}

  install -dm 755 "${pkgdir}/usr/share/logstash" "${pkgdir}/etc/conf.d"
  mv config/startup.options "${pkgdir}/etc/conf.d/logstash"
  mv config "${pkgdir}/etc/logstash"
  chmod 750 "${pkgdir}/etc/logstash"

  cp -a bin data lib logstash* modules vendor Gemfile* "${pkgdir}/usr/share/logstash"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/usr/share/logstash/logstash-core/"{.lock,benchmarks,*gradle*}
  rm -rf "${pkgdir}/usr/share/logstash/logstash-core/build/tmp/"
  rm -rf "${pkgdir}/usr/share/logstash/vendor/jruby/tmp/"
  rm -rf "${pkgdir}/usr/share/logstash/vendor/jruby/lib/ruby/stdlib/libfixposix/binary/arm64-linux/libfixposix.so"
  rm -rf "${pkgdir}/usr/share/logstash/vendor/jruby/lib/ruby/stdlib/libfixposix/binary/armv6-linux/libfixposix.so"
  rm -rf "${pkgdir}/usr/share/logstash/vendor/jruby/lib/ruby/stdlib/libfixposix/binary/armv7-linux/libfixposix.so"

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
