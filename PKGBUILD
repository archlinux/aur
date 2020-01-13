# Maintainer: Eric Liu <eric@hnws.me>
# Official repo maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Official repo maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash-xpack
_pkgname=logstash
pkgver=7.5.1
pkgrel=2
pkgdesc='Tool for managing events and logs'
url='https://www.elastic.co/products/logstash/'
arch=('x86_64')
license=('Apache')
depends=('java-runtime-headless>=8' 'ruby' 'ruby-bundler' 'coreutils' 'awk')
makedepends=('java-environment<11' 'git')
provides=('logstash')
conflicts=('logstash')
backup=('etc/conf.d/logstash'
        'etc/logstash/jvm.options'
        'etc/logstash/log4j2.properties'
        'etc/logstash/logstash.yml'
        'etc/logstash/pipelines.yml')
source=(https://artifacts.elastic.co/downloads/logstash/$_pkgname-$pkgver.tar.gz
        logstash.service
        logstash@.service
        logstash-sysuser.conf
        logstash-tmpfile.conf
        bundle.config)
sha256sums=('72f9454c82e8ddd509b5e8d41de0b5089c8722041181963e70de60fd38558606'
            '2b8b29297202334c784fdd7f2eb8d7e776c24c783b3c9f8387b500ab0039335c'
            'a01ea29d4f53d785f6eb926ebfe445e64ed5b3dab5d0418848589dd79502d876'
            '18a68a59ddb0ce19778e83b65e68dd568d65b7180bf45b4cf298fb332d69eb26'
            '346b630484f8a35b1a549e94e53e3e151527852a29c72cc6e529221215a7f533'
            'fe05315345e4489458c3eecac43726800109c1e390e74a14584096f6c041fee1')

prepare() {
  cd $_pkgname-${pkgver}
  rm bin/*.bat
  sed -e 's|LS_SETTINGS_DIR=.*|LS_SETTINGS_DIR="/etc/logstash"|' -i config/startup.options
  sed -e '1i [ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh' -i bin/logstash.lib.sh

  # remove deprecated JVM options
  sed 's|-XX:+UseParNewGC||g' -i config/jvm.options
}

package() {
  cd $_pkgname-${pkgver}

  install -dm 755 "${pkgdir}/usr/share/logstash" "${pkgdir}/etc/conf.d"
  mv config/startup.options "${pkgdir}/etc/conf.d/logstash"
  mv config "${pkgdir}/etc/logstash"
  chmod 750 "${pkgdir}/etc/logstash"

  cp -a bin data lib logstash* modules vendor Gemfile* x-pack "${pkgdir}/usr/share/logstash"
  rm -rf "${pkgdir}/usr/share/logstash/logstash-core/"{.lock,benchmarks,*gradle*}
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

# vim: ts=2 sw=2 et:
