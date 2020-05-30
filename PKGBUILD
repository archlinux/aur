# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=muwire
pkgver=0.7.1
pkgrel=1
pkgdesc='An I2P file sharing program'
arch=('any')
url='https://muwire.com/'
license=('GPL3')
depends=('sh' 'java-runtime' 'hicolor-icon-theme')
makedepends=('gradle')
source=("https://github.com/zlatinb/muwire/archive/muwire-${pkgver}.tar.gz"
        '010-disable-dual-keys.patch'
        'muwire.desktop'
        'muwire.sh')
sha256sums=('316bfae58842c0f4591b90c2d1c632364fb54476b90128b68e2d6d1371321340'
            'e1f4fe1cd81a178c6bf4a237c2bf2a860496f08780097bd570cbe9d469564af2'
            'e3e425d872f3c8cd68037b4ffe71ec66d07148072db89f6af220e7b24881d633'
            'd9a21ba4b76e0e3f64f6e5826a0cc1cfb42f07a9378a7f8beffa5293c76c1672')

prepare() {
    # fix for i2pd
    patch -d "muwire-muwire-${pkgver}" -Np1 -i "${srcdir}/010-disable-dual-keys.patch"
}

build() {
    gradle -p "muwire-muwire-${pkgver}" clean assemble
}

package() {
    bsdtar -xf "muwire-muwire-${pkgver}/gui/build/distributions/gui-shadow-${pkgver}.tar" \
        -C "muwire-muwire-${pkgver}" --strip-components='2' "*/lib/gui-${pkgver}-all.jar"
    
    install -D -m755 muwire.sh "${pkgdir}/usr/bin/muwire"
    install -D -m644 muwire.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 "muwire-muwire-${pkgver}/gui-${pkgver}-all.jar" "${pkgdir}/usr/share/java/muwire.jar"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*x//')"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "muwire-muwire-${pkgver}/gui/griffon-app/resources" -maxdepth 1 -type f -name 'MuWire-*x*.png' -print0)
}
