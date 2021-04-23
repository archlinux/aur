# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi
_pkgname=videobridge
_version=2.1+484+g1bdf10fc
_url=https://download.jitsi.org/unstable/jitsi-videobridge2_2.1-484-g1bdf10fc-1_all.deb

_pkgbase=${_basename}-${_pkgname}-nightly
_debname=${_basename}-${_pkgname}2
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Videobridge nightly binary"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime" "bash")
optdepends=("prosody")
makedepends=('tar' 'unzip')
options=('!strip')
backup=(
  "etc/${_pkgbase}/config"
  "etc/${_pkgbase}/log4j2.xml"
  "etc/${_pkgbase}/logging.properties"
  "etc/${_pkgbase}/sip-communicator.properties"
  "etc/${_pkgbase}/jvb.conf"
)
source=(
        "$_url"
        "config"
        "sip-communicator.properties"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})

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

        install -dm700 "${CONFDIR}"
        install -Dm600 -t "${CONFDIR}" etc/jitsi/videobridge/*
        sed -i 's@/var/log/jitsi@/var/log/'${_pkgbase}'@' "${CONFDIR}/log4j2.xml"

        install -Dm644 "etc/sysctl.d/20-jvb-udp-buffers.conf" "${pkgdir}/etc/sysctl.d/${_pkgbase}.conf"

        cd "$srcdir"
        unzip "$srcdir/${_pkgbase}/usr/share/jitsi-videobridge/jitsi-videobridge.jar" reference.conf
        mv reference.conf jvb.conf
        install -Dm600 -t "${CONFDIR}" "config" "sip-communicator.properties" "jvb.conf"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
sha256sums=('b39748bcb9e0f73fd18c4c83e76a93332174170ec0f4c96f8f026adaf0bbb405'
            '561e604982060c3a2b179ae102bfba46ea99a040561b653ed65f4e4db193867b'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7'
            '6c64d8ae8a38fc6674c3d068cbfce7f82458d71403a40b0aa25768b1f4f1e10f'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '5d168a9155a46b72cd26b921b185be20f5c2e1d27ee098feaad5a941dd554d43')
