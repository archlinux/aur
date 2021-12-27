# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>

_kernelver=$(uname -r)
_linuxver=${_kernelver%-*}

pkgname=dahdi-linux-git
pkgdesc="DAHDI drivers for Asterisk (Digium, OpenVox, Allo and Yeastar cards)"
pkgver=3.1.0.r12.g5c840cf
pkgrel=1
arch=(x86_64 i686)
url=http://www.asterisk.org
license=(LGPL)
provides=("${pkgname%-git}=$pkgver")
depends=("linux=${_linuxver//-/.}"
         perl)
makedepends=(git
             "linux-headers=${_linuxver//-/.}")
conflicts=(dahdi)
install="${pkgname%-linux-git}.install"
_archive="$pkgname"
_fwurl=http://downloads.digium.com/pub/telephony/firmware/releases
source=("$_archive::git://git.asterisk.org/dahdi/linux#branch=next"
        "${pkgname%-linux-git}.service"
        "$_fwurl/dahdi-fw-a4a-a0017.tar.gz"
        "$_fwurl/dahdi-fw-a4b-d001e.tar.gz"
        "$_fwurl/dahdi-fw-a8a-1d0017.tar.gz"
        "$_fwurl/dahdi-fw-a8b-1f001e.tar.gz"
        "$_fwurl/dahdi-fw-hx8-2.06.tar.gz"
        "$_fwurl/dahdi-fw-oct6114-032-1.05.01.tar.gz"
        "$_fwurl/dahdi-fw-oct6114-064-1.05.01.tar.gz"
        "$_fwurl/dahdi-fw-oct6114-128-1.05.01.tar.gz"
        "$_fwurl/dahdi-fw-oct6114-256-1.05.01.tar.gz"
        "$_fwurl/dahdi-fw-tc400m-MR6.12.tar.gz"
        "$_fwurl/dahdi-fw-te133-7a001e.tar.gz"
        "$_fwurl/dahdi-fw-te134-780017.tar.gz"
        "$_fwurl/dahdi-fw-te435-13001e.tar.gz"
        "$_fwurl/dahdi-fw-te436-10017.tar.gz"
        "$_fwurl/dahdi-fw-te820-1.76.tar.gz"
        "$_fwurl/dahdi-fw-vpmoct032-1.12.0.tar.gz"
        "$_fwurl/dahdi-fwload-vpmadt032-1.25.0.tar.gz"
)
sha256sums=('SKIP'
            '7c91314aacab22ffd02794abfa7db49f44a796ea54f3e2bc4276616e68b90e0f'
            'd5b6ab6851e431afcfec2ecc39d95fa88fe3939ffdb2e3d4f28a43cabf30e95b'
            'e039af8bec36407b74e1dd9ebdd49ba077469eda79d4e6093721ed2836d4536f'
            '5064f9877b8aec99b19fd57988216fe1a9c0b7c07853dd3b32b5a55ab7b418e6'
            '09a8992786309e025aa60b400a2c7d21226ac9bb6f1b66f562a5e7e9dc892b03'
            '449ab3fd03d55d808e999efb7677cd04de202b92c9fcb039539a7e48a39a80f5'
            '7a006073202d67e45f1d5ff1e9c6e8663e6056cef9dc4c5abae86a1018db349c'
            '56bac1f2024c76ecf9b6f40992eeea29a1fbee676bb2a37a058179bacfbb1c91'
            'e1146749d205c41603b9b76852c3f8104dac233d0025d700db24504d10c99775'
            '5fe5036a2766cf0e8a968b0c58b700507d86e1cde9296ca437170cc626a9c79c'
            '11dd8d009809e41fc9a3a36766f59ff73d29075eede5b8724331d9a6e5259774'
            '511c1966295a20df673bb87af30245f0ad165efd6ccb92b4d8ed535ca7f5ac65'
            '99f7c410bf47d2a5ae687d717e51448ce5b52aca902830bf39bffe683150fa2d'
            'c8f55d57cc0bf332e8d96cdf9ff6dd0e322f33581e1efc24c2b9a0e0c5eb7ee4'
            '0980f4a8d191c6872aa27d971758046f0e7827ac161549f2cc1b0eeab0ae9333'
            '5b823e25828e2c1c6548886ad408b2e31dbc8cd17170c52592792d9c754a199c'
            '6b199cf836f150f9cb35f763f0f502fb52cfa2724a449b500429c746973904ad'
            '3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1')

prepare() {
	cd "$_archive"
	sed -i -e 's,$(DESTDIR)/lib/firmware,$(DESTDIR)/usr/lib/firmware,g' \
		drivers/dahdi/firmware/Makefile
	sed -i -e '/^target/s,lib,usr/lib,' -e '/\binstall\b/{s,-m,-Dm,;s,bin ,bin -t ,}' \
		build_tools/install_firmware
	cd "drivers/dahdi/firmware"
	for fw in ${source[@]:2:18}; do
		ln -sf "$srcdir/${fw##*/}"
	done
}

pkgver() {
	cd "$_archive"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_archive"
	make DESTDIR="$pkgdir" all
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install-firmware
	make DESTDIR="$pkgdir" install-include
	make DESTDIR="$pkgdir" install-xpp-firm
	rm "$pkgdir/usr/lib/firmware/".d*
	rm -r "$pkgdir/usr/lib/hotplug/firmware"
	cd drivers
	find . -name "*.ko" \
		-exec gzip "{}" \; \
		-exec install -Dm0644 "{}.gz" "$pkgdir/usr/lib/modules/$_kernelver/extramodules/{}.gz" \;
}
