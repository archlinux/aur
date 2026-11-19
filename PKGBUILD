# Maintainer: Scott <158021536+nathawatc@users.noreply.github.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=rarc
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight, modern GTK4 archive manager"
arch=('x86_64')
url="https://github.com/nathawatc/rarc"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libarchive')
makedepends=('cargo' 'gettext' 'pkgconf')
optdepends=('thunar-archive-plugin: Thunar context menu integration')
options=('!lto')

_tag=v${pkgver}

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${_tag}.tar.gz")
b2sums=('65aab8715d1eb5033dcb53dc6b63198eb16b6b2a15c518a869c047034850aee08ecfbe14104a9bd47b441db6f99074756ebc0d42eea5d0bac50af282a5c2d004')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked
}

build() {
	cd "${pkgname}-${pkgver}"
	export RARC_LOCALEDIR=/usr/share/locale
	cargo build --frozen --release --target-dir target
	make locales
}

check() {
	cd "${pkgname}-${pkgver}"
	cargo test --frozen --target-dir target
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "data/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "data/$pkgname.tap" "$pkgdir/usr/lib/xfce4/thunar-archive-plugin/$pkgname.tap"

	local lang
	while IFS= read -r lang; do
		[[ -z $lang || $lang == \#* ]] && continue
		install -Dm644 "target/locale/$lang/LC_MESSAGES/$pkgname.mo" \
			"$pkgdir/usr/share/locale/$lang/LC_MESSAGES/$pkgname.mo"
	done < po/LINGUAS
}
