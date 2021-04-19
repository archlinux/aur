# Maintainer: Aleksandr <contact at via dot aur>
pkgname=nftables-geoip-sets-git
pkgver=r39.c43f82e
pkgrel=2
pkgdesc="GeoIP Database for nftables"
arch=('any')
license=('GPL-3.0')
url="https://github.com/chr0mag/geoipsets"
depends=('curl' 'unzip' 'python-geoip2')
provides=("${pkgname%-git}")
install='install'
source=('nftables-geoip-sets::git+git://github.com/chr0mag/geoipsets.git')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    sed -i 's|/usr/local/share|/usr/share|' systemd/update-geoipsets.service
    sed -i 's|/usr/local/bin|/usr/lib/systemd/scripts|' systemd/update-geoipsets.service
}

build() {
    cd "${srcdir}/${pkgname%-git}/python"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}/python"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    cd "${srcdir}/${pkgname%-git}"
    install -d -m 755 "${pkgdir}"/usr/share/geoipsets
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README.md
    install -Dm644 -t "${pkgdir}/etc" bash/bcs.conf
    install -Dm644 -t "${pkgdir}/etc" python/geoipsets.conf
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}/bash" bash/README.md
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}/python" python/README.md
    install -Dm755 -t "${pkgdir}/usr/lib/systemd/scripts" bash/build-country-sets.sh
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" systemd/update-geoipsets.service
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" systemd/update-geoipsets.timer
}
md5sums=('SKIP')

