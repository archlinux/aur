# Maintainer: EHfive <eh5@sokka.cn>

pkgname=pulseaudio-modules-bt-git
pkgver=r40.b85507f
pkgrel=1
pkgdesc="PulseAudio Bluetooth modules with Sony LDAC Codec(A2DP Source) support"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/pulseaudio-modules-bt"
license=('GPL3')
depends=("pulseaudio>=12.0" "bluez>=5.0" "bluez-libs>=5.0" "sbc")
makedepends=("cmake>=3.0" "make" "pkg-config")
provides=("pulseaudio-bluetooth")
conflicts=("pulseaudio-bluetooth")
replaces=("pulseaudio-bluetooth")

source=("git+https://github.com/EHfive/pulseaudio-modules-bt.git"
        "git+https://github.com/pulseaudio/pulseaudio.git"
        "git+https://gitlab.com/eh5/libldac.git")

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
    git checkout v`pkg-config libpulse --modversion`
}

build() {
    cd "$srcdir/pulseaudio-modules-bt"
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/pulseaudio-modules-bt"
    make DESTDIR="$pkgdir" install
}