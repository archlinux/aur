# Maintainer: C0rn3j <spleefer90@gmail.com>
# Contributor: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jitsi
_pkgname=videobridge
_tag=2.1-273-g072dd44b
_version=2.1+273+g072dd44b

_pkgbase=${_basename}-${_pkgname}
_debname=${_basename}-${_pkgname}2
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Videobridge binary"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime" "bash")
optdepends=("prosody")
makedepends=('tar')
options=('!strip')
backup=(
  "etc/${_pkgbase}/config"
  "etc/${_pkgbase}/log4j2.xml"
  "etc/${_pkgbase}/logging.properties"
  "etc/${_pkgbase}/sip-communicator.properties"
)
source=(
        "https://download.jitsi.org/stable/${_debname}_${_tag}-1_all.deb"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
	"jitsi.install"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})
install=jitsi.install

build() {
        rm -rf ${_pkgbase}
        mkdir ${_pkgbase}
        tar xJf data.tar.xz -C ${_pkgbase}
}

package() {
        cd "$srcdir/${_pkgbase}"

        DESTDIR="${pkgdir}/usr/lib/${_pkgbase}"
        CONFDIR="${pkgdir}/etc/${_pkgbase}"

        install -dm755 "${DESTDIR}"
        cp -R usr/share/jitsi-videobridge/* "${DESTDIR}"
        rm "${DESTDIR}"/{collect-dump-logs.sh,graceful_shutdown.sh}

        chown -R root:root "${DESTDIR}"

        install -dm750 "${CONFDIR}"
        install -Dm640 -t "${CONFDIR}" etc/jitsi/videobridge/*
        sed -i 's@/var/log/jitsi@/var/log/'${_pkgbase}'@' "${CONFDIR}/log4j2.xml"

        install -Dm644 "etc/sysctl.d/20-jvb-udp-buffers.conf" "${pkgdir}/etc/sysctl.d/${_pkgbase}.conf"

        cd "$srcdir"
        install -Dm640 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
sha256sums=('694f5afd5ecc123ec0e8fe5186adf38f3989fa7a2c9a80c0d316c7622527888a'
            '5c79dc1e1f5ee04eba3da987c488fc53cb6e4348345cab05ab0ed6d7000f3d9d'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7'
            'f87c5250acba49a62ae55293059281764a6dc8cd99acf23e4b1b8bbee03b4fb1'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '4dd8141e71bbf73b39cf242902e1c1a84a38dc3160ff89e76883d999af10541c'
            '59c2b2068205d6972c4b25bf1bbed9aaf08ff395b28309888cfe9b386dc29fa0')
