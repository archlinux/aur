# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgbase_=zram-tools
pkgname_=$pkgbase_
pkgname=zramswap
debver=0.3.7-1
pkgver=0.3.7
pkgrel=1
pkgdesc="Set up swap in zram to compress memory ($pkgbase_)"
arch=("any")
url="https://wiki.archlinux.org/title/Zram"
url_="https://deb.debian.org/debian/pool/main/${pkgbase_:0:1}/$pkgbase_"
license=("ISC")
options=(!debug)
provides=("$pkgname_")
backup=("etc/default/$pkgname")
source=(${url_}/${pkgname_}_${debver}_all.deb)
sha256sums=("2c14b4bf37f84197cd0f6b8928d3b44009e524ef9a0b26bbd8028d65e746af6a")
# https://tracker.debian.org/pkg/zram-tools

package() {
	cd -- "$srcdir/"
	tar fx "data.tar.xz"

	mkdir "usr/share/licenses/$pkgname_/" -p
	mv -T "usr/share"/{"doc/$pkgname_/copyright","licenses/$pkgname_/LICENSE"}
	rm -r "usr/share"/{"doc","lintian"} -f
	mv -T "usr"/{"sbin","bin"}
	cp -t "$pkgdir/" -a "usr" "etc"

	cd -- "$pkgdir/"
	sed -e 's|/usr/sbin/|/usr/bin/|g' -i "usr/lib/systemd/system/$pkgname.service"
	sed -r 's|(ALGO):=lz4|\1:=zstd|i' -i "usr/bin/$pkgname"
	sed -r 's|(SIZE):=512|\1:=8192|i' -i "usr/bin/$pkgname"
	sed -r 's|^(ALGO)=lz4$|\1=zstd|i' -i "etc/default/$pkgname"
	sed -r 's|^(PERCENT)=50$|\1=20|i' -i "etc/default/$pkgname"
	sed -r 's|^(SIZE)=512$|\1=8192|i' -i "etc/default/$pkgname"
}
