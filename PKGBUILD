# Maintainer: Bruce Zhang
pkgname=mob
_name=Mob
pkgver=0.2.2
pkgrel=1
pkgdesc="一个有颜值的喜马拉雅桌面客户端"
arch=('x86_64' 'i686')
url="https://github.com/zenghongtu/Mob"
license=('GPL')
depends=('electron4')
makedepends=('yarn' 'jq' 'moreutils')
provides=('mob')
conflicts=('mob-bin')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/zenghongtu/$_name/archive/v$pkgver.tar.gz")
sha256sums=('27b049d6ad234345b4b7a723e1924c302b14857f901d800e15519730046103f7')

prepare() {
	cd "$_name-$pkgver"
	
	local cache="$srcdir/npm-cache"
    local dist=/usr/lib/electron4

    jq '.build.electronDist = $dist | .build.electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$(sed s/^v// $dist/version)" \
        package.json | sponge package.json

    export YARN_CACHE_FOLDER="$cache"
	yarn
}

build() {
	cd "$_name-$pkgver"
	yarn release:linux --dir
}

package() {
	cd "$srcdir/$_name-$pkgver/release/linux-unpacked/resources"
    install -Dm644 app.asar "$pkgdir/usr/share/mob/app.asar"

    cd "$srcdir/$_name-$pkgver/build/icons"
    for size in *x*.png; do
        install -Dm644 "$size" "$pkgdir/usr/share/icons/hicolor/${size%.png}/apps/mob.png"
    done

    cd "$srcdir"
    echo "#!/bin/env sh
exec electron4 /usr/share/mob/app.asar \$@
" > mob.sh
    echo "[Desktop Entry]
Name=Mob
Comment=一个高颜值并且实用的喜马拉雅桌面客户端。
Exec=/usr/bin/mob %U
Terminal=false
Type=Application
Icon=mob
StartupWMClass=Mob
Categories=Music;
" > mob.desktop

    install -Dm755 "$srcdir/mob.sh" "$pkgdir/usr/bin/mob"
    install -Dm644 "$srcdir/mob.desktop" "$pkgdir/usr/share/applications/mob.desktop"
}
