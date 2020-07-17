_basename=jitsi
_pkgname=meet
_tag=4294
_version=1.0.4294

pkgname=${_basename}-${_pkgname}-nightly
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Web"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=("nginx")
makedepends=(
        "python" "python2"
        "nodejs" "npm"
)
options=('!strip')
backup=(
  "etc/webapps/${pkgname}/logging_config.js"
  "etc/webapps/${pkgname}/config.js"
  "etc/webapps/${pkgname}/interface_config.js"
)
source=(
        "$pkgname::git+https://github.com/jitsi/jitsi-meet#tag=${_tag}"
)
groups=('jitsi-meet', 'celogeek')

build() {
        cd "$pkgname"
        npm install
        make
        make source-package
}

package() {
        cd "$srcdir/$pkgname"

        DESTDIR="${pkgdir}/usr/share/webapps/${pkgname}"
        CONFDIR="${pkgdir}/etc/webapps/${pkgname}"

        install -d "$DESTDIR"
        install -d "$CONFDIR"

        tar xjvf "jitsi-meet.tar.bz2" -C "$DESTDIR" --strip 1

        for c in $(ls "node_modules/i18n-iso-countries/langs")
        do
            install -m644 "node_modules/i18n-iso-countries/langs/${c}" "${DESTDIR}/lang/countries-${c}"
        done

        find "$DESTDIR" -type f -execdir sed -i "s#${srcdir}##g" "{}" \;
        find "$DESTDIR" -type d -exec chmod 755 {} \;

        for i in interface_config.js logging_config.js config.js
        do
                install -Dm644 "$DESTDIR/${i}" "$CONFDIR/${i}"
                ln -sf "/etc/webapps/${pkgname}/${i}" "$DESTDIR/${i}"
        done

        install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/debian/jitsi-meet/jitsi-meet.example doc/debian/jitsi-meet/jitsi-meet.example-apache config.js
        sed -i 's@/usr/share/jitsi-meet@/usr/share/webapps/'$pkgname'@' "${pkgdir}/usr/share/doc/${pkgname}/"*
        sed -i 's@/etc/jitsi/meet@/etc/webapps/'$pkgname'@' "${pkgdir}/usr/share/doc/${pkgname}/"*
        
        chown -R root:root "${pkgdir}"
}
sha256sums=('SKIP')
