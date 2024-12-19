# Maintainer: Artem Popov <lifespirit@sip3.io>

pkgbase=sip3
pkgname=("${pkgbase}-captain-ce"
         "${pkgbase}-salto-ce"
         "${pkgbase}-twig-ce"
         "${pkgbase}-hoof-ce")
pkgver=2024.2.2
pkgrel=2
pkgdesc='SIP3 monitoring system'
arch=('any')
url='https://sip3.io'
license=('Apache-2.0')
makedepends=(
  'git'
  'curl'
  'jdk-openjdk'
  'maven'
  'libpcap'
)
optdepends=(
  'nginx: Lightweight HTTP server and IMAP/POP3 proxy server'
  'mongodb: A high-performance, open source, schema-free document-oriented database'
  'influxdb: Scalable datastore for metrics, events, and real-time analytics'
)
options=('!lto')
source=(
  "sip3-hoof-ce.tgz::https://repo.sip3.io/jar/releases-ce/sip3-hoof/${pkgver}/sip3-hoof-latest.tgz"
  "sip3-twig-ce::git+https://github.com/sip3io/sip3-twig-ce.git#branch=release/$pkgver"
  "sip3-salto-ce::git+https://github.com/sip3io/sip3-salto-ce.git#branch=release/$pkgver"
  "sip3-captain-ce::git+https://github.com/sip3io/sip3-captain-ce.git#branch=release/$pkgver"
  "logback-webhook-appender::git+https://github.com/sip3io/logback-webhook-appender.git#branch=release/1.0.6"
  "sip3-parent::git+https://github.com/sip3io/sip3-parent.git#branch=release/$pkgver"
  "sip3-commons::git+https://github.com/sip3io/sip3-commons.git#branch=release/$pkgver"
  "sip3-captain.conf"
  "captain-environment.conf"
  "sip3-captain@.service"
  "sip3-salto.conf"
  "salto-environment.conf"
  "sip3-salto.service"
  "sip3-twig.conf"
  "twig-environment.conf"
  "sip3-twig.service"
  "sysusers.conf"
  "sip3-hoof.conf"
  "settings.xml"
)
b2sums=(
  'e4190beec73b1d0bc5e53325231d9aab2ed617382e50657a60db2f2e117676d9813d69aad85a71336af8374f5a03a430b116904d10a6f617d0145e97ce6e0b40'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'cceb9cd3b10e08b482931c130ec4893e489f33a99a0b310ea2cfed63284641e7323bbb97c5b498010eccf6ecbf6173aba73aebabca14393cb9b7789e126e4272'
  '8f1916a34f5498d4cb1400ebe3ab2688d5606c0524f42caea300ab486d45d223ab7391ac0a527129b258281467c463c4a66ae9b1cea7b57d0594e2c8d6c75dbf'
  '37ddd2ae8789e50c75e86edcf930de44f663350390c1ec548f8430567cde099c77d642cc42c266a6a5deae681c852e075d5aeb9d54e24dd4de38898a803acde9'
  '441281e2c7a48c7bc4edd6cd2bbd4557d6b30833cc5de3937cd0f51344f60967d357cfcd74f92a1623d731c377ddd70c452cc6346bd23eba59540367f85d63df'
  '11b99697f673c8c9e3ced5f8e44b0fd7ce4544f384e44157606d11cf3b2da19008f420e393220a18dd07fe1efa41847e1416317fdbecfb43bf0802bc5c702618'
  '57fed3c49e5c97dcd879fb527d551bda8867bbeabac890f92f65d35c3ac591186932aba637216154e160690209cea4dcbb167373e223850379432c9c47277bf1'
  '3fab6c3748adb07953dbb8f41bb210a57ee46820dfed28d50ffcd203f078f88c6d71200f6013491708470434d17542ef3fb8cf945b747ab829ea121ed1034857'
  'a56f5e2d63bb3300b58d50108dd7fd68c80e25a9ae7c4bc4eeaa5340ecbcd19d6e4e6afc22d8e5f6f32eb992b747803f4ac903cbe98ce07a1af34253ea4f37d7'
  '6af722085f8da2ba758542e20ba7ab61058bda0e417c1a6c0be86d282f060d5e7f79a093ea9f8f3cc81d66cec391f112dd0ce500387517da9f3b153c49906252'
  '8275260f3123979a1e087e994732f9bf0c422ef2cdb8bd17e5a3e16100ae90f69582b5e687ab0666677cf1afda84e642b6e996f0d18def6533259bf153b29b55'
  'ae5832060f90257f5e39e7e525fc66bd596652da0c6eaa93ceb3cae52bc5976e2c2ef645c85d31367e94cc4493cdc21189055d5adde9cd97ab22862938ffa518'
  '40b0cc1035d1c283789631c6ebca3c9fef7df15c1f247e7a0141619888398d3367bebaeb3b9938d2f37e89e7af25d5d71ecb71aff805390aa93caec9479bfb8b'
)

