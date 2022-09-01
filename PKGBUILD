# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=5.0.0
pkgrel=2
pkgdesc='A simple music player'
arch=('any')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname}")
depends=('electron' 'libvips')
makedepends=('nodejs' 'yarn' 'node-gyp')
source=("${pkgname}-${pkgver}-prebuilt.tar::https://github.com/Moosync/Moosync/releases/download/v${pkgver}/Moosync-${pkgver}-linux-x64.pacman" "${pkgname}-${pkgver}.tar::https://github.com/Moosync/Moosync/archive/v${pkgver}.tar.gz" moosync moosync.desktop)
sha256sums=('c0e2cddb27fbbbf1e3b690bca0c613b306fd546d2935e5f0b9a1b0655ea81a5e'
            '0c3e08271ebb237778e8411cc716805483f51df1713d0cdc67fecfd8001d95f5'
            '36867efee6f9a491e64979ed329ce87f2136da2afcce4c9ef5696a9f2538d9ba'
            '4b63fa17717239db8a87ebeae1fdd96c5318b71d7d851d6c5a4f337793d3fecd')
_sourcedirectory="Moosync-$pkgver"

build() {
    cd "$srcdir/$_sourcedirectory/"

    # Remove electron from package.json
    sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/electron/version")"'"|' 'package.json'

    YARN_CHECKSUM_BEHAVIOR=update yarn install
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
