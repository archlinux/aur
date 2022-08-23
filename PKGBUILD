# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=muwire
pkgver=0.8.13
pkgrel=1
pkgdesc='An I2P file sharing program'
arch=('any')
url='https://muwire.com/'
license=('GPL3')
depends=('sh' 'java-runtime>=11' 'hicolor-icon-theme')
optdepends=('i2p-router: for connecting through a local I2P router')
makedepends=('git' 'gradle')
source=("git+https://github.com/zlatinb/muwire.git#tag=muwire-${pkgver}?signed"
        'muwire.desktop'
        'muwire.sh')
sha256sums=('SKIP'
            '7d61c69613029bd2b2e82f227a230104b880635fd8d44a649b2192b03c3cc509'
            '1db323740432a999a925813f8ea1e8fc2899cc5a7c10b5835692bcf1bd0dcd8d')
validpgpkeys=('471B9FD45517A5ED101FC57DA72832072D525E41') # Zlatin Balevsky

build() {
    gradle -p muwire clean assemble
}

check() {
    local _javamaj
    _javamaj="$(javac --version | awk '/javac/ { sub(/\..*/, "", $2); print $2 }')"
    
    [ "$_javamaj" -ge '19' ] && return 0
    gradle -p muwire test
}

package() {
    bsdtar -xf "muwire/gui/build/distributions/gui-shadow-${pkgver%%.r*}.tar" \
        -C muwire --strip-components='2' "*/lib/gui-${pkgver%%.r*}-all.jar"
    
    install -D -m755 muwire.sh "${pkgdir}/usr/bin/muwire"
    install -D -m644 muwire.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 "muwire/gui-${pkgver}-all.jar" "${pkgdir}/usr/share/java/muwire.jar"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*x//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find muwire/gui/griffon-app/resources -maxdepth 1 -type f -name 'MuWire-*x*.png' -print0)
}
