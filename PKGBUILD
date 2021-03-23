# Maintainer: capezotte (carana2099 ob gmail at com)
# Patches from: Raphael Geissert (geissert ob debian at org)
pkgname=kgb
pkgdesc='A PAQ6-based archiver, with high compression ratio'
pkgver=1.0b4
pkgrel=1
arch=(i686 x86_64)
source=(
	'https://netactuate.dl.sourceforge.net/project/kgbarchiver/kgb_arch_posix/1.0b4_mod_by_Slawek/kgb_arch_posix_by_slawek_v1.0b4.tar.bz2'
	'debian.tar.xz::https://deb.debian.org/debian/pool/main/k/kgb/kgb_1.0b4+ds-14.debian.tar.xz'
)
sha512sums=(
	'3eb8eac9a070a48d884cd1f446678c9e080fb2d31bf604ecad02f3e6acd81bec71d4c1a1a8500dfdacc167be84956333d18de55af6d959edf19d2c68d1ed18f6'
	'ed1e17289b31ac90c9358b2a529ba3fc0c771f4cdedcf62aa1c06b60c2a9fdaa681d8e27b1393b40132c22abd7bd7fdce450adda3c6a902463192c5ec7fd862d'
)
noextract=( 'debian.tar.xz' )

build() {
	tar xvf debian.tar.xz debian/{patches,additions}
	chmod a+rw kgb*posix*.cpp
	sed -i 's/\r$//g' kgb*posix*.cpp gpl.txt
	while read -r p; do
		patch -p1 < debian/patches/"$p"
	done < debian/patches/series
	g++ -O3 -o kgb_arch kgb*posix*.cpp
}

package() {
	install -Dm644 gpl.txt "$pkgdir"/usr/share/licenses/kgb/COPYING
	install -Dm755 kgb_arch "$pkgdir"/usr/bin/kgb
	gzip -kc debian/additions/kgb.1 | install -Dm644 /dev/stdin "$pkgdir"/usr/share/man/man1/kgb.1.gz
}
