# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=flemozi
pkgver=0.2.0
_tag=f600a886be52a3e9210eb8825b4bca08b8e0108d
_flutter_version=3.13.3
pkgrel=1
pkgdesc='An advanced Emoji Picker written with Flutter'
arch=('x86_64')
url="https://github.com/KRTirtho/flemozi"
license=('GPL3')
makedepends=('clang' 'cmake' 'ninja' 'gtk3' 'pkgconf' 'xz' 'rustup' 'git')
depends=('xdg-user-dirs' 'libkeybinder3')
source=("$pkgname-$pkgver::git+https://github.com/KRTirtho/flemozi.git#tag=$_tag"
        # we vendor flutter as they advise to do so:
        # https://github.com/flutter/flutter/issues/129143#issuecomment-1599638479
        "flutter-${_flutter_version}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_version}-stable.tar.xz"
        "flemozi")
sha256sums=('SKIP'
            'c53c8aeff17d13c4c0b47bff2c54a293e48286e03dd089f37d561737e41a8c2c'
            'a1fee27ea9c31091baf4244cd96634ceb3245e050bfc7341d436eea6cfecdede')

prepare(){
    rustup install stable
    rustup default stable

    cd "$pkgname-$pkgver"

    "${srcdir}/flutter/bin/flutter" config --no-analytics
    "${srcdir}/flutter/bin/flutter" config --enable-linux-desktop
    "${srcdir}/flutter/bin/flutter" pub get
    cp .env.example .env
    "${srcdir}/flutter/bin/flutter" pub run build_runner build --delete-conflicting-outputs
}

build() {
    cd "$pkgname-$pkgver"
    "${srcdir}/flutter/bin/flutter" build linux --release
}

package() {
    # install the wrapper script that sets LD_LIBRARY
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

    cd "$pkgname-$pkgver"
    install -dm 755 "$pkgdir"/usr/bin/ "$pkgdir"/opt

    cp -rdp --no-preserve=ownership build/linux/x64/release/bundle/ "$pkgdir"/opt/$pkgname/
}
