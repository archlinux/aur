# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: Etienne Perot <etienne@perot.me>
pkgname=macchiato-git
_pkgname=macchiato
pkgver=20151123
pkgrel=1
pkgdesc='MAC spoofing with a restricted range of OUI prefixes'
arch=('any')
url='https://github.com/EtiennePerot/macchiato'
license=('BSD')
depends=('bash' 'iproute2')
makedepends=('git')
conflicts=('macchiato')
provides=('macchiato')
source=('git+https://github.com/EtiennePerot/macchiato.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir/${_pkgname}"
    install -D -m644 LICENSE.redistrib "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m755 macchiato "${pkgdir}/usr/share/macchiato/macchiato"
    install -D -m755 functions.sh "${pkgdir}/usr/share/macchiato/functions.sh"
    install -D -m755 install-udev-rules.sh "${pkgdir}/usr/share/macchiato/install-udev-rules.sh"
    for tdir in oui usage; do
        for tfile in "$tdir"/*; do
            install -D -m644 "$tfile" "${pkgdir}/usr/share/macchiato/$tfile"
        done
    done
    install -D -m644 systemd/macchiato.service "${pkgdir}/usr/lib/systemd/system/macchiato.service"
    install -D -m644 conf/sample.sh.example "${pkgdir}/usr/share/macchiato/conf/sample.sh.example"
    install -D -m644 conf/sample.sh.example "${pkgdir}/etc/macchiato.d/sample.sh.example"
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /usr/share/macchiato/macchiato "${pkgdir}/usr/bin/macchiato"
}
