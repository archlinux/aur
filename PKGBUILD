# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=jitsi-videobridge-git
pkgver=2.1+682+g0192d75e8
pkgrel=1
pkgdesc="Jitsi Meet Videobridge git build"
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
  "etc/${pkgname}/callstats-java-sdk.properties"
  "etc/${pkgname}/sip-communicator.properties"
  "etc/${pkgname}/jvb.conf"
)
source=(
        "$pkgname::git+https://github.com/jitsi/jitsi-videobridge"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)
install=install

pkgver() {
    cd "$pkgname"
    printf "%s" "$(git describe --exclude stable/jitsi-meet_\* --long | sed 's/^v//;s/-/+/g')"
}

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

        install -Dm644 jvb/target/jitsi-videobridge-*.jar "${DESTDIR}/jitsi-videobridge.jar"
        install -Dm755 -t "${DESTDIR}" "jvb/resources/jvb.sh"

        install -dm700 "${CONFDIR}"
        install -Dm600 -t "${CONFDIR}" "jvb/lib/logging.properties" "config/callstats-java-sdk.properties"
        install -Dm600 "jvb/src/main/resources/reference.conf" "${CONFDIR}/jvb.conf"
        install -Dm644 "config/20-jvb-udp-buffers.conf" "${pkgdir}/etc/sysctl.d/${pkgname}.conf"

        cd "$srcdir"
        install -Dm600 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
sha256sums=('SKIP'
            '30fbf232643b963ed790f03167f125514251c728bc5f36e17fe5b280ce471724'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7'
            '8bc789915a3701ffbf6b4179892dfcdeb8b448a2a84b59dcde720fe481007457'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '54318c8c90b4b519b05f80a3241f0bae3da8a4478f68e47ba268355ff6ddf383')
