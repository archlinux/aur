# Maintainer: vscncls <lucaslou4@protonmail.com>

pkgname=insomnia-src
_name=insomnia
pkgver=7.1.1
pkgrel=2
pkgdesc="Cross-platform HTTP and GraphQL Client (Build from source)"
url="https://github.com/Kong/insomnia"
arch=('x86_64' 'i686')
license=('MIT')
depends=('electron4')
makedepends=('nodejs-lts-dubnium')
provides=("$_name")
conflicts=("$_name")
source=(
    "git://github.com/Kong/insomnia.git"
    "${_name}.desktop"
    "${_name}.sh"
)
sha256sums=(
    'SKIP'
    '69358bb19108f09b78d97aba7d1813898858be449a13f2d8a6ad03cdce1400a8'
    'fbf24757aeaca7ceab18965774573bff2be540c948a47dd3f95c7b7857ef411c'
)

prepare() {
    cd $_name/packages/insomnia-app
    # Change package.json's electron version
    electronV=$(electron4 --version)
    electronVer=${electronV#v}
    sed -i "/\"electron\": \"/c\\\"electron\": \"$electronVer\"," package.json

    # Edit electron builder config so only the linux-unpacked package is built
    sed -i 's/"AppImage",//' .electronbuilder
    sed -i 's/"deb",//' .electronbuilder
    sed -i 's/"tar.gz",//' .electronbuilder
    sed -i 's/"snap",//' .electronbuilder
    sed -i 's/"rpm"/"dir"/' .electronbuilder

    sed -i "s#\"appId\": \"__APP_ID__\",#\"appId\": \"com.insomnia.app\",#" .electronbuilder
}

build() {
    cd $_name
    npm run bootstrap
    npm run app-package
}

package() {
    # Install asar file
    install -Dm644 $_name/packages/insomnia-app/dist/linux-unpacked/resources/app.asar $pkgdir/usr/share/insomnia/app.asar

    # Install start script
    install -Dm755 $_name.sh $pkgdir/usr/bin/$_name

    install -Dm644 $_name.desktop $pkgdir/usr/share/applications/$_name.desktop

    for size in 16 32 48 128 256 512; do
        install -Dm644 $_name/packages/insomnia-app/build/static/icon.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/insomnia.png"
    done

    install -Dm644 $_name/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
