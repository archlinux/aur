# Maintainer: Anatoly Rugalev <anatoly.rugalev g-mail>

pkgname=simple-rt
pkgver=20211207_e9760dd
pkgrel=2
url="https://github.com/robinpaulson/SimpleRT"
pkgdesc="SimpleRT - Reverse Tethering utility for Android"
arch=('x86' 'x86_64')
depends=('libusb' 'net-tools')
makedepends=('git' 'make')
source=('simple-rt::git+https://github.com/robinpaulson/SimpleRT' 'simple-rt@.service')
md5sums=('SKIP' 'abce660a402beaf33a2e964d140294d6')
license=('GPLv3')
install='simple-rt.install'

pkgver() {
	cd "$srcdir/$pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local commit=$(git rev-parse --short HEAD)
	echo "${date}_${commit}"
}

build() {
    cd "$srcdir/simple-rt/simple-rt-cli"
    make iface_up_sh_path=/usr/libexec/simple-rt
	export SIMPLERT_INTERFACE=$(ip link show | grep "state UP" | awk -F ': ' '{ print $2}')
	if [ `echo "$SIMPLERT_INTERFACE" | wc -l` -eq 1 ]; then 
		cat "$srcdir/simple-rt@.service" | sed -e "s/%i/$SIMPLERT_INTERFACE/g" > "$srcdir/simple-rt.service"
	fi
}

package() {
	mkdir -p "$pkgdir/usr/lib/simple-rt"
	mkdir -p "$pkgdir/usr/libexec/simple-rt"
	mkdir -p "$pkgdir/etc/systemd/system/multi-user.target.wants"
	install -m755 "$srcdir/simple-rt/simple-rt-cli/simple-rt" "$pkgdir/usr/lib/simple-rt/simple-rt"
	install -m755 "$srcdir/simple-rt/simple-rt-cli/iface_up.sh" "$pkgdir/usr/libexec/simple-rt/iface_up.sh"
	install -DT -m0755 "$srcdir/simple-rt@.service" "$pkgdir/usr/lib/systemd/system/simple-rt@.service"
	if [ -e "$srcdir/simple-rt.service" ]; then 
		install -DT -m0755 "$srcdir/simple-rt.service" "$pkgdir/usr/lib/systemd/system/simple-rt.service"
	fi
}
