# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname='oscgoesbrrr'
pkgdesc='Make haptics in real life go BRRR from VRChat'
pkgver='1.42.0'
pkgrel='1'
arch=('x86_64')
url='https://osc.toys/'
license=('CC-BY-NC-SA-4.0')
_electron_ver=38
depends=("electron$_electron_ver")
makedepends=('node-gyp' 'npm' 'asar')
source=("https://github.com/OscToys/OscGoesBrrr/archive/refs/tags/release/$pkgver.tar.gz"
        "LICENSE-v$pkgver::https://raw.githubusercontent.com/OscToys/OscGoesBrrr/refs/tags/release/$pkgver/LICENSE"
        'oscgoesbrrr'
        'OscGoesBrrr.desktop')
sha256sums=('c27a1e248c5f537208ceae32e7ac6a5430d2e9d5081a533792acf449cf63ffb4'
            'fc17405da5786602c4667eb9b69e4bff644be78f5d96c489ae0fc7ddb9b5fd1d'
            '17250df54b4cb3471f8b3baca68bd4686629a6e62f56c283ebd67036bae57cb9'
            'a02770d23b90d39de35ddb45b4910444339712885c905318ee81444ff98bdd2b')

build() {
    cd "OscGoesBrrr-release-$pkgver"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export XDG_CACHE_HOME="$srcdir"

    rm -rf .github
    rm -rf build
    rm -f CONTRIBUTING.md
    rm -f LICENSE
    rm -f .gitignore
    rm -f README.md

    npm install --cpu="${!CARCH}" --omit dev --omit optional --omit peer --no-bin-links
    npm audit fix || :
    npm run build

    local i686=ia32 x86_64=x64 armv7h=arm aarch64=arm64 riscv64=riscv64
    export NODE_ENV=production
    export NODE_OPTIONS='--openssl-legacy-provider'
    npx electron-builder --linux --"${!CARCH}" --dir \
        -c.electronDist="/usr/lib/electron$_electron_ver" \
        -c.electronVersion="$_electron_ver"

    asar extract "dist/linux-unpacked/resources/app.asar" "dist/linux-unpacked/usr/lib/$pkgname/"
    rm -rf "dist/linux-unpacked/usr/lib/$pkgname/node_modules/native-reg"
    rm -rf "dist/linux-unpacked/usr/lib/$pkgname/node_modules/node-gyp-build"
    rmdir "dist/linux-unpacked/usr/lib/$pkgname/node_modules" 2>/dev/null || :

    sed -i -e "s#\b/usr/bin/electron\b#/usr/bin/electron$_electron_ver#" \
         -e "s#\b/usr/lib/oscgoesbrrr\b#/usr/lib/$pkgname#" ../oscgoesbrrr
    sed -i -e "s/^Version=.*/Version=$pkgver/" ../OscGoesBrrr.desktop
}

package() {
    cd "OscGoesBrrr-release-$pkgver"

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
