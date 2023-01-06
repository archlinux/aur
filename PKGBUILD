# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Contributor: Ivy Foster <iff@archlinux.org>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Wallace < danielwallace at gtmanfred dot com>

pkgname=youtube-viewer
pkgdesc='Command line utility for viewing YouTube videos'
url='https://github.com/trizen/youtube-viewer'
license=('Artistic2.0')
epoch=1
pkgver=3.10.5
pkgrel=1
depends=(perl perl-data-dump perl-file-sharedir perl-json perl-lwp-protocol-https perl-libwww perl-unicode-linebreak)
makedepends=(perl-module-build)
optdepends=(
    'mpv: play videos with MPV'
    'perl-file-sharedir: GTK GUI'
    'perl-gtk3: GTK3 GUI'
    'perl-json-xs: faster JSON to HASH conversion'
    'perl-term-readline-gnu: better STDIN support'
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
b2sums=('58bc0ac098af8a5f5f22fefbc1b79eb8597f339f90fda661d3cb1ef845b20fd44ea31f5a66799af39f97da1c9833631640e01251a9af8c4d0c5100499d9f8743'
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
