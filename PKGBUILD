# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=youtube-viewer
pkgname=gtk-youtube-viewer-git
pkgver=3.7.5
pkgrel=1
pkgdesc="GTK+ application for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('Artistic2.0')
makedepends=('git' 'perl-module-build')

provides=('youtube-viewer' 'youtube-viewer-git')
conflicts=('youtube-viewer' 'youtube-viewer-git')

depends=('perl' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-libwww' 'perl-gtk3' 'perl-file-sharedir')

optdepends=(
    'ffmpeg: conversions and MKV merging'
    'gnome-icon-theme: icons in menus'
    'perl-json-xs: faster JSON parsing'
    'perl-lwp-useragent-cached: local cache support'
    'perl-term-readline-gnu: better STDIN support'
    'perl-unicode-linebreak: print results in a fixed-width format (-W)'
    'mpv: play videos with MPV (recommended)'
    'mplayer: play videos with MPlayer'
    'smplayer: play videos with SMPlayer'
    'vlc: play videos with VLC'
    'wget: download videos with wget'
    'youtube-dl: play videos with encrypted signatures'
)

source=("git+https://github.com/trizen/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --always | sed -e 's|-|.|g'
}

build() {
    cd "$_pkgname"
    /usr/bin/perl Build.PL --gtk3
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
