# Maintainer: Joshua Schmeder <joshua@schmeder.dev>

pkgname=poptracker-git
_pkgname=${pkgname%-git}
pkgver=0.26.0.r4.gaafe839
pkgrel=1
pkgdesc='universal, scriptable randomizer tracking solution that is open source, runs everywhere and supports auto-tracking.'
arch=(x86_64)
url="https://github.com/black-sliver/$_pkgname"
license=(GPL3)
depends=(zenity which sdl2 sdl2_image sdl2_ttf openssl)
makedepends=(make git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git submodule update --init --recursive
}

build() {
	cd "$_pkgname"
    make native CONF=RELEASE
}

package() {
    cd "$_pkgname"
    install -Dm755 -t "$pkgdir/usr/share/$_pkgname" "build/linux-x86_64/$_pkgname"
    mkdir -p "$pkgdir/usr/bin"
    cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
cd /usr/share/$_pkgname
exec ./$_pkgname "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$_pkgname"
    # install assets to /usr/share/poptracker
    install -d "$pkgdir/usr/share/$_pkgname"
    cp -r assets "$pkgdir/usr/share/$_pkgname"
}
