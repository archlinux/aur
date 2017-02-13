# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=osu-native-git
pkgver=r1687.3136bbe
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
        "git+https://github.com/ppy/osu-framework.git"
        "git+https://github.com/ppy/osu-resources.git"
        "osu-native")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'bd479f1c1b6e175dc1cb78f32b69a519adc0429ee647771687bf9b69cfb89668')

pkgver() {
	cd "$srcdir/osu"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/osu"
    git submodule init
    git config submodule.osu-framework.url $srcdir/osu-framework
    git config submodule.osu-resources.url $srcdir/osu-resources
    git submodule update
    nuget restore
}

build() {
    cd "$srcdir/osu"
    xbuild /p:Configuration=Release || true
    # Temporary workaround: for some reason xbuild only works the second time it's invoked
    xbuild /p:Configuration=Release
}

package() {
    cd "$srcdir/osu"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/osu-native-git/LICENSE-osu"
    install -Dm644 osu-resources/LICENCE.md "$pkgdir/usr/share/licenses/osu-native-git/LICENSE-resources"
    cd "osu.Desktop/bin/Release"
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
