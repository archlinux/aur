# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi
_pkgname=videobridge
_tag=2.1-478-gc6da57bd
_version=2.1+478+gc6da57bd

pkgname=${_basename}-${_pkgname}
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Videobridge"
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
  "etc/${pkgname}/log4j2.xml"
  "etc/${pkgname}/logging.properties"
  "etc/${pkgname}/sip-communicator.properties"
  "etc/${pkgname}/jvb.conf"
)
source=(
        "$pkgname::git+https://github.com/jitsi/jitsi-videobridge#tag=${_tag}"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)
install=install

build() {
        cd "$pkgname"
        mvn clean
        mvn package -DskipTests -Dassembly.skipAssembly=true install
        mvn dependency:copy-dependencies -DincludeScope=runtime
}

package() {
        cd "$srcdir/$pkgname"

        DESTDIR="${pkgdir}/usr/lib/${pkgname}"
        CONFDIR="${pkgdir}/etc/${pkgname}"

        install -Dm644 -C -t "${DESTDIR}/lib" \
                jvb/target/dependency/* \
                jvb/lib/videobridge.rc

        install -Dm644 jvb/target/${_basename}-${_pkgname}*.jar "${DESTDIR}/${_basename}-${_pkgname}.jar"
        install -Dm755 -t "${DESTDIR}" "jvb/resources/jvb.sh"

        install -dm700 "${CONFDIR}"
        install -Dm600 -t "${CONFDIR}" "jvb/lib/logging.properties" "config/log4j2.xml" "config/callstats-java-sdk.properties"
        install -Dm600 "jvb/src/main/resources/reference.conf" "${CONFDIR}/jvb.conf"
        sed -i 's@logs@/var/log/'$pkgname'@' "${CONFDIR}/log4j2.xml"

        install -Dm644 "config/20-jvb-udp-buffers.conf" "${pkgdir}/etc/sysctl.d/${pkgname}.conf"

        cd "$srcdir"
        install -Dm600 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
sha256sums=('SKIP'
            '784236b546ba5f47e80c951a3fec3be05e8bc5a8ac4258d21c6642c9f9a9defc'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7'
            '5d78e8eec07c6aae84a1f1c0922f951217741ccc6f1a50ed7ef966c665bbf291'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '8a8f2fd5d02f196dff0ce7ceb75e45d19028a9f22dc9e55653ab17cce29051af')
