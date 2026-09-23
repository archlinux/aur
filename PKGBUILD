# Maintainer: C0rn3j <spleefer90@gmail.com>
# Contributor: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jicofo
_version=1.0+1205

_pkgbase=${_basename}
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="JItsi meet COnference FOcus binary"
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
        "https://download.jitsi.org/stable/jicofo_${_version//+/-}-1_all.deb"
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
sha256sums=('0c37e9ea3e2e3ecd12b57b0363a41421a558616a9b5b0732d4abd612611644e4'
            '77f2e2d62e9fe38188f41b063496cc10970cc989ed620a64a2251d986d6ac253'
            '37ba948c4f54dcb3f9b71cbb4596c4612dfd76caf65fef0ef8d7059926255dac'
            'b22a8df91cde1956969bd3a6fd293bea01be54713649ed0fd39e847b1eb61886'
            '6b19c84002aa096fe17e6707bc366c03872bbc349e699b4aafdc3220fec5267b'
            'b69f9485ba55b53fe6d1a8b5e4a37c542641cb205c6f5c0b2cf89d236cc6b562'
            '902229d135e9b949da318f539cbe8f266bdd4e32e514f37d8782ad4562dc791b'
            '0681e97ca1e06d8ea7bdec0a874c6fc7a6ea84628923005130cd444547a1b440'
            '9f6fb4759099feefaee6fd44cac5854401e58f7ce929949cbc3994faaa3487d3')
