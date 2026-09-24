# Maintainer: Stéphane Jourdois <stephane@jourdois.fr>
# Rename to PKGBUILD when publishing the wlr-utils-bin AUR package.
pkgname=wlr-utils-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='Native screen tools for wlroots compositors: pick, switch, capture, inspect and annotate (prebuilt binaries)'
arch=('x86_64')
url='https://github.com/sjourdois/wlr-utils'
license=('MIT' 'Apache-2.0')
# Same runtime libraries as the source package; the prebuilt binaries link them
# dynamically, so soname skew with your system may require the -from-source package.
depends=('wayland' 'libxkbcommon' 'fontconfig' 'libglvnd' 'mesa' 'ffmpeg' 'libva'
         'libpipewire' 'tesseract' 'leptonica' 'dbus')
optdepends=('noto-fonts-cjk: render CJK (Japanese/Chinese/Korean) text'
            'tesseract-data-eng: English OCR for `wlr-peek ocr`'
            'tesseract-data-fra: French OCR for `wlr-peek ocr`'
            'xdg-desktop-portal-wlr: screencast portal that drives wlr-chooser')
provides=('wlr-utils')
conflicts=('wlr-utils')
_archive="wlr-utils-x86_64-unknown-linux-gnu"
_raw="https://raw.githubusercontent.com/sjourdois/wlr-utils/v$pkgver"
source=("$_archive-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_archive.tar.xz"
        "wlr-overlayd-$pkgver.service::$_raw/crates/wlr-chooser/contrib/wlr-overlayd.service"
        "wlr-draw-$pkgver.service::$_raw/crates/wlr-draw/contrib/wlr-draw.service")
sha256sums=('121bc4041460bf7d265182ec682625b160032807599d010a4dfcfd0d92493b39'
            '2fe8881ad1b3a1b0a9091773016f48f09b3a35f2497a00541293187f3eb7752c'
            '9c84cdf9a4dd76468dcc3df2086c2d0549072e515e6e22539a05b6ff1672400c')

package() {
	# The cargo-dist archive unpacks into a single top-level directory named after
	# the target triple, holding the six binaries plus the READMEs and licences.
	cd "$_archive"
	for _bin in wlr-chooser wlr-switcher wlr-overlayd wlr-peek wlr-shot wlr-draw; do
		install -Dm755 "$_bin" "$pkgdir/usr/bin/$_bin"
	done
	install -Dm644 "$srcdir/wlr-overlayd-$pkgver.service" "$pkgdir/usr/lib/systemd/user/wlr-overlayd.service"
	install -Dm644 "$srcdir/wlr-draw-$pkgver.service" "$pkgdir/usr/lib/systemd/user/wlr-draw.service"
	install -Dm644 README.md "$pkgdir/usr/share/doc/wlr-utils/README.md"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
