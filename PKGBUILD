# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jicofo
_version=1.0+1192

_pkgbase=${_basename}-nightly
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=2
pkgdesc="JItsi meet COnference FOcus nightly binary"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime-openjdk=17" "bash")
optdepends=("prosody")
makedepends=('tar' 'unzip')
options=('!strip')
backup=(
  "etc/${_pkgbase}/config"
  "etc/${_pkgbase}/logging.properties"
  "etc/${_pkgbase}/jicofo.conf"
)
source=(
        "https://download.jitsi.org/unstable/jicofo_${_version//+/-}-1_all.deb"
	      "jicofo.conf"
        "jicofo_default_${_version#1.0+}.conf::https://raw.githubusercontent.com/jitsi/jicofo/${_version#1.0+}/jicofo/src/main/resources/reference.conf"
        "jicofo_default_${_version#1.0+}_common.conf::https://raw.githubusercontent.com/jitsi/jicofo/${_version#1.0+}/jicofo-common/src/main/resources/reference.conf"
        "jicofo_default_${_version#1.0+}_selector.conf::https://raw.githubusercontent.com/jitsi/jicofo/${_version#1.0+}/jicofo-selector/src/main/resources/reference.conf"
        "config"
        "service"
        "sysusers.conf"
        "tmpfiles.conf"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})
install=install

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
        install -Dm600 "config" "${CONFDIR}/config"
        install -Dm600 "jicofo.conf" "${CONFDIR}/jicofo.conf"
        install -Dm600 "jicofo_default_${_version#1.0+}.conf" "${CONFDIR}/jicofo_default.conf"
        install -Dm600 "jicofo_default_${_version#1.0+}_common.conf" "${CONFDIR}/jicofo_default_common.conf"
        install -Dm600 "jicofo_default_${_version#1.0+}_selector.conf" "${CONFDIR}/jicofo_default_selector.conf"
        install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"

        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
sha256sums=('620f2a43f6631aae30c0a1a2dd060770daa60f4c755e96a6c41fc9959fea290a'
            '77f2e2d62e9fe38188f41b063496cc10970cc989ed620a64a2251d986d6ac253'
            '1781804018fe7618a4440550197aac9ab1f7417b5ae545874f4ba1f2ec3ad9f8'
            'b22a8df91cde1956969bd3a6fd293bea01be54713649ed0fd39e847b1eb61886'
            '7a96fcef5673cd0ee41d7e1c78bf7b6dca3fbf94d9e0ef8af2db146fc4f16c87'
            'c258808de5031c0d72df0aedfd521d07e6c442cd152e75737bdc1d758545521e'
            '548d307aa9f4ffae64b4c9c3e891f4332a8454bd7b271e5b76932c705697ee74'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            'a8e5ff30f3737da564f61e7d00cc6e0a8b243da54aa02f94095deaa2f4cceb66')
