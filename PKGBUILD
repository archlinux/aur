# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jicofo
_tag=695
_version=1.0+695

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
makedepends=('tar' 'unzip')
options=('!strip')
backup=(
  "etc/${_pkgbase}/config"
  "etc/${_pkgbase}/logging.properties"
  "etc/${_pkgbase}/sip-communicator.properties"
  "etc/${_pkgbase}/jicofo.conf"
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

	install -dm700 "${CONFDIR}"
        install -Dm600 -t "${CONFDIR}" "etc/jitsi/jicofo/logging.properties"
        sed -i 's@/var/log/jitsi@/var/log/'${_pkgbase}'@' "${CONFDIR}/logging.properties"

        cd "$srcdir"
        unzip "$srcdir/${_pkgbase}/usr/share/jicofo/jicofo.jar" reference.conf
        mv reference.conf jicofo.conf
        install -Dm600 -t "${CONFDIR}" "config" "sip-communicator.properties" "jicofo.conf"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"

        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
sha256sums=('11b4a8ce759a6423262ee01747d16fbd5e21d7feae08ac8efc4b80f9243e8814'
            '8a4d4812f56e1e9b4c2754dc75c8525074aff9e90b1b8888a9982718e8edf287'
            'f295f5f8ee13edd019defc037c60e04c6ea2d30e69cc4a896c010b8570f5efab'
            'b187cec31a1f5db1456fa282b38c366df45e8bfdee2ef3ac6128cb5ee3be3f7b'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            'a8e5ff30f3737da564f61e7d00cc6e0a8b243da54aa02f94095deaa2f4cceb66')
