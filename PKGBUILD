# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Eric Liu <eric@hnws.me>
# Official repo maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Official repo maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash-xpack
_pkgname=logstash
pkgver=7.6.2
_jrubyver=9.2.7.0
pkgrel=1
pkgdesc='Tool for managing events and logs'
url='https://www.elastic.co/logstash'
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
_jrubydist=jruby-dist-${_jrubyver}-bin.tar.gz
source=(https://github.com/elastic/logstash/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz
        https://repo1.maven.org/maven2/org/jruby/jruby-dist/${_jrubyver}/${_jrubydist}
	build.patch
        logstash.service
        logstash@.service
        logstash-sysuser.conf
        logstash-tmpfile.conf
        bundle.config)
noextract=(${_jrubydist})
sha256sums=('3e0c920c4d2a3ea0ac5a5990cd163ef232d363b622012a545a640b2b7bede1e8'
            'da7c1a5ce90015c0bafd4bca0352294e08fe1c9ec049ac51e82fe57ed50e1348'
            '9ae56b463b465f16363f60670c7da4e84a9bf03c17324c4364c089d7a480cb4b'
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
  sed 's|"-XX:+UseParNewGC", ||g' -i logstash-core/benchmarks/build.gradle
  sed 's|-XX:+UseParNewGC||g' -i config/jvm.options

  # patch -p1 -i "$srcdir"/build.patch

  # Use system gradle (currently not working)
  # sed 's;./gradlew;gradle;g' -i rakelib/*.rake

  # Skip downloadAndInstallJRuby task in the bootstrap process
  sed /downloadAndInstallJRuby/d -i rakelib/vendor.rake

  mkdir -p vendor/_/
  cd vendor/_/
  ln -s "$srcdir"/${_jrubydist}
}

build() {
  cd $_pkgname-${pkgver}
  export PATH="/usr/lib/jvm/java-10-openjdk/bin:$PWD/vendor/jruby/bin:$PATH"

  # gradle -x :logstash-core:javadoc bootstrap (system gradle currently not working)
  RELEASE=1 OSS=1 ./gradlew -x :logstash-core:javadoc installDefaultGems

  rm -r build ci logstash-core/{build,src,spec} qa pkg spec rakelib tools .gradle \
        vendor/_ vendor/bundle/jruby/*/cache vendor/jruby/lib/ruby/gems/shared/cache

  cd vendor/jruby/lib
  mv jni jni-temp
  mkdir jni
  mv jni-temp/x86_64-Linux jni/
  rm -rf jni-temp
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
