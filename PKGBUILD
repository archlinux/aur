# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=youtube-viewer
pkgname=gtk-youtube-viewer-git
pkgver=3.5.4
pkgrel=1
pkgdesc="Gtk2 application for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('Artistic2.0')
makedepends=('git' 'perl-module-build')

provides=('youtube-viewer' 'youtube-viewer-git')
conflicts=('youtube-viewer' 'youtube-viewer-git')

depends=('perl>=5.16.0' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-libwww' 'gtk2-perl' 'perl-file-sharedir')

optdepends=(
            'perl-json-xs: faster JSON to HASH conversion'
            'perl-lwp-useragent-cached: local cache support'
            'perl-unicode-linebreak: for printing results in a fixed-width format (-W)'
            'perl-term-readline-gnu: for better STDIN support'
            'youtube-dl: for playing videos with encrypted signatures'
            'wget: for downloading videos with wget'
            'mplayer: for playing videos with MPlayer'
            'vlc: for playing videos with VLC'
            'smplayer: for playing videos with SMPlayer'
            'mpv: for playing videos with MPV (recommended)'
            'gnome-icon-theme: for icons in menus'
            'ffmpeg: for conversions and MKV merging'
            )

source=("git+https://github.com/trizen/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --always | sed -e 's|-|.|g'
}

build() {
    cd "$_pkgname"
    /usr/bin/perl Build.PL --gtk
}

check(){
    cd "$_pkgname"
    ./Build test
}

package() {
    cd "$_pkgname"
    ./Build install --destdir "$pkgdir" --installdirs vendor --install_path script=/usr/bin
    rm -r "$pkgdir/usr/lib"

    mkdir "$pkgdir"/usr/share/{applications,pixmaps}
    mv "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-YoutubeViewer/gtk-youtube-viewer.desktop \
        "$pkgdir"/usr/share/applications/gtk-youtube-viewer.desktop
    cp "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-YoutubeViewer/icons/gtk-youtube-viewer.png \
        "$pkgdir"/usr/share/pixmaps/gtk-youtube-viewer.png
}
