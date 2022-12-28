# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

_pkgname=moosync
pkgname=${_pkgname}-git
pkgrel=1
pkgver=v6.0.0.r1.g33ca3245
pkgdesc='A simple music player'
arch=('any')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${_pkgname}")
depends=('electron' 'libvips')
makedepends=('nvm' 'yarn' 'node-gyp')
source=("git+https://github.com/Moosync/Moosync.git" "${_pkgname}-prebuilt.tar::https://github.com/Moosync/Moosync/releases/download/v6.0.0/Moosync-6.0.0-linux-x64.pacman" moosync moosync.desktop builder-args.sh)
conflicts=("${_pkgname}")
sha256sums=('SKIP'
            '59f11f9e78486423dae41a54f553ef6658360a5b9df298b35b65b8093f065fb0'
            '36867efee6f9a491e64979ed329ce87f2136da2afcce4c9ef5696a9f2538d9ba'
            '4b63fa17717239db8a87ebeae1fdd96c5318b71d7d851d6c5a4f337793d3fecd'
            'bb106abfddfa388cdd9953b034e3176f87eac636932d793b2f5293576cc017bb')
_sourcedirectory="Moosync"

pkgver() {
  cd "$srcdir/$_sourcedirectory/"
  printf git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_sourcedirectory/"

    # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

    nvm install 18
    nvm use 18

    # Remove electron from package.json
    sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/electron/version")"'"|' 'package.json'

    yarn install

    . "$srcdir/builder-args.sh"
    yarn electron:build -- $ELECTRON_BUILDER_ARCH_ARGS --linux --dir 
}

package() {
    install -d "${pkgdir}/opt/Moosync/"

    # Move compiled app to pkgdir
    mv ${srcdir}/${_sourcedirectory}/dist_electron/linux*unpacked/* "${pkgdir}/opt/Moosync/"

    # Install icons
    for _size in 16 32 48 256 512; do
		install -Dm644 "${srcdir}/${_sourcedirectory}/build/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/moosync.png"
	done

    install -d "${pkgdir}/usr/bin"
    install "moosync" "${pkgdir}/usr/bin/moosync"

    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "moosync.desktop"
}
