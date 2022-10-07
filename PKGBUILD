# Maintainer: Sebastian Meyer <aur@mailhell.seb7.de>

pkgname=mbmd-git
provides=('mbmd')
pkgver=r533.3b12dcc
pkgrel=1
pkgdesc='ModBus Measurement Daemon - simple reading of data from ModBus meters and grid inverters'
arch=('any')
url="https://github.com/volkszaehler/mbmd"
license=('BSD')
depends=()
optdepends=()
install=mbmd.install
makedepends=('go')
source=('git+https://github.com/volkszaehler/mbmd'
        'mbmd.service'
        'mbmd-users.conf'
)
sha256sums=('SKIP'
            '09c360375a89171772a36f8e467e1222f29eeb8ec440dc213ed0a975077cfb90'
            '2002b03f227257f7ae3be2047c76a5b75a039146232dbf94c277befcc29cc56d')

pkgver() {
    cd mbmd

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd mbmd

	make DESTDIR="${pkgdir}" install
    make build
}

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/etc/mbmd/"
    mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
	mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    mkdir -p "${pkgdir}/usr/share/mbmd/"
    
    cd "${srcdir}"
    install -Dm644 mbmd-users.conf "${pkgdir}/usr/lib/sysusers.d/mbmd.conf"
	install -Dm644 mbmd.service "${pkgdir}/usr/lib/systemd/system/"

    cd "mbmd"
    install -Dm755 mbmd "${pkgdir}/usr/bin/"
    install -Dm640 mbmd.dist.yaml "${pkgdir}/etc/mbmd/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/mbmd/"
}
