# Maintainer: RangHo Lee <hibiki_love@rangho.moe>

pkgname=atheros-ar3012
pkgver=4.18.4
pkgrel=1
pkgdesc="Provides an alternate kernel module for those with malfunctioning AR3012 bluetooth hardware."
arch=('any')
url="https://kernel.org"
license=('GPL')
makedepends=('wget' 'make' 'gcc' 'linux-headers')
install=kernelmodule.install

prepare() {
	cd $srcdir
	
	export version=$(uname -r | cut -d '-' -f 1)

	if [ ! -e "./linux-$version.tar.xz" ]; then
		echo "Downloading appropriate kernel souce code..."
		wget "https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-$version.tar.xz"
	else
		echo "Appropriate Linux source already exists."
	fi

	tar -xvJf linux-$version.tar.xz


	cd linux-$version
	patch -p0 ./drivers/bluetooth/btusb.c < ../../atheros-ar3012.diff
}

pkgver() {
	cd $srcdir
	echo $version.r$(git rev-list --count HEAD)
}

build() {
	cd linux-$version/
	make mrproper
	cp /usr/lib/modules/$(uname -r)/build/.config ./
	cp /usr/lib/modules/$(uname -r)/build/Module.symvers ./
	make oldconfig

	make EXTRAVERSION=$(uname -r | sed -e 's/[[:digit:]]\.[[:digit:]][[:digit:]]*\.*[[:digit:]]*//g' -e 's/-ARCH//g') modules_prepare

	make M=drivers/bluetooth	
}

package() {	
	xz $srcdir/linux-$version/drivers/bluetooth/btusb.ko
	
	install -d $pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/bluetooth
	cp $srcdir/linux-$version/drivers/bluetooth/btusb.ko.xz \
		$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/bluetooth/
}
