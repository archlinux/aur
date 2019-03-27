# Maintainer: Eric Liu <eric@hnws.me>
# Official repo maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Official repo maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash-xpack
relpkgname=logstash
pkgver=6.6.2
_jrubyver=9.1.13.0
pkgrel=1
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
_jrubydist=jruby-dist-${_jrubyver}-bin.tar.gz
source=(https://artifacts.elastic.co/downloads/logstash/$relpkgname-$pkgver.tar.gz
        https://repo1.maven.org/maven2/org/jruby/jruby-dist/${_jrubyver}/${_jrubydist}
        build.patch
        logstash.service
        logstash@.service
        logstash-sysuser.conf
        logstash-tmpfile.conf
        bundle.config)
noextract=(${_jrubydist})
sha256sums=('4ff1a532a5dd41cc7249840a4f74f332c05d4efdb67c0fe7e8b1c0d9c3c505d0'
            '9d156646623ac2f27174721035b52572a4b05690db7c1293295aa2c04aad3908'
            '640f1c81e6c68f9d1256875db89f5439992e2b8188fb7e6e3ddcdae1c33a3af8'
            '2b8b29297202334c784fdd7f2eb8d7e776c24c783b3c9f8387b500ab0039335c'
            'a01ea29d4f53d785f6eb926ebfe445e64ed5b3dab5d0418848589dd79502d876'
            '18a68a59ddb0ce19778e83b65e68dd568d65b7180bf45b4cf298fb332d69eb26'
            '346b630484f8a35b1a549e94e53e3e151527852a29c72cc6e529221215a7f533'
            'fe05315345e4489458c3eecac43726800109c1e390e74a14584096f6c041fee1')
sha512sums=('7de3c50018f20617acc4881fd7fee64be98a53d2abd4867d928519c91fd028affa2e588fcec7806b0b689de4ab707e7001a60d09b13ff76ecd0f52fae7fee5b2'
            'ef88f613ada2665d4f63b2e2f15594739de8ba501406e76de417821f44847b0e258524687b0ae0cf5b737520aa4dd9bb59d80a4b89a81408cda638f28bebbead'
            '21adfc88d980cabb3a45ac029b5dddf8c4b4bc96ac95999ae85fa655101ff58b139bceb613c0e91c108f3f78dcb21ba6f997ee2884c58c3a55eaa7938b6959c4'
            '817097565519dc7c5eac7521339947c74c6148683ca594356dd2ceb3274a1e94f8e7318ce310e0fe5789d7ab0d4c23404f814bef31036a11ddfec08d16814c69'
            'ce2cef4a784845b00d7c867273555811450bc459669abb5be944bfbbb02708129983e45376a9b308d6db22b2c7b4a7a212827a4826f2a27bc7e143cebc9abfe0'
            'd811dc3b18d0032b79b4669c9f6aefca49963897c309d83cbf87616c7b8cb5944c17c8072980bcd115d0fb57ef1624d98259ff1082d402d308c33e766ee89699'
            '05ea8af97c4f6ac9ba5518b99dc3136859edd24d8376940b48b8c7a70586c8bc188deb1079a99e19d437c39e0eb17d68e7cc3f9af4aa3ad2bc6a87c08cae94a6'
            '5091aa34cc31acd50fd2865714080cf6e67c2d437424f27e001bb409c2885a0e82eabe4ce17461d60c181f460a16df0a03d53bac6015fb731b3e5225735fd4da')

prepare() {
  cd $relpkgname-${pkgver}
  rm bin/*.bat
  sed -e 's|LS_SETTINGS_DIR=.*|LS_SETTINGS_DIR="/etc/logstash"|' -i config/startup.options
  sed -e '1i [ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh' -i bin/logstash.lib.sh

  # remove deprecated JVM options
  sed 's|"-XX:+UseParNewGC", ||g' -i logstash-core/benchmarks/build.gradle
  sed 's|-XX:+UseParNewGC||g' -i config/jvm.options

  patch -p1 -i "$srcdir"/build.patch

  # Use system gradle (currently not working)
  # sed 's;./gradlew;gradle;g' -i rakelib/*.rake

  # Skip downloadAndInstallJRuby task in the bootstrap process
  sed /downloadAndInstallJRuby/d -i rakelib/vendor.rake

  mkdir -p vendor/_/
  cd vendor/_/
  ln -s "$srcdir"/${_jrubydist}
}

build() {
  cd $relpkgname-${pkgver}
  export PATH="/usr/lib/jvm/java-10-openjdk/bin:$PWD/vendor/jruby/bin:$PATH"

  # gradle downloadAndInstallJRuby (system gradle currently not working)
  ./gradlew downloadAndInstallJRuby
  rake bootstrap
  rake plugin:install-default

  rm -r vendor/_ build ci logstash-core/{build,src,spec} qa pkg spec rakelib tools vendor/bundle/jruby/*/cache .gradle

  cd vendor/jruby/lib
  mv jni jni-temp
  mkdir jni
  mv jni-temp/x86_64-Linux jni/
  rm -rf jni-temp
}

package() {
  cd $relpkgname-${pkgver}

  install -dm 755 "${pkgdir}/usr/share/logstash" "${pkgdir}/etc/conf.d"
  mv config/startup.options "${pkgdir}/etc/conf.d/logstash"
  mv config "${pkgdir}/etc/logstash"
  chmod 750 "${pkgdir}/etc/logstash"

  cp -a bin data lib logstash* modules vendor Gemfile* "${pkgdir}/usr/share/logstash"
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
