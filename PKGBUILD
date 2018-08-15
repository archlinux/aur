# Maintainer: EHfive <eh5@sokka.cn>

pkgname=pulseaudio-modules-bt-git
pkgver=r21.2d4398a
pkgrel=1
pkgdesc="PulseAudio Bluetooth modules with Sony LDAC Codec(A2DP Source) support"
arch=("i686" "x86_64" "armv7h")
url="https://github.com/EHfive/pulseaudio-modules-bt"
license=('GPL3')
depends=("pulseaudio>=12.0" "libpulse>=12.0" "bluez>=5.0" "bluez-libs>=5.0" "sbc")
makedepends=("cmake>=3.0" "make" )
provides=("pulseaudio-bluetooth")
conflicts=("pulseaudio-bluetooth")
replaces=("pulseaudio-bluetooth")

source=("git+https://github.com/EHfive/pulseaudio-modules-bt.git"
        "git+https://github.com/pulseaudio/pulseaudio.git"
        "git+https://android.googlesource.com/platform/external/libldac.git")
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/pulseaudio-modules-bt"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/pulseaudio-modules-bt"
    rm -r pa libldac
    ln -sf -T "../pulseaudio" "pa"
    ln -sf -T "../libldac" "libldac"
    cd "pa"
    git checkout v12.2
}

build() {
    export CFLAGS=''
    cd "$srcdir/pulseaudio-modules-bt"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$srcdir/pulseaudio-modules-bt"
    make DESTDIR="$pkgdir" install
}