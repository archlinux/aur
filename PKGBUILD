# Maintainer: vale-max <anziolin@gmail.com>

pkgname=dab-scanner
pkgver=0.8
pkgrel=1
pkgdesc='A simple command line program based on the DAB library'
arch=(armv6h armv7h aarch64)
makedepends=(cmake rtl-sdr)
depends=(gcc-libs rtl-sdr)
url=https://github.com/JvanKatwijk/dab-cmdline
license=('GNU')
source=(
    https://github.com/vale-max/dab-cmdline/archive/refs/heads/master.zip
    dablogo.jpg
    dablogo-thumb.jpg
    dab-skeleton.sh
    dabstart.sh
    override.conf
    rtsp-simple-server.yml
    dab-scanner.install
)
sha256sums=('6ccd6391b357117f85c59aa79b9764aff32eace56e263e9a57b734a36e3bf811'
            '64271d8dc2e69bf6c5c8256211d1f228ffa14b6981c34b16824b429372d1a6ae'
            '68858401ee4540c277a33dfb48f1322d29266777b9f1a44b91f59bdb48078e1e'
            '45e0fc8b7a68a6947d88745e601ca6f1716924f8b60db1889dc0db2c94224a77'
            '195bcecbc67e3c479bd710298d6e0a08f5b673720f26437bb75ea883e14a9f9e'
            'd99d3949379a408870f73d871a965ec9aa1e81bd4b5ecb9aea0210548719433e'
            'ae447a0ef6b23b95fd16f6ff27de793f8eaa9044ea243c2d976da6eb3cf8607d'
            '6254ae37ff94526bbb63f157f481b3fcdb79c4bdfb6b7590287768a6092add7c')

install=dab-scanner.install

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
    depends=(gcc-libs rtl-sdr rtsp-simple-server)
    install -Dm 755 override.conf -t $pkgdir/etc/systemd/system/rtsp-simple-server.d
    install -Dm 755 dablogo.jpg -t $pkgdir/srv/http/data/webradiosimg
    install -Dm 755 dablogo-thumb.jpg -t $pkgdir/srv/http/data/webradiosimg
    install -Dm 755 dab-skeleton.sh -t $pkgdir/srv/http/bash/dab
    install -Dm 755 dabstart.sh -t $pkgdir/srv/http/bash/dab
    install -Dm 755 rtsp-simple-server.yml -t $pkgdir/srv/http/bash/dab
    subdir=$srcdir/dab-cmdline-master
    cd $subdir/dab-scanner
    install -Dm 755 dab-scanner-rtlsdr -t $pkgdir/usr/bin
    cd $subdir/example-3
    install -Dm 755 dab-rtlsdr-3 -t $pkgdir/usr/bin
}
