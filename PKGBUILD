# Maintainer: noideaman <pkgbuilds@weebvr.com>
# Based on the PKGBUILD of oscgoesbrr by Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Comfy Chloe <https://github.com/ComfyChloe>

pkgname='arcosc-client'
_sourcename='ARC-Client'
pkgdesc='The transparent, feature-rich desktop bridge for VRChat remote control'
pkgver='0.90.2'
pkgrel='4'
arch=('x86_64')
url='https://arcosc.app/'
install=arcosc-client.install
license=('CC-BY-NC-SA-4.0')
_electron_ver=39
_electron_full_ver=$(cat /usr/lib/electron${_electron_ver}/version | sed 's/^v//')
depends=("electron$_electron_ver")
makedepends=('node-gyp' 'npm' 'asar')
source=("ARCOSC-Client-v$pkgver.tar.gz::https://codeload.github.com/ComfyChloe/$_sourcename/tar.gz/refs/tags/v$pkgver"
        'ARCOSC-Client'
        'ARCOSC-Client.desktop'
	'arcosc.png')
sha256sums=('7ae65876b590a694882a4dba49b7a54d62dba6cddcfd4a82e69b4f1799cd23bb'
            '6c648362b81f8b6a571ec92d121efb82d8de6d0be5842d515f04200cdcd277c3'
            '5dae1186e7a6ba1785455c294f4542880275dc5a4a8bca47fa5dedb01ed7c446'
            'a315bea3d9ec1771340662c8e8cd9249d5fb69f4b3a0557bbe24c43a68560716')
build() {
    cd "$_sourcename-$pkgver"
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
    cd "$_sourcename-$pkgver"

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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
post_install() {
	echo "This is an older version"
	echo "It will stay this version"
	echo "A new one under a new license"
	echo "avaliable at"
	echo "https://aur.archlinux.org/packages/arc-client"
}
post_upgrade () {
	post_install
}
