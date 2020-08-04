# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jicofo
_tag=615
_version=1.0+615

_pkgbase=${_basename}-nightly
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="JItsi meet COnference FOcus nightly binary"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime" "bash")
optdepends=("prosody")
makedepends=('tar')
options=('!strip')
backup=(
  "etc/${_pkgbase}/config"
  "etc/${_pkgbase}/logging.properties"
  "etc/${_pkgbase}/sip-communicator.properties"
)
source=(
        "https://download.jitsi.org/unstable/${_basename}_1.0-${_tag}-1_all.deb"
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
        cp -R usr/share/jicofo/* "${DESTDIR}"
        rm "${DESTDIR}"/collect-dump-logs.sh

        chown -R root:root "${DESTDIR}"

	install -dm750 "${CONFDIR}"
        install -Dm640 -t "${CONFDIR}" "etc/jitsi/jicofo/logging.properties"
        sed -i 's@/var/log/jitsi@/var/log/'${_pkgbase}'@' "${CONFDIR}/logging.properties"

        cd "$srcdir"
        install -Dm640 -t "${CONFDIR}" "config" "sip-communicator.properties"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"

        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
sha256sums=('78062ef7c03e6525e8aed17dee39cd99801eeccb8dceb84506e15679a2fd253d'
            '1ea9ec0ae7c398b3ac7ddc4a2597f1d660c55f1135b37dd9321ec9c473cccd21'
            'f295f5f8ee13edd019defc037c60e04c6ea2d30e69cc4a896c010b8570f5efab'
            'aa65cc6180c21fb111f287a5fd688d4d157dd30418966366abe30053c3c225f0'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            '8285dccf3f64c0b02994f967e76434642b1194215227bd05ce79eccabee58247')
