# requires multilib-devel on x86_64
pkgname=et-sdl-sound
pkgver=29
pkgrel=13
pkgdesc="Replacement for standard OSS sound system of Wolfenstein: Enemy Territory"
arch=('i686' 'x86_64')
url="http://github.com/nullkey/et-sdl-sound/"
license=('GPL')
depends_i686=('sdl' 'alsa-lib' 'alsa-plugins')
optdepends_i686=('libpulse: PulseAudio audio driver')
depends_x86_64=('lib32-sdl' 'lib32-alsa-lib' 'lib32-alsa-plugins')
optdepends_x86_64=('lib32-libpulse: Pulseaudio audio driver')
options=(!strip)
source=("git://github.com/nullkey/et-sdl-sound.git"
        "0001-Added-various-Arch-Linux-patches.patch"
        "enemy-territory.sh")
md5sums=('SKIP'
         'ae2853636171d15cb80ea2f7cf99e91e'
         '0c25da1545764f34122e90a9f49281ce')
_gitname="et-sdl-sound"

pkgver() {
    cd "$pkgbase"
    echo "$pkgver"
}

build() {
    cd "$pkgbase"

    if [[ "$CARCH" == "i686" ]]; then
        sed -i 's:/usr/lib32/:/usr/lib/:' ../enemy-territory.sh
    fi
    patch -Np1 -i ../0001-Added-various-Arch-Linux-patches.patch
    make
}

package() {
    cd "$pkgbase"

    if [[ "$CARCH" == "i686" ]]; then
        install -Dm 755 et-sdl-sound.so $pkgdir/usr/lib/et-sdl-sound.so
    else
        install -Dm 755 et-sdl-sound.so $pkgdir/usr/lib32/et-sdl-sound.so
    fi
    install -Dm 755 ../enemy-territory.sh $pkgdir/usr/bin/enemy-territory.sdl
}
