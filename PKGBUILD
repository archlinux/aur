# Maintainer: Martin Rys <rys.pw/#contact_me>

pkgname=jitsi-videobridge
# https://github.com/jitsi/jitsi-videobridge/releases/latest
pkgver=2.1_416_g2f43d1b4
_tag="jitsi-meet_5390"
pkgrel=1
epoch=
pkgdesc="Videobridge for Jitsi Meet"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-videobridge"
license=("Apache")
groups=()
depends=("java-runtime-headless")
makedepends=("maven")
checkdepends=()
optdepends=()
provides=(jitsi-videobridge)
conflicts=(jitsi-videobridge-git)
replaces=()
backup=("etc/jitsi/videobridge/config"
        "etc/jitsi/videobridge/log4j2.xml"
        "etc/jitsi/videobridge/logging.properties"
        "etc/jitsi/videobridge/sip-communicator.properties")
options=()
install=
changelog=
source=(${pkgname}-${pkgver}-${_tag}.tar.gz::https://github.com/jitsi/jitsi-videobridge/archive/stable/${_tag}.tar.gz
        config
        jitsi-videobridge.service
        sip-communicator.properties
        sysusers.conf
        tmpfiles.conf)
noextract=()
sha256sums=('9c9a55deb8f7834a67a59803d3b8d61fed698529479a34e21bd2e530cee86a7c'
            '43037b9c00d09dafeb17758427093f4abaea10190cdd67f7047d008726c8cdef'
            'bb5db01df7dbfb67a400b0be114f29b2cc5cfc37cddea24b9b706c7a6c15e8af'
            '2b7679218752c0435a1496306b447d72aafaf5b671b6eef63e58c83a67638ced'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '36548f4980dcdbb27e0738c3fd928005d49a7b5c2c65d7a583ebb445626074dd')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-stable-${_tag}"
    mvn clean
    mvn package -DskipTests -Dassembly.skipAssembly=true install
    mvn dependency:copy-dependencies -DincludeScope=runtime
}

package() {
    PKGDIRNAME=${pkgname}-stable-${_tag}
    DESTLIBDIR="${pkgdir}/usr/share/${pkgname}"

    install -d "${pkgdir}/usr/share"
    install -Dm644 -C -t "${DESTLIBDIR}/lib" \
        ${PKGDIRNAME}/jvb/target/dependency/* \
        ${PKGDIRNAME}/jvb-api/jvb-api-client/target/dependency/* \
        ${PKGDIRNAME}/jvb-api/jvb-api-common/target/dependency/* \
        ${PKGDIRNAME}/jvb/lib/videobridge.rc

    install -dm750 "${pkgdir}/etc/jitsi/videobridge"
    install -Dm644 config "${pkgdir}/etc/jitsi/videobridge/config"
    install -Dm644 jitsi-videobridge.service "${pkgdir}/usr/lib/systemd/system/jitsi-videobridge.service"
    install -Dm644 sip-communicator.properties "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
    install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/jitsi-videobridge.conf"
    install -Dm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/jitsi-videobridge.conf"
    install -Dm640 -t "${pkgdir}/etc/jitsi/videobridge" "${PKGDIRNAME}/jvb/lib/logging.properties" "${PKGDIRNAME}/config/log4j2.xml" "${PKGDIRNAME}/config/callstats-java-sdk.properties"
    sed -i 's@logs@/var/log/'$pkgname'@' "${pkgdir}/etc/jitsi/videobridge/log4j2.xml"
    install -Dm644 "${PKGDIRNAME}/jvb/target/jitsi-videobridge-2.1-SNAPSHOT.jar" "${DESTLIBDIR}/jitsi-videobridge.jar"
    install -Dm755 -t "${DESTLIBDIR}" "${PKGDIRNAME}/jvb/resources/jvb.sh"
}
