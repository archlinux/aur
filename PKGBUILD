# Maintainer: C0rn3j <spleefer90@gmail.com>
# Contributor: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jitsi
_pkgname=meet
_tag=1.0.4628
_version=1.0.4628

_pkgbase=${_basename}-${_pkgname}
_debname=${_basename}-${_pkgname}-web
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Web binary"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=("nginx")
makedepends=('tar')
options=('!strip')
backup=(
  "etc/webapps/${_pkgbase}/logging_config.js"
  "etc/webapps/${_pkgbase}/config.js"
  "etc/webapps/${_pkgbase}/interface_config.js"
)
source=(
        "https://download.jitsi.org/stable/${_debname}_${_tag}-1_all.deb"
        "https://download.jitsi.org/stable/${_debname}-config_${_tag}-1_all.deb"
	"jitsi.install"
)
noextract=(
	"${_debname}-config_${_tag}-1_all.deb"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})
install=jitsi.install

build() {
        rm -rf ${_pkgbase}
        mkdir ${_pkgbase}
        tar xJf data.tar.xz -C ${_pkgbase}
	ar p "${_debname}-config_${_tag}-1_all.deb" data.tar.xz | tar xJC ${_pkgbase}

}

package() {
        cd "$srcdir/${_pkgbase}"

        DESTDIR="${pkgdir}/usr/share/webapps/${_pkgbase}"
        CONFDIR="${pkgdir}/etc/webapps/${_pkgbase}"
        DOCDIR="${pkgdir}/usr/share/doc/${_pkgbase}"

        install -d "$DESTDIR"
        install -d "$CONFDIR"
	install -d "$DOCDIR"

	cp -R usr/share/jitsi-meet/* "${DESTDIR}"
        cp usr/share/jitsi-meet-web-config/config.js "${DESTDIR}"
        cp -R usr/share/jitsi-meet-web-config/* "${DOCDIR}"

        for i in interface_config.js logging_config.js config.js
        do
                install -Dm644 "$DESTDIR/${i}" "$CONFDIR/${i}"
                ln -sf "/etc/webapps/${_pkgbase}/${i}" "$DESTDIR/${i}"
        done

        sed -i 's@/usr/share/jitsi-meet@/usr/share/webapps/'${_pkgbase}'@' "${pkgdir}/usr/share/doc/${_pkgbase}/"*
        sed -i 's@/etc/jitsi/meet@/etc/webapps/'${_pkgbase}'@' "${pkgdir}/usr/share/doc/${_pkgbase}/"*
        
        chown -R root:root "${pkgdir}"
}
sha256sums=('0d1b18285b8ce7a849d67ee2b00a372034dcbd8f3b652479acba96ea2191a079'
            'a455c7f72a221253d8a72185baed755499b964241f0e58a3991f4a27e1b0238e'
            'a6c7bd3a8c46f4192e6de555ee0c72cd87849a74159148f67ef3d3873796147a')
