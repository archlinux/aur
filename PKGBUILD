# Maintainer: Nogweii <packages@nogweii.net>

pkgname=poptracker
pkgver=0.30.1
pkgrel=1
pkgdesc='universal, scriptable randomizer tracking solution that is open source, runs everywhere and supports auto-tracking.'
arch=(x86_64)
url="https://github.com/black-sliver/poptracker"
license=(GPL3)
depends=(sdl2 sdl2_image sdl2_ttf openssl)
source=("git+${url}.git#tag=v${pkgver}" poptracker.desktop)
sha256sums=('SKIP'
            '6d84910cabcadf7c14bc74fc4c1fc6e3402ee8bbcce07d6e7b4609ea456fd8e7')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname"
    make native CONF=RELEASE
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/share/$pkgname" "build/linux-x86_64/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
cd /usr/share/$pkgname
exec ./$pkgname "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # install assets to /usr/share/poptracker
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r assets "$pkgdir/usr/share/$pkgname"

    install -Dm644 -t "$pkgdir/usr/share/applications" ../poptracker.desktop
}
