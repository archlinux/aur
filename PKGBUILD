# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=3.0.0
pkgrel=1
pkgdesc='A simple music player'
arch=('any')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname}")
depends=('electron' 'libvips')
makedepends=('nodejs-lts-gallium' 'yarn')
source=("${pkgname}-${pkgver}-prebuilt.tar::https://github.com/Moosync/Moosync/releases/download/v${pkgver}/Moosync-${pkgver}-linux-x64.pacman" "${pkgname}-${pkgver}.tar::https://github.com/Moosync/Moosync/archive/v${pkgver}.tar.gz" moosync moosync.desktop)
sha256sums=('07f2cc90c15ee42ab47f98e3e0a7c6f5c22ebfcaed95750e09062cf27a316b43'
            'bf310f9a14979f83740e0ed07d94e61f44c171a77864227806c7b4481d5c8609'
            '36867efee6f9a491e64979ed329ce87f2136da2afcce4c9ef5696a9f2538d9ba'
            '4b63fa17717239db8a87ebeae1fdd96c5318b71d7d851d6c5a4f337793d3fecd')
_sourcedirectory="Moosync-$pkgver"

build() {
    cd "$srcdir/$_sourcedirectory/"

    # Remove electron from package.json
    sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/electron/version")"'"|' 'package.json'

    yarn install
}

package() {
    cd ${srcdir}

    local _prebuiltpath="${srcdir}/opt/Moosync"

    install -d "${pkgdir}/opt/Moosync/resources/app.asar.unpacked/node_modules"

    cd "${srcdir}/${_sourcedirectory}/node_modules"
    find . -name '*.node' -exec cp --parents \{\} /"${pkgdir}/opt/Moosync/resources/app.asar.unpacked/node_modules" \;

    cp -R ${srcdir}/${_sourcedirectory}/node_modules/sharp "${pkgdir}/opt/Moosync/resources/app.asar.unpacked/node_modules/"
    cp -R "${_prebuiltpath}/resources/app.asar" "${pkgdir}/opt/Moosync/resources/app.asar"
    cp ${_prebuiltpath}/resources/app.asar.unpacked/*.js ${pkgdir}/opt/Moosync/resources/app.asar.unpacked/

    for _size in 16 32 48 256 512; do
		install -Dm644 "${srcdir}/${_sourcedirectory}/build/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/moosync.png"
	done

    cd "$srcdir"
    install -d "${pkgdir}/usr/bin"
    install "moosync" "${pkgdir}/usr/bin/moosync"

    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "moosync.desktop"
}
