# Maintainer: Ivy Foster <iff@archlinux.org>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Wallace < danielwallace at gtmanfred dot com>
# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=youtube-viewer
pkgdesc='Command line utility for viewing YouTube videos'
url='https://github.com/trizen/youtube-viewer'
license=(GPL3)
epoch=1
pkgver=3.9.0
pkgrel=1
depends=(perl perl-data-dump perl-file-sharedir perl-json perl-lwp-protocol-https perl-libwww)
makedepends=(perl-module-build)
optdepends=(
	'mpv: play videos with MPV'
	'perl-file-sharedir: GTK GUI'
	'perl-gtk3: GTK3 GUI'
	'perl-json-xs: faster JSON to HASH conversion'
	'perl-term-readline-gnu: better STDIN support'
	'perl-text-charwidth: print results in a fixed-width format'
	'vlc: play videos with VLC'
	'wget: download videos with wget'
	'youtube-dl: play videos with encrypted signatures'
)
arch=(any)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/trizen/youtube-viewer/archive/$pkgver.tar.gz"
	"https://github.com/trizen/youtube-viewer/releases/download/$pkgver/youtube-viewer-$pkgver.tar.gz.asc"
)
install=youtube-viewer.install
validpgpkeys=(ABB8BBAA2E279767774149B7D0A443C703A3A056)
# sums provided by packager makepkg -g
sha512sums=('7f08823d406a7c97ad1f3daf40d54b8ae282ab9d97df43807e0ad3bf908edcb4e08791e25fc347e949f085e4743b9dcbbfd677ee7a672c2fb498a99626422931'
            'SKIP')

build() {
	cd "youtube-viewer-$pkgver"
	perl Build.PL --installdirs vendor --gtk
}

check() {
	cd "youtube-viewer-$pkgver"
	./Build test
}

package() {
	cd "youtube-viewer-$pkgver"

	./Build install --destdir "$pkgdir"
	rm -r "$pkgdir/usr/lib"

	install -D -m 644 README.md "$pkgdir/usr/share/doc/youtube-viewer/README.md"

	mkdir -p "$pkgdir/usr/share/applications" "$pkgdir/usr/share/pixmaps"
	mv "$pkgdir/usr/share/perl5/vendor_perl/auto/share/dist/WWW-YoutubeViewer/gtk-youtube-viewer.desktop" \
		"$pkgdir/usr/share/applications/gtk-youtube-viewer.desktop"
	cp "$pkgdir/usr/share/perl5/vendor_perl/auto/share/dist/WWW-YoutubeViewer/icons/gtk-youtube-viewer.png" \
		"$pkgdir/usr/share/pixmaps/gtk-youtube-viewer.png"
}
