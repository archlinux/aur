# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=flemozi
pkgver=0.1.1
_tag=29a17ef5e18f69a2d5257dd03fc1c50ee79f5a2c
pkgrel=1
pkgdesc='An advanced Emoji Picker written with Flutter'
arch=('x86_64')
url="https://github.com/KRTirtho/flemozi"
license=('GPL3')
makedepends=('flutter' 'clang' 'cmake' 'ninja' 'gtk3' 'pkgconf' 'xz'
             'rust')
depends=('xdg-user-dirs' 'libkeybinder3')
source=("$pkgname-$pkgver::git+https://github.com/KRTirtho/flemozi.git#tag=$_tag"
        "flemozi")
sha256sums=('SKIP'
            'a1fee27ea9c31091baf4244cd96634ceb3245e050bfc7341d436eea6cfecdede')

prepare(){
    cd "$pkgname-$pkgver"

    flutter config --no-analytics
    flutter config --enable-linux-desktop
    flutter pub get
    cp .env.example .env
    flutter pub run build_runner build --delete-conflicting-outputs
}

build() {
    cd "$pkgname-$pkgver"
    flutter build linux --release
}

package() {
    # install the wrapper script that sets LD_LIBRARY
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

    cd "$pkgname-$pkgver"
    install -dm 755 "$pkgdir"/usr/bin/ "$pkgdir"/opt

    cp -rdp --no-preserve=ownership build/linux/x64/release/bundle/ "$pkgdir"/opt/$pkgname/
}
