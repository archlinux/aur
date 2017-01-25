# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=osu-native-git
pkgver=r1285.23938a8
pkgrel=1
pkgdesc="rhythm is just a *click* away! (FLOSS version)"
arch=('i686' 'x86_64')
url="https://github.com/ppy/osu"
license=('MIT' 'CUSTOM:CC-BY-NC-4.0')
depends=('mono')
makedepends=('nuget')
options=()
provides=('osu-native')
source=("git+https://github.com/ppy/osu.git"
        "osu-native")
sha256sums=('SKIP'
            'bd479f1c1b6e175dc1cb78f32b69a519adc0429ee647771687bf9b69cfb89668')

pkgver() {
	cd "$srcdir/osu"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/osu"
    git submodule update --init
    nuget restore
}

build() {
    cd "$srcdir/osu"
    xbuild
}

package() {
    cd "$srcdir/osu"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/osu-native-git/LICENSE-osu"
    install -Dm644 osu-resources/LICENCE.md "$pkgdir/usr/share/licenses/osu-native-git/LICENSE-resources"
    cd "osu.Desktop/bin/Debug"
    mkdir -p "$pkgdir/opt/osu-native-git/"
    mkdir -p "$pkgdir/opt/osu-native-git/x86/"
    mkdir -p "$pkgdir/opt/osu-native-git/x64/"
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm755 "osu!.exe" "$pkgdir/opt/osu-native-git/osu!.exe"
    cp *.dll "$pkgdir/opt/osu-native-git/"
    cp x86/*.dll "$pkgdir/opt/osu-native-git/x86/"
    cp x64/*.dll "$pkgdir/opt/osu-native-git/x64/"
    cp *.config "$pkgdir/opt/osu-native-git/"
    cp *.so "$pkgdir/opt/osu-native-git/"
    install -Dm755 "$srcdir/osu-native" "$pkgdir/usr/bin/osu-native"
}
