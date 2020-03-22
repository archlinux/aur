# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=straw-viewer
pkgname=straw-viewer-git
pkgver=0.0.3
pkgrel=1
pkgdesc="Application for searching and streaming videos from YouTube, using the API of invidio.us (fork of youtube-viewer)."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('Artistic2.0')
makedepends=('git' 'perl-module-build')

provides=()
conflicts=()

depends=('perl' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-gtk3' 'perl-libwww' 'perl-file-sharedir')

optdepends=(
    'ffmpeg: conversions and MKV merging'
    'gnome-icon-theme: icons in menus'
    'perl-json-xs: faster JSON parsing'
    'perl-lwp-useragent-cached: local cache support'
    'perl-term-readline-gnu: better STDIN support'
    'perl-unicode-linebreak: print results in a fixed-width format (-W)'
    'mpv: play videos with MPV (recommended)'
    'mplayer: play videos with MPlayer'
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
    mv "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-StrawViewer/gtk-straw-viewer.desktop \
        "$pkgdir"/usr/share/applications/gtk-straw-viewer.desktop
    cp "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-StrawViewer/icons/gtk-straw-viewer.png \
        "$pkgdir"/usr/share/pixmaps/gtk-straw-viewer.png
}
