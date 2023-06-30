# Maintainer: rern <rernrern@gmail.com>

pkgname=camillagui-backend
pkgver=1.0.0.rc5
pkgrel=1
pkgdesc='Backend server for camillagui'
url=https://github.com/HEnquist/camillagui-backend
arch=(any)
license=(GPL)
source=(https://github.com/HEnquist/camillagui-backend/archive/refs/tags/v${pkgver/.rc/-rc}.tar.gz
        camillagui.install
        camilladsp.service
        camillagui.service
        camilladsp.yml)
sha256sums=('dc2479998c8224077ba13be26e9ceca55b69731b12f14262c8e118c4d46ac23e'
            'dbbb1e31754eb4b2e0d3c852845799b1cea8467efe4dda8db22124b537dbb954'
            '993f05f04e1627b1739046e3c59d880deec1d4849525fa0e633dda5493923b48'
            '816138c492d68e291375971a95f88e13d665a21e39202dfce7443c57b4d1d240'
            '4d645a08c550a5a0c6dd9b93b3511f1f79a7127d084bb0fe4c64ce8ecb0a2588')
			
install=camillagui.install

build() {
	guidir=$srcdir/srv/http/settings/camillagui
    mkdir -p $guidir
    bsdtar xf v${pkgver/.rc/-rc}.tar.gz --strip=1 -C $guidir
    rm $guidir/{.gitignore,*.md,*.txt}
    rm -rf $guidir/{.github,build}
}

package() {
    depends=(camilladsp
             python-aiohttp
             python-jsonschema
             python-matplotlib
             python-numpy
             python-pycamilladsp
             python-pycamilladsp-plot
             python-websocket-client
             python-websockets
             python-yaml)
	dspdir=$pkgdir/srv/http/data/camilladsp
	systemdir=$pkgdir/usr/lib/systemd/system
	cp -rf $srcdir/srv $pkgdir
    install -d $dspdir/{coeffs,configs} $systemdir
    install -Dm 755 camilladsp.yml -t $dspdir/configs
    install -Dm 644 camilladsp.service camillagui.service -t $systemdir
}
