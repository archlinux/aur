# Maintainer: PureFallen <archlinux.snoring858@passmail.net>
# Contributor: Nogweii <packages@nogweii.net>

pkgname=poptracker
pkgver=0.32.1
pkgrel=1
pkgdesc='universal, scriptable randomizer tracking solution that is open source, runs everywhere and supports auto-tracking.'
arch=(x86_64)
# keep pkgname in upstream URL all lowercase as otherwise build path will break
url="https://github.com/black-sliver/poptracker"
license=(GPL3)
depends=(sdl2 sdl2_image sdl2_ttf openssl)
makedepends=(git)
source=("git+${url}.git#tag=v${pkgver}" poptracker.desktop)
sha256sums=('7868653e8a1b97e1d8ca8788ee9974e005d484948f7ceb6265dffe7f0685a68b'
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
