# Maintainer: noideaman <pkgbuilds@weebvr.com>
# Based on the PKGBUILD of oscgoesbrr by Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Comfy Chloe <https://github.com/ComfyChloe>

pkgname='ARCOSC-Client'
pkgdesc='The transparent, feature-rich desktop bridge for VRChat remote control'
pkgver='0.90.2'
pkgrel='2'
arch=('x86_64')
url='https://arcosc.app/'
license=('CC-BY-NC-SA-4.0')
_electron_ver=39
_electron_full_ver=$(cat /usr/lib/electron${_electron_ver}/version | sed 's/^v//')
depends=("electron$_electron_ver")
makedepends=('node-gyp' 'npm' 'asar')
source=("ARCOSC-Client-v$pkgver.tar.gz::https://codeload.github.com/ComfyChloe/$pkgname/tar.gz/refs/tags/v$pkgver"
        'ARCOSC-Client'
        'ARCOSC-Client.desktop'
	'arcosc.png')
sha256sums=('9100d77867aa1a80a0494fd2a273391c8ea2ec0bfd51d9309ac4a614b2e3f74e'
            '7fa83c96a56f59e95f7491d3d05e7564b2b25d6aa545d568857fee2054746fee'
            '5dae1186e7a6ba1785455c294f4542880275dc5a4a8bca47fa5dedb01ed7c446'
            'a315bea3d9ec1771340662c8e8cd9249d5fb69f4b3a0557bbe24c43a68560716')

build() {
    cd "$pkgname-$pkgver"
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

    asar extract "dist/linux-unpacked/resources/app.asar" "dist/linux-unpacked/usr/lib/$pkgname/"
    rm -rf "dist/linux-unpacked/usr/lib/$pkgname/node_modules/native-reg"
    rm -rf "dist/linux-unpacked/usr/lib/$pkgname/node_modules/node-gyp-build"
    rmdir "dist/linux-unpacked/usr/lib/$pkgname/node_modules" 2>/dev/null || :

    sed -i -e "s#/usr/bin/electron\b#/usr/bin/electron$_electron_ver#" \
         -e "s#/usr/lib/ARCOSC-Client\b#/usr/lib/$pkgname#" ../ARCOSC-Client
    sed -i -e "s/^Version=.*/Version=v$pkgver/" ../ARCOSC-Client.desktop
}

package() {
    cd "ARCOSC-Client-$pkgver"

    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/lib"
    install -d -Dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r dist/linux-unpacked/usr/lib/$pkgname "$pkgdir/usr/lib"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 ../ARCOSC-Client -t "$pkgdir/usr/bin"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/icons"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 ../arcosc.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 ../ARCOSC-Client.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
}
