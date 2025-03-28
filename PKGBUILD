# Maintainer: envolution
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=yubioath-desktop
pkgdesc='Yubico Authenticator for Desktop'
pkgver=5.1.0
pkgrel=4
arch=('x86_64')
url='https://github.com/Yubico/yubioath-desktop'
license=('BSD-3-Clause')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2'
	'python-pyotherside' 'qt5-graphicaleffects' 'qt5-multimedia'
	'ccid' 'pcsclite' 'yubikey-manager')
makedepends=('git' 'python')
source=(
	"git+$url.git#tag=$pkgname-$pkgver?signed"
	"0001-cstdint.patch"
)
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3' # Dag Heyman <dag@yubico.com>
	'57A9DEED4C6D962A923BB691816F3ED99921835E'              # Emil Lundberg <emil@yubico.com>
	'9E885C0302F9BB9167529C2D5CBA11E6ADC7BCD1')             # Dennis Fokin <dennis.fokin@yubico.com>
sha512sums=('b7139e99301cf1dffe21f1d16c5ad45c7331fd3fc940a5c2b4ef39902ed693db5a5d5896f5515bd368d4957bf64d5a8253e5bfeab3127d44f923e45155952e44'
            '3147b875c246ad9290a669145f9bf61b7c3af6f176114609787cdbe960b139dac6a249f0aa8316872a630eec8a6fd75251aeb6dd5ed8c45a37103a646b2333f1')

prepare() {
	cd $pkgname

	local src
	for src in "${source[@]}"; do
		src="${src%%::*}"
		src="${src##*/}"
		[[ "${src}" = *.patch ]] || continue
		msg2 "Applying patch ${src}..."
		patch -Np1 -i "${srcdir}/${src}"
	done
}

build() {
	cd $pkgname

	qmake . \
		PREFIX=/usr \
		QMAKE_CFLAGS_RELEASE="$CFLAGS" \
		QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"

	make
}

package() {
	cd $pkgname

	make INSTALL_ROOT="$pkgdir" install

	mkdir "$pkgdir"/usr/bin
	mv "$pkgdir"/usr/{lib,bin}/yubioath-desktop

	install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	install -Dm 644 resources/icons/com.yubico.yubioath.svg "$pkgdir"/usr/share/pixmaps/com.yubico.yubioath.svg
	install -Dm 644 resources/com.yubico.yubioath.desktop "$pkgdir"/usr/share/applications/com.yubico.yubioath.desktop
	install -Dm 644 resources/com.yubico.yubioath.appdata.xml "$pkgdir"/usr/share/metainfo/com.yubico.yubioath.appdata.xml
}

# vim:set ts=2 sw=2 et:
