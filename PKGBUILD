# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=7.1.0
pkgrel=1
pkgdesc='A simple music player'
arch=('any')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname}")
depends=('electron' 'libvips' 'alsa-lib')
makedepends=('yarn' 'node-gyp' 'cargo')
source=("${pkgname}-${pkgver}-prebuilt.tar::https://github.com/Moosync/Moosync/releases/download/v${pkgver}/Moosync-${pkgver}-linux-x64.pacman" "${pkgname}-${pkgver}.tar::https://github.com/Moosync/Moosync/archive/v${pkgver}.tar.gz" moosync moosync.desktop builder-args.sh)
sha256sums=('943b5abc7c2bb70ba8a536802c55dd557d9ccbfaf54dfd3681076ac5550ed76b'
            '708af19411fc03d18dbd4446d1c099eed80873144238531a45c6cb2d21712b4b'
            '36867efee6f9a491e64979ed329ce87f2136da2afcce4c9ef5696a9f2538d9ba'
            '4b63fa17717239db8a87ebeae1fdd96c5318b71d7d851d6c5a4f337793d3fecd'
            'bb106abfddfa388cdd9953b034e3176f87eac636932d793b2f5293576cc017bb')
_sourcedirectory="Moosync-$pkgver"

build() {
    cd "$srcdir/$_sourcedirectory/"

    # Remove electron from package.json
    sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/electron/version")"'"|' 'package.json'

    # Remove postinstall from package.json
    sed -i -e 's/\"postinstall\":.*/\"postinstall\": \"patch-package\",/' package.json

    yarn install --ignore-engines || true

    . "$srcdir/builder-args.sh"
    yarn electron:build -- $ELECTRON_BUILDER_ARCH_ARGS --linux --dir 
}

package() {
    install -d "${pkgdir}/opt/Moosync/"

    # Move compiled app to pkgdir
    mv ${srcdir}/${_sourcedirectory}/dist_electron/linux*unpacked/* "${pkgdir}/opt/Moosync/"

    ls "${pkgdir}/opt/Moosync/"

    rm -f "${pkgdir}/opt/Moosync/resources/app.asar"
    cp "${srcdir}/opt/Moosync/resources/app.asar" "${pkgdir}/opt/Moosync/resources/"

    # Install icons
    for _size in 16 32 48 256 512; do
		install -Dm644 "${srcdir}/${_sourcedirectory}/build/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/moosync.png"
	done

    install -d "${pkgdir}/usr/bin"
    install "moosync" "${pkgdir}/usr/bin/moosync"

    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "moosync.desktop"
}