build() {
  cd "logback-webhook-appender"
  mvn install -DskipTests

  cd "../sip3-parent"
  mvn install -DskipTests

  cd "../sip3-commons"
  mvn install -DskipTests

  cd "../sip3-captain-ce"
  mvn package -P executable-jar -DskipTests

  cd "../sip3-salto-ce"
  mvn package -P executable-jar -DskipTests -gs ${srcdir}/settings.xml

  cd "../sip3-twig-ce"
  mvn package -P executable-jar -DskipTests
}

package_sip3-captain-ce() {
  pkgdesc+="(packets dumper)"
  backup=(
    'etc/sip3-captain/application.yml'
    'etc/sip3-captain/logback.xml'
    'etc/sip3-captain/vertx-options.json'
    'etc/sip3-captain/environment.conf'
  )
  depends=(
    'jdk-openjdk'
    'libpcap'
  )

  cd "${srcdir}/sip3-captain-ce"

  # binary
  install -vDm755 -t "$pkgdir/opt/sip3-captain/sip3-captain.jar" target/sip3-captain-ce.jar
  mkdir -p "${pkgdir}/etc/sip3-captain/"
  mkdir -p "${pkgdir}/usr/lib/tmpfiles.d/"
  mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp src/main/resources/application.yml "${pkgdir}/etc/sip3-captain/application-lo.yml"
  cp src/main/resources/logback.xml "${pkgdir}/etc/sip3-captain/logback-lo.xml"
  cp src/main/resources/vertx-options.json "${pkgdir}/etc/sip3-captain/"
  cp ${srcdir}/captain-environment.conf "${pkgdir}/etc/sip3-captain/environment.conf"  
  cp ${srcdir}/sip3-captain.conf "${pkgdir}/usr/lib/tmpfiles.d/"
  cp ${srcdir}/sip3-captain@.service "${pkgdir}/usr/lib/systemd/system/"
  cp ${srcdir}/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/sip3.conf"
}

package_sip3-salto-ce() {
  pkgdesc+="(packets processor)"
  backup=(
    'etc/sip3-salto/application.yml'
    'etc/sip3-salto/codecs.yml'
    'etc/sip3-salto/logback.xml'
    'etc/sip3-salto/vertx-options.json'
    'etc/sip3-salto/environment.conf'
  )
  depends=(
    'jdk-openjdk'
  )

  cd "${srcdir}/sip3-salto-ce"

  # binary
  install -vDm755 -t "$pkgdir/opt/sip3-salto/sip3-salto.jar" target/sip3-salto-ce.jar
  mkdir -p "${pkgdir}/etc/sip3-salto/"
  mkdir -p "${pkgdir}/usr/lib/tmpfiles.d/"
  mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp src/main/resources/application.yml "${pkgdir}/etc/sip3-salto/"
  cp src/main/resources/codecs.yml "${pkgdir}/etc/sip3-salto/"
  cp src/main/resources/logback.xml "${pkgdir}/etc/sip3-salto/"
  cp src/main/resources/vertx-options.json "${pkgdir}/etc/sip3-salto/"
  cp -R src/main/resources/udf "${pkgdir}/opt/sip3-salto/"
  cp ${srcdir}/salto-environment.conf "${pkgdir}/etc/sip3-salto/environment.conf"
  cp ${srcdir}/sip3-salto.conf "${pkgdir}/usr/lib/tmpfiles.d/"
  cp ${srcdir}/sip3-salto.service "${pkgdir}/usr/lib/systemd/system/"
  cp ${srcdir}/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/sip3.conf"
}

package_sip3-twig-ce() {
  pkgdesc+="(API backend)"
  backup=(
    'etc/sip3-twig/application.yml'
    'etc/sip3-twig/logback.xml'
    'etc/sip3-twig/vertx-options.json'
    'etc/sip3-twig/environment.conf'
  )
  depends=(
    'jdk-openjdk'
  )

  cd "${srcdir}/sip3-twig-ce"

  # binary
  install -vDm755 -t "$pkgdir/opt/sip3-twig/sip3-twig.jar" target/sip3-twig-ce.jar
  mkdir -p "${pkgdir}/etc/sip3-twig/"
  mkdir -p "${pkgdir}/usr/lib/tmpfiles.d/"
  mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp src/main/resources/application.yml "${pkgdir}/etc/sip3-twig/"
  cp src/main/resources/logback.xml "${pkgdir}/etc/sip3-twig/"
  cp ${srcdir}/twig-environment.conf "${pkgdir}/etc/sip3-twig/environment.conf"
  cp ${srcdir}/sip3-twig.conf "${pkgdir}/usr/lib/tmpfiles.d/"
  cp ${srcdir}/sip3-twig.service "${pkgdir}/usr/lib/systemd/system/"
  cp ${srcdir}/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/sip3.conf"
}

package_sip3-hoof-ce() {
  pkgdesc+="(frontned)"
  optdepends=(
    'nginx'
  )

  cd "${srcdir}"

  # binary
  mkdir -p ${pkgdir}/srv/http/sip3-hoof
  tar xvzf sip3-hoof-ce.tgz -C "${pkgdir}/srv/http/sip3-hoof/"
  cp ${srcdir}/sip3-hoof.conf "${pkgdir}/srv/http/sip3-hoof-nginx.conf"
}
