# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=2.0.0
pkgrel=1
pkgdesc='A simple music player'
arch=('any')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname}")
depends=('electron' 'libvips')
makedepends=('nodejs-lts-gallium' 'yarn')
source=("${pkgname}-${pkgver}.tar::https://github.com/Moosync/Moosync/archive/v${pkgver}.tar.gz" moosync moosync.desktop)
sha256sums=('2b3cb52b97f2d600f28a2e299dd7e905bc815c859c3ab4c2627c3b51e0705e10'
            '36867efee6f9a491e64979ed329ce87f2136da2afcce4c9ef5696a9f2538d9ba'
            '4b63fa17717239db8a87ebeae1fdd96c5318b71d7d851d6c5a4f337793d3fecd')
_sourcedirectory="Moosync-$pkgver"

prepare() {
    cd "$srcdir/$_sourcedirectory/"
    
    # Remove electron from package.json
    sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/electron/version")"'"|' 'package.json'


    # Change electronDist from electron18 to electron
    sed -E -i 's/electron18/electron/g' vue.config.js

    yarn install
}

build() {
    cd "$srcdir/$_sourcedirectory/"

    yarn electron:build --linux --dir
}

package() {
    cd "$srcdir/$_sourcedirectory/"
    local _outpath='dist_electron/linux-unpacked'

    # Place files
    install -d "${pkgdir}/opt/Moosync"
    cp -R "${_outpath}/resources" "${pkgdir}/opt/Moosync/resources"

    for _size in 16 32 48 256 512; do
		install -Dm644 "build/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/moosync.png"
	done

    cd "$srcdir"
    install -d "${pkgdir}/usr/bin"
    install "moosync" "${pkgdir}/usr/bin/moosync"

    # Edit desktop entry executable path
    # sed -i "s/opt\/Moosync\/moosync/usr\/bin\/moosync/g" "${srcdir}/usr/share/applications/moosync.desktop"

    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "moosync.desktop"
    # install -dm755 "${pkgdir}/usr/share/icons/hicolor/"
    # cp -R "${srcdir}/usr/share/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}
