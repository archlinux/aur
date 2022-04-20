# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=muwire-git
pkgver=0.8.12.r0.gf2b2c203
pkgrel=1
pkgdesc='An I2P file sharing program (git version)'
arch=('any')
url='https://muwire.com/'
license=('GPL3')
depends=('sh' 'java-runtime>=11' 'hicolor-icon-theme')
optdepends=('i2p-router: for connecting through a local I2P router')
makedepends=('git' 'gradle')
provides=('muwire')
conflicts=('muwire')
source=('git+https://github.com/zlatinb/muwire.git'
        'muwire.desktop'
        'muwire.sh')
sha256sums=('SKIP'
            '7d61c69613029bd2b2e82f227a230104b880635fd8d44a649b2192b03c3cc509'
            '390c11231788eb36601d68c74dc08bf94422792c098926444c688f92a143f599')

pkgver() {
    git -C muwire describe --long --tags | sed 's/^\(muwire\|plugin\)-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    gradle -p muwire clean assemble
}

check() {
    local _javamaj
    _javamaj="$(javac --version | awk '/javac/ { sub(/\..*/, "", $2); print $2 }')"
    
    [ "$_javamaj" -ge '18' ] && return 0
    gradle -p muwire test
}

package() {
    local _ver
    _ver="$(sed 's/\.[br].*//' <<< "$pkgver")"
    
    bsdtar -xf "muwire/gui/build/distributions/gui-shadow-${_ver}.tar" \
        -C muwire --strip-components='2' "*/lib/gui-${_ver}-all.jar"
    
    install -D -m755 muwire.sh "${pkgdir}/usr/bin/muwire"
    install -D -m644 muwire.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 "muwire/gui-${_ver}-all.jar" "${pkgdir}/usr/share/java/muwire.jar"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*x//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/muwire.png"
    done < <(find muwire/gui/griffon-app/resources -maxdepth 1 -type f -name 'MuWire-*x*.png' -print0)
}
