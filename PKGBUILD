# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=logstash
pkgver=7.10.2
_jrubyver=9.2.13.0
pkgrel=1
pkgdesc='Tool for managing events and logs'
url='https://www.elastic.co/products/logstash/'
arch=('x86_64')
license=('Apache')
depends=('java-runtime-headless>=8' 'ruby' 'ruby-bundler' 'coreutils' 'awk')
makedepends=('jdk11-openjdk' 'git')
backup=('etc/conf.d/logstash'
        'etc/logstash/jvm.options'
        'etc/logstash/log4j2.properties'
        'etc/logstash/logstash.yml'
        'etc/logstash/pipelines.yml')
_jrubydist=jruby-dist-${_jrubyver}-bin.tar.gz
source=(https://github.com/elastic/logstash/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://repo1.maven.org/maven2/org/jruby/jruby-dist/${_jrubyver}/${_jrubydist}
        build.patch
        log4j.patch
        logstash.service
        logstash@.service
        logstash-sysuser.conf
        logstash-tmpfile.conf
        bundle.config)
noextract=(${_jrubydist})
sha256sums=('52288699c9e14453e8655ac940c1d0ee51c8956f4b6356502b67c62abf228429'
            '73a8c241a162e644c87e864c3485c55adedeb82a6fd80fa3cb538fdacda7af58'
            '9ae56b463b465f16363f60670c7da4e84a9bf03c17324c4364c089d7a480cb4b'
            '5e52cf3a4372c77dfcb1c5f48160f7a6da5d2f5fc9c84b22b63f91bef85c01dd'
            '2b8b29297202334c784fdd7f2eb8d7e776c24c783b3c9f8387b500ab0039335c'
            'a01ea29d4f53d785f6eb926ebfe445e64ed5b3dab5d0418848589dd79502d876'
            '18a68a59ddb0ce19778e83b65e68dd568d65b7180bf45b4cf298fb332d69eb26'
            '346b630484f8a35b1a549e94e53e3e151527852a29c72cc6e529221215a7f533'
            'fe05315345e4489458c3eecac43726800109c1e390e74a14584096f6c041fee1')
sha512sums=('0163dc6d0a4efda4b1e075e63145029931df73dc7633c2601b45cebe10978bcf6972fa46341aa1c12ce949ed193e80d6d33937b791c5c75ff9fd155cf6c7ace2'
            '2cba016ad6a376252083122d51335610209d860c41de1902f5cd49ffc2f6b49c350b68df8fc4113c221255af4db7ec07980267b9888369811faf66db369e757c'
            'f6ddf9cc70a2c0cabaacf39fa26953c15af0060711713b2de69caddd2b8f845edde535f002cd7a0d0f8fc01abf934d887278fb6617b2a3d640284bc16ea34927'
            'fb166705f9e26e47c9b9219fcd814fef5cd602ad936600973132ad2c869a4091d727d5a76c2322ce5c871ac550478df0d502b2291fd54f04b9a32059ab6ea5b6'
            '817097565519dc7c5eac7521339947c74c6148683ca594356dd2ceb3274a1e94f8e7318ce310e0fe5789d7ab0d4c23404f814bef31036a11ddfec08d16814c69'
            'ce2cef4a784845b00d7c867273555811450bc459669abb5be944bfbbb02708129983e45376a9b308d6db22b2c7b4a7a212827a4826f2a27bc7e143cebc9abfe0'
            'd811dc3b18d0032b79b4669c9f6aefca49963897c309d83cbf87616c7b8cb5944c17c8072980bcd115d0fb57ef1624d98259ff1082d402d308c33e766ee89699'
            '05ea8af97c4f6ac9ba5518b99dc3136859edd24d8376940b48b8c7a70586c8bc188deb1079a99e19d437c39e0eb17d68e7cc3f9af4aa3ad2bc6a87c08cae94a6'
            '5091aa34cc31acd50fd2865714080cf6e67c2d437424f27e001bb409c2885a0e82eabe4ce17461d60c181f460a16df0a03d53bac6015fb731b3e5225735fd4da')

prepare() {
  cd ${pkgname}-${pkgver}
  rm bin/*.bat
  sed -e 's|LS_SETTINGS_DIR=.*|LS_SETTINGS_DIR="/etc/logstash"|' -i config/startup.options
  sed -e '1i [ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh' -i bin/logstash.lib.sh

  # remove deprecated JVM options
  sed 's|"-XX:+UseParNewGC", ||g' -i logstash-core/benchmarks/build.gradle
  sed 's|-XX:+UseParNewGC||g' -i config/jvm.options

  # patch -p1 -i "$srcdir"/build.patch
  patch -p1 -i "$srcdir"/log4j.patch

  # Use system gradle (currently not working)
  # sed 's;./gradlew;gradle;g' -i rakelib/*.rake

  # Skip downloadAndInstallJRuby task in the bootstrap process
  sed /downloadAndInstallJRuby/d -i rakelib/vendor.rake

  mkdir -p vendor/_/
  cd vendor/_/
  ln -s "$srcdir"/${_jrubydist}
}

build() {
  cd ${pkgname}-${pkgver}
  export PATH="/usr/lib/jvm/java-11-openjdk/bin:$PWD/vendor/jruby/bin:$PATH"

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
  cd ${pkgname}-${pkgver}

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
