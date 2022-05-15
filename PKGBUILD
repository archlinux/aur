# Maintainer: rern <rernrern@gmail.com>

pkgname=camillagui-backend
pkgver=0.8.0
pkgrel=1
pkgdesc='Backend server for camillagui'
url=https://github.com/HEnquist/camillagui-backend
arch=(any)
license=(GPL)
install=camillagui.install
source=(https://github.com/HEnquist/camillagui-backend/archive/refs/tags/v$pkgver.tar.gz
        camillagui.install
        camillagui.service
        camillagui.yml)
sha256sums=('186bb43ee44e459a9ace22ed1b0f2d45e2218f3b2c763cdabe6c9cb91b1ae110'
            'c6786d57e06a59c204032358dec918b95a7a6c10a02956d37fcea92a5fdc7cd7'
            '816138c492d68e291375971a95f88e13d665a21e39202dfce7443c57b4d1d240'
            '15c0f36e5bebdfda8eb6d8cc5e34d8a6982a0b13eaf73f2d7478f48da1fe5587')

build() {
    installdir=$srcdir/srv/http/settings/camillagui
    mkdir -p $installdir
    bsdtar xf v$pkgver.tar.gz --strip=1 -C $installdir
    rm $installdir/{.gitignore,*.md,*.txt}
    rm -rf $installdir/{.github,build}
    sed -i 's/"build")$/"build", follow_symlinks=True)/' $installdir/backend/routes.py
    cp -f camillagui.yml $installdir/config
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
    mv $srcdir/srv $pkgdir
    install -d $pkgdir/$installdir
    install -Dm 644 camillagui.service -t $pkgdir/usr/lib/systemd/system
}
