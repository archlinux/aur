# Maintainer: vale-max <anziolin@gmail.com>

pkgname=dab-scanner
pkgver=0.8
pkgrel=1
pkgdesc='A simple command line program based on the DAB library'
arch=('armv6h' 'armv7h' 'aarch64')
makedepends=('cmake' 'rtl-sdr')
url='https://github.com/JvanKatwijk/dab-cmdline'
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
sha256sums=('SKIP')

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
    depends=(rtsp-simple-server)
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
