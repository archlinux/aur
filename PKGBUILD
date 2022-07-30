# Maintainer: vale-max <anziolin@gmail.com>

pkgname=dab-scanner
pkgver=0.8
pkgrel=2
pkgdesc='A simple command line program based on the DAB library'
arch=(armv6h armv7h aarch64)
makedepends=(cmake rtl-sdr)
depends=(gcc-libs rtl-sdr)
url=https://github.com/JvanKatwijk/dab-cmdline
license=('GNU')
source=(
    https://github.com/vale-max/dab-cmdline/archive/refs/heads/master.zip
    rtsp-simple-server.service
    rtsp-simple-server.yml
)
sha256sums=('6ccd6391b357117f85c59aa79b9764aff32eace56e263e9a57b734a36e3bf811'
            'ce98603e2546897a24c0da21a10ebebd5cc6dd843a8a79cdacfab7150a95b8b5'
            'ae447a0ef6b23b95fd16f6ff27de793f8eaa9044ea243c2d976da6eb3cf8607d')

build() {
    subdir=$srcdir/dab-cmdline-master
    cd $subdir/dab-scanner
    cmake -DRTLSDR=ON
    make
    cd $subdir/example-3
    cmake -DRTLSDR=ON
    make
}

package() {
    gccver=$( pacman -Q gcc | cut -c 5-10 )
    depends=( 'gcc>='$gccver 'gcc-libs>='$gccver rtl-sdr rtsp-simple-server )
    install -Dm 755 rtsp-simple-server.service -t $pkgdir/etc/systemd/system
    install -Dm 755 rtsp-simple-server.yml -t $pkgdir/etc
    subdir=$srcdir/dab-cmdline-master
    cd $subdir/dab-scanner
    install -Dm 755 dab-scanner-rtlsdr -t $pkgdir/usr/bin
    cd $subdir/example-3
    install -Dm 755 dab-rtlsdr-3 -t $pkgdir/usr/bin
}
