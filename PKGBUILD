# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=muwire-git
pkgver=0.8.10.r48.gc061ad05
pkgrel=1
pkgdesc='An I2P file sharing program (git version)'
arch=('any')
url='https://muwire.com/'
license=('GPL3')
depends=('sh' 'java-runtime' 'hicolor-icon-theme')
optdepends=('i2p-router: for connecting through a local I2P router')
makedepends=('git' 'gradle')
provides=('muwire')
conflicts=('muwire')
source=('git+https://github.com/zlatinb/muwire.git'
        'muwire.desktop'
        'muwire.sh')
sha256sums=('SKIP'
            '7d61c69613029bd2b2e82f227a230104b880635fd8d44a649b2192b03c3cc509'
            '14658d6978e5637691f5d8c923ffe2cf605e65988d6808a5eb23d3f37b13c283')

pkgver() {
    git -C muwire describe --long --tags | sed 's/^muwire-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    gradle -p muwire clean assemble
}

check() {
    gradle -p muwire test
}

package() {
    bsdtar -xf "muwire/gui/build/distributions/gui-shadow-${pkgver%%.r*}.tar" \
        -C muwire --strip-components='2' "*/lib/gui-${pkgver%%.r*}-all.jar"
    
    install -D -m755 muwire.sh "${pkgdir}/usr/bin/muwire"
    install -D -m644 muwire.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 "muwire/gui-${pkgver%%.r*}-all.jar" "${pkgdir}/usr/share/java/muwire.jar"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*x//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/muwire.png"
    done < <(find muwire/gui/griffon-app/resources -maxdepth 1 -type f -name 'MuWire-*x*.png' -print0)
}
