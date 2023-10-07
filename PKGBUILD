# Maintainer: Fazzi <faaris.ansari@proton.me>
# Original Package Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Eklöf <daniel at ekloef dot se>
# Contributor: raf@notashelf.dev

pkgbase=foot
pkgdesc='Fast, lightweight, and minimalistic Wayland terminal emulator'
pkgname=($pkgbase-fullscreen-translucency)
pkgver=1.15.3
pkgrel=1
url="https://codeberg.org/dnkl/$pkgbase"
arch=(x86_64)
license=(MIT)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'python' 'wayland-protocols' 'tllist')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'ncurses' 'fcft>=3.0.0')
optdepends=("foot-terminfo: alternative to ncurses' terminfo, with additional non-standard capabilities"
            "libnotify: desktop notifications"
            "xdg-utils: URI launching"
            "bash-completion: bash completions for foot itself")
backup=(etc/xdg/foot/foot.ini)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "0003-make-foot-great-again.patch")
sha256sums=('65006a0643ec185a0e24578365e2e7469ddeba6bd543645a15d9bbb5ec501670'
            '89c1d38a880b4e1620741f1cd00268293eb587c67d5e0a0e15b260f15835943c')

build() {
	cd "$pkgbase"

  patch -p1 < ../0003-make-foot-great-again.patch

	./pgo/pgo.sh \
		auto \
		. build \
		-Dterminfo=disabled \
    -Dfullscreen_alpha=true \
		--prefix=/usr \
		--wrap-mode=nodownload
	sed 's/@default_terminfo@/foot-extra/g' foot.info |
		tic -x -o build -e foot-extra,foot-extra-direct -
}

check() {
	cd "$pkgbase"
	ninja -C build test
}

package_foot-fullscreen-translucency() {
	cd "$pkgbase"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
