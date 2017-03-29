# Maintainer: Anatoly Rugalev <anatoly.rugalev g-mail>

pkgname=simple-rt
pkgver=20170325.64_b07bef9
pkgrel=1
url="https://github.com/vvviperrr/SimpleRT"
pkgdesc="SimpleRT - Reverse Tethering utility for Android"
arch=('x86' 'x86_64')
depends=('libusb')
makedepends=('git' 'make')
source=('simple-rt::git://github.com/vvviperrr/SimpleRT' 'simple-rt.service')
md5sums=('SKIP' '0a06943e78519fca0ca242031a3ef2eb')
license=('GPLv3')

pkgver() {
	cd "$srcdir/$pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	cd "$srcdir/$pgkname/simple-rt/simple-rt-cli"
	# Default ArchLinux network interface name: enp5s0
	sed -i -- 's/eth0/enp5s0/' iface_up.sh
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/simple-rt"
	install -m755 "$srcdir/$pgkname/simple-rt/simple-rt-cli/simple-rt" "$pkgdir/usr/lib/simple-rt/simple-rt"
	install -m755 "$srcdir/$pgkname/simple-rt/simple-rt-cli/iface_up.sh" "$pkgdir/usr/lib/simple-rt/iface_up.sh"
	install -DT -m0755 "$srcdir/simple-rt.service" "$pkgdir/usr/lib/systemd/system/simple-rt.service"
}
