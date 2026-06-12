# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Maintainer: hypevhs <hackgammavision at gmail dot com>

pkgname='oscgoesbrrr'
pkgver=2.1.17
pkgrel=1
pkgdesc='Make haptics in real life go BRRR from VRChat'
arch=('x86_64')
url='https://osc.toys/'
license=('CC-BY-NC-SA-4.0')
# waiting for electron40
_electron_ver=39
depends=("electron$_electron_ver")
makedepends=('node-gyp' 'pnpm' 'asar')
source=("OscGoesBrrr-$pkgver.tar.gz::https://github.com/OscToys/OscGoesBrrr/archive/refs/tags/v$pkgver.tar.gz"
        "LICENSE-v$pkgver::https://raw.githubusercontent.com/OscToys/OscGoesBrrr/refs/tags/v$pkgver/LICENSE"
        'oscgoesbrrr'
        'OscGoesBrrr.desktop')
sha256sums=('c292fd81ffaf08cf7a71a4795e068372504a68607dda67a51a1b7b2392a8082e'
            'fc17405da5786602c4667eb9b69e4bff644be78f5d96c489ae0fc7ddb9b5fd1d'
            '1d4e12d6aa0e615a90ad025acbb83e61580276c5329e3109e6b0beae983a1178'
            '4285dd7c558811c1f46c2313753490c8d35f0e83ee5c2ed898b191d440d98bb9')

build() {
    cd "OscGoesBrrr-$pkgver"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export XDG_CACHE_HOME="$srcdir"

    rm -rf .github
    rm -rf build
    rm -f CONTRIBUTING.md
    rm -f LICENSE
    rm -f .gitignore
    rm -f README.md

    pnpm install --frozen-lockfile --config.platform=linux --cpu="${!CARCH}"
    # pnpm install --frozen-lockfile --config.platform=linux --cpu="${!CARCH}" --prod --no-optional
    # pnpm audit --fix || :
    # pnpm install --no-frozen-lockfile --config.platform=linux --cpu="${!CARCH}" --no-optional
    pnpm run build

    local i686=ia32 x86_64=x64 armv7h=arm aarch64=arm64 riscv64=riscv64
    export NODE_ENV=production
    export NODE_OPTIONS='--openssl-legacy-provider'
    pnpm exec electron-builder --linux --"${!CARCH}" --dir \
        -c.electronDist="/usr/lib/electron$_electron_ver" \
        -c.electronVersion="$_electron_ver" \
        --config.extraMetadata.version="$pkgver"

    asar extract "dist/linux-unpacked/resources/app.asar" "dist/linux-unpacked/usr/lib/$pkgname/"
    rm -rf "dist/linux-unpacked/usr/lib/$pkgname/node_modules/native-reg"
    rm -rf "dist/linux-unpacked/usr/lib/$pkgname/node_modules/node-gyp-build"
    rmdir "dist/linux-unpacked/usr/lib/$pkgname/node_modules" 2>/dev/null || :

    sed -i -e "s#%ELECTRON_BINARY%#/usr/bin/electron$_electron_ver#" \
           -e "s#%APP_PATH%#/usr/lib/$pkgname#" ../oscgoesbrrr
}

package() {
    cd "OscGoesBrrr-$pkgver"

    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/lib"
    install -d -Dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r dist/linux-unpacked/usr/lib/$pkgname "$pkgdir/usr/lib"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 ../oscgoesbrrr -t "$pkgdir/usr/bin"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/icons"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 src/icons/ogb-logo.ico -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 src/icons/ogb-logo.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 ../OscGoesBrrr.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 ../LICENSE-v$pkgver "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
