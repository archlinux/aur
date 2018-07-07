# Maintainer: Anatoly Rugalev <anatoly.rugalev g-mail>

pkgname=simple-rt
pkgver=20170510.132_c270fc9
pkgrel=2
url="https://github.com/vvviperrr/SimpleRT"
pkgdesc="SimpleRT - Reverse Tethering utility for Android"
arch=('x86' 'x86_64')
depends=('libusb' 'net-tools')
makedepends=('git' 'make')
source=('simple-rt::git://github.com/vvviperrr/SimpleRT' 'simple-rt@.service')
md5sums=('SKIP' 'abce660a402beaf33a2e964d140294d6')
license=('GPLv3')

pkgver() {
	cd "$srcdir/$pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	cd "$srcdir/simple-rt/simple-rt-cli"
	make
	export SIMPLERT_INTERFACE=$(ip link show | grep "state UP" | awk -F ': ' '{ print $2}')
        if [ `echo "$SIMPLERT_INTERFACE" | wc -l` -eq 1 ]; then 
                cat "$srcdir/simple-rt@.service" | sed -e "s/%i/$SIMPLERT_INTERFACE/g" > "$srcdir/simple-rt.service"
        fi
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/simple-rt"
	mkdir -p "$pkgdir/etc/systemd/system/multi-user.target.wants"
	install -m755 "$srcdir/simple-rt/simple-rt-cli/simple-rt" "$pkgdir/usr/lib/simple-rt/simple-rt"
	install -m755 "$srcdir/simple-rt/simple-rt-cli/iface_up.sh" "$pkgdir/usr/lib/simple-rt/iface_up.sh"
	install -DT -m0755 "$srcdir/simple-rt@.service" "$pkgdir/usr/lib/systemd/system/simple-rt@.service"
        if [ -e "$srcdir/simple-rt.service" ]; then 
                install -DT -m0755 "$srcdir/simple-rt.service" "$pkgdir/usr/lib/systemd/system/simple-rt.service"
        fi
}
