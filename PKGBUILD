# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jitsi
_pkgname=meet
_tag=4328
_version=1.0.4328

_pkgbase=${_basename}-${_pkgname}-nightly
_debname=${_basename}-${_pkgname}-web
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Web nightly binary"
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
        "https://download.jitsi.org/unstable/${_debname}_1.0.${_tag}-1_all.deb"
        "https://download.jitsi.org/unstable/${_debname}-config_1.0.${_tag}-1_all.deb"
)
noextract=(
	"${_debname}-config_1.0.${_tag}-1_all.deb"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})

build() {
        rm -rf ${_pkgbase}
        mkdir ${_pkgbase}
        tar xJf data.tar.xz -C ${_pkgbase}
	ar p "${_debname}-config_1.0.${_tag}-1_all.deb" data.tar.xz | tar xJC ${_pkgbase}

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
sha256sums=('43793b73f2e410c99db1cad95670166071342a070df7c1a74f66c4b356d3e583'
            '568ed5632a96505a539a98babf50a07eb5772ba2326b725c9c8ebd2bc3ba914a')
