# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi
_pkgname=videobridge
_tag=2.3-19-gb286dc0c
_version=2.3+19+gb286dc0c

pkgname=${_basename}-${_pkgname}
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Videobridge"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime-openjdk=11" "bash")
optdepends=("prosody")
makedepends=(
        "git"
        "java-environment-openjdk=11"
        "unzip" "maven"
)
options=('!strip')
backup=(
  "etc/${pkgname}/config"
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
        export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
        export PATH=$JAVA_HOME/bin:$PATH
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
        install -Dm600 -t "${CONFDIR}" "jvb/lib/logging.properties"
        install -Dm600 "jvb/src/main/resources/reference.conf" "${CONFDIR}/jvb.conf"
        install -Dm644 "config/20-jvb-udp-buffers.conf" "${pkgdir}/etc/sysctl.d/${pkgname}.conf"

        cd "$srcdir"
        install -Dm600 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
sha256sums=('SKIP'
            '5dbd9e1fec28d8b6eda3ed38b514322dc1386507e0a653c7a73061cdc41d9982'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7'
            'e433c840c4cac5663ed169e90899efc1d1210649bf828bb412295902985f9ee5'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '8a8f2fd5d02f196dff0ce7ceb75e45d19028a9f22dc9e55653ab17cce29051af')
