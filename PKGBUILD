# Maintainer: rern <rernrern@gmail.com>

pkgname=camillagui-backend
pkgver=1.0.0.rc4
pkgrel=1
pkgdesc='Backend server for camillagui'
url=https://github.com/HEnquist/camillagui-backend
arch=(any)
license=(GPL)
source=(https://github.com/HEnquist/camillagui-backend/archive/refs/tags/v${pkgver/.rc/-rc}.tar.gz
        camillagui.install
        camillagui.service
        camillagui.yml)
sha256sums=('8b61c3a18bbbdc1ed5e259e5e13122b698e3dff74e0ef708bd0b9f452232d6d6'
            '3700b298c9d63a407ac288ccdfa91019480ee923067ded70fdee1e34e4d09e85'
            '816138c492d68e291375971a95f88e13d665a21e39202dfce7443c57b4d1d240'
            'd2682fd4c0ae6ec9526a397e9419447e56b8652e2a1a8f53881290ec2e8079a2')

install=camillagui.install

build() {
    installdir=$srcdir/srv/http/settings/camillagui
    mkdir -p $installdir $installdir/build
    bsdtar xf v${pkgver/.rc/-rc}.tar.gz --strip=1 -C $installdir
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
