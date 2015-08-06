pkgname=et-sdl-sound
pkgver=29
pkgrel=10
pkgdesc="Replacement for standard OSS sound system of Wolfenstein: Enemy Territory"
arch=('i686' 'x86_64')
url="http://nullkey.kapsi.fi/et-sdl-sound/"
license=('GPL')
depends_i686=('sdl' 'alsa-lib' 'alsa-plugins')
optdepends_i686=('libpulse: PulseAudio audio driver')
depends_x86_64=('lib32-sdl' 'lib32-alsa-lib' 'lib32-alsa-plugins')
optdepends_x86_64=('lib32-libpulse: Pulseaudio audio driver')
options=(!strip)
source=("http://nullkey.kapsi.fi/et-sdl-sound/archive/et-sdl-sound-r$pkgver.tar.gz"
        "0001-adlerweb-s-patches.patch"
        "0002-Fixed-CRC-for-ET2.60b-on-Arch-Linux.patch"
        "enemy-territory.sh")
md5sums=('77c2433fc757e5ffb08ec2c78a9853b3'
         'ddf378d41ffa50af8b1033fd343e2d64'
         'd8b0125b0b05150da2fb5d3e3e410bd7'
         '0c25da1545764f34122e90a9f49281ce')

build() {
    cd "$pkgbase"

    if [[ "$CARCH" == "i686" ]]; then
        sed -i 's:/usr/lib32/:/usr/lib/:' ../enemy-territory.sh
    fi
    patch -Np1 -i ../0001-adlerweb-s-patches.patch 
    patch -Np1 -i ../0002-Fixed-CRC-for-ET2.60b-on-Arch-Linux.patch
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
