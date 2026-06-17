# Maintainer: noideaman <pkgbuilds@weebvr.com>
# Based on the PKGBUILD of oscgoesbrr by Torge Matthies <openglfreak at googlemail dot com>

pkgname='arc-client'
_pkgname='ARC-Client'
pkgdesc='The transparent, feature-rich desktop bridge for VRChat remote control'
pkgver='0.93.1'
pkgrel='1'
arch=('x86_64')
url='https://arcosc.app/'
license=('Comfy Chloe Non-Commercial Copyleft License 1.2')
_electron_ver=39
_electron_full_ver=$(cat /usr/lib/electron${_electron_ver}/version | sed 's/^v//')
depends=("electron$_electron_ver")
makedepends=('node-gyp' 'npm' 'asar')
source=("ARC-Client-v$pkgver.tar.gz::https://codeload.github.com/ComfyChloe/$_pkgname/tar.gz/refs/tags/v$pkgver"
        'ARC-Client'
        'ARC-Client.desktop'
	'arc-client.png')
sha256sums=('e1b5e577e0d60edf5b6b8c8af2b941213910862594468227bddbea876df2c6b0'
            '993b283cd87f95728a825dffc97f7f72908903eda2fd7e6660f0983aff2f971a'
            '365440dc1c22876306b9d832e5d0adaa76b74a67ba0eaf4dafee9804a03b381d'
            'a315bea3d9ec1771340662c8e8cd9249d5fb69f4b3a0557bbe24c43a68560716')
build() {
    cd "$_pkgname-$pkgver"
    #sed -i "s/electronVersion:\ ../electronVersion:\ $pkgver/" package.json
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export XDG_CACHE_HOME="$srcdir"

    rm -rf .github build CONTRIBUTING.md .gitignore README.md

    npm install --cpu="${!CARCH}" --omit dev --omit optional --omit peer --no-bin-links
    npm audit fix || :
    npm run build

    local i686=ia32 x86_64=x64 armv7h=arm aarch64=arm64 riscv64=riscv64
    export NODE_ENV=production
    export NODE_OPTIONS='--openssl-legacy-provider'

    # Get full semver — electron-builder requires it, not just the major version
    local _electron_full_ver
    _electron_full_ver=$(electron${_electron_ver} --version | sed 's/^v//')

    npx electron-builder --linux --"${!CARCH}" --dir \
        -c.electronDist="/usr/lib/electron$_electron_ver" \
        -c.electronVersion="$_electron_full_ver"

    asar extract "dist/linux-unpacked/resources/app.asar" "dist/linux-unpacked/usr/lib/$_pkgname/"
    rm -rf "dist/linux-unpacked/usr/lib/$_pkgname/node_modules/native-reg"
    rm -rf "dist/linux-unpacked/usr/lib/$_pkgname/node_modules/node-gyp-build"
    rmdir "dist/linux-unpacked/usr/lib/$_pkgname/node_modules" 2>/dev/null || :

    sed -i -e "s#/usr/bin/electron\b#/usr/bin/electron$_electron_ver#" \
         -e "s#/usr/lib/ARC-Client\b#/usr/lib/$_pkgname#" ../ARC-Client
    sed -i -e "s/^Version=.*/Version=v$pkgver/" ../ARC-Client.desktop
}

package() {
    cd "$_pkgname-$pkgver"

    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/lib"
    install -d -Dm755 "$pkgdir/usr/lib/$_pkgname"
    cp -r dist/linux-unpacked/usr/lib/$_pkgname "$pkgdir/usr/lib"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 ../ARC-Client -t "$pkgdir/usr/bin"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/icons"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 ../arc-client.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 ../ARC-Client.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname"
}
