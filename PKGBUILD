# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jicofo
_tag=618
_version=1.0+618

pkgname=${_basename}-nightly
pkgver=${_version}
pkgrel=1
pkgdesc="JItsi Meet COnference FOcus nightly build"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime" "bash")
optdepends=("prosody")
makedepends=(
        "java-environment"
        "unzip" "maven"
)
options=('!strip')
backup=(
  "etc/${pkgname}/config"
  "etc/${pkgname}/logging.properties"
  "etc/${pkgname}/sip-communicator.properties"
)
source=(
        "$pkgname::git+https://github.com/jitsi/jicofo#tag=${_tag}"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)

build() {
        cd "$pkgname"
        mvn clean
        mvn package -DskipTests -Dassembly.skipAssembly=true
        mvn dependency:copy-dependencies -DincludeScope=runtime
}

package() {
        cd "$srcdir/$pkgname"
        
        DESTDIR="${pkgdir}/usr/lib/${pkgname}"
        CONFDIR="${pkgdir}/etc/${pkgname}"

        install -Dm644 -t "${DESTDIR}/lib" target/dependency/*
        install -Dm644 target/jicofo*.jar "${DESTDIR}/jicofo.jar"

	install -dm750 "${CONFDIR}"
        install -Dm640 -t "${CONFDIR}" "lib/logging.properties"
        install -Dm755 -t "${DESTDIR}" "resources/jicofo.sh"
        sed -i 's@/var/log/jitsi@/var/log/'${pkgname}'@' "${CONFDIR}/logging.properties"

        cd "$srcdir"
        install -Dm640 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
sha256sums=('SKIP'
            '1ea9ec0ae7c398b3ac7ddc4a2597f1d660c55f1135b37dd9321ec9c473cccd21'
            'f295f5f8ee13edd019defc037c60e04c6ea2d30e69cc4a896c010b8570f5efab'
            'aa65cc6180c21fb111f287a5fd688d4d157dd30418966366abe30053c3c225f0'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            '8285dccf3f64c0b02994f967e76434642b1194215227bd05ce79eccabee58247')
