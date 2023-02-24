# Maintainer: éclairevoyant

pkgbase=im-emoji-picker-git
pkgname=('fcitx5-im-emoji-picker-git' 'ibus-im-emoji-picker-git')
pkgver=1.0.1.r5.g06b140b
pkgrel=1
pkgdesc='Qt 5-based emoji picker'
arch=('x86_64')
url=https://github.com/GaZaTu/im-emoji-picker
license=('MIT')
depends=('qt5-base' 'icu' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'fcitx5' 'ibus')
provides=('im-emoji-picker')
conflicts=('im-emoji-picker')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd im-emoji-picker
    git describe --long --tags --exclude nightly-build | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd im-emoji-picker

    mkdir -p build-fcitx5
    cd build-fcitx5
    cmake -DCMAKE_BUILD_TYPE=None -DONLY_FCITX5=1 ..
    make

    cd ..

    mkdir -p build-ibus
    cd build-ibus
    cmake -DCMAKE_BUILD_TYPE=None -DONLY_IBUS=1 ..
    make
}

package_fcitx5-im-emoji-picker-git() {
    pkgdesc+=' (Fcitx5 module)'
    depends+=('fcitx5')

    cd im-emoji-picker
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/im-emoji-picker/"
    install -Dm644 src/res/im-emoji-picker_32x32.png \
         "$pkgdir/usr/share/icons/hicolor/32x32/apps/im-emoji-picker.png"

    install -Dm644 fcitx5-addon.conf \
         "$pkgdir/usr/share/fcitx5/addon/fcitx5imemojipicker.conf"
    install -Dm644 build-fcitx5/fcitx5imemojipicker.so -t "$pkgdir/usr/lib/fcitx5/"
}

package_ibus-im-emoji-picker-git() {
    pkgdesc+=' (IBus)'
    depends+=('ibus')

    cd im-emoji-picker
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/im-emoji-picker/"
    install -Dm644 src/res/im-emoji-picker_32x32.png \
         "$pkgdir/usr/share/icons/hicolor/32x32/apps/im-emoji-picker.png"

    install -Dm644 ibus-component.xml \
          "$pkgdir/usr/share/ibus/component/ibusimemojipicker.xml"
    install -Dm644 build-ibus/ibusimemojipicker -t "$pkgdir/usr/lib/ibus/"
}
