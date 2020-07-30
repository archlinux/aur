# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jitsi
_pkgname=videobridge
_tag=2.1-279-g7ae2c44c
_version=2.1+279+g7ae2c44c

pkgname=${_basename}-${_pkgname}-nightly
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Videobridge nightly build"
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
)
source=(
        "$pkgname::git+https://github.com/jitsi/jitsi-videobridge#tag=${_tag}"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)

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
                jvb-api/jvb-api-client/target/dependency/* \
		jvb-api/jvb-api-common/target/dependency/* \
		jvb/lib/videobridge.rc

        install -Dm644 jvb/target/${_basename}-${_pkgname}*.jar "${DESTDIR}/${_basename}-${_pkgname}.jar"
        install -Dm755 -t "${DESTDIR}" "jvb/resources/jvb.sh"

	install -dm750 "${CONFDIR}"
        install -Dm640 -t "${CONFDIR}" "jvb/lib/logging.properties" "config/log4j2.xml" "config/callstats-java-sdk.properties"
	sed -i 's@logs@/var/log/'$pkgname'@' "${CONFDIR}/log4j2.xml"

	install -Dm644 "config/20-jvb-udp-buffers.conf" "${pkgdir}/etc/sysctl.d/${pkgname}.conf"

	cd "$srcdir"
        install -Dm640 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
sha256sums=('SKIP'
            'b4d10b1d85d9a4dc37645d8d13dcaafe073c888c5947d371c36d3d5c855d28b4'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7'
            'd3e66c0c5e37eec4ca4d12c8e10bb937b8b9216c943aba76457b782f0e836993'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '2ae824bb4e47ae4c6264ef67169b73b705586a198b6b38469af41fa0b624cb3e')
