# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=lbry-viewer
pkgname=lbry-viewer-git
pkgver=0.1.0.r0.g8ae6900
pkgrel=1
pkgdesc="A lightweight LBRY/Odysee client for Linux (CLI/GTK) (fork of pipe-viewer)"
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('Artistic2.0')
makedepends=('git' 'perl-module-build')

provides=()
conflicts=()

depends=('perl' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-gtk3' 'perl-libwww' 'perl-file-sharedir' 'perl-unicode-linebreak' 'perl-html-tree' 'webp-pixbuf-loader' 'yt-dlp')

optdepends=(
    'ffmpeg: for video post-processing'
    'gnome-icon-theme: icons in menus'
    'perl-json-xs: faster JSON parsing'
    'perl-lwp-useragent-cached: local cache support'
    'perl-term-readline-gnu: better STDIN support'
    'perl-parallel-forkmanager: for the *_parallel config-options'
    'mpv: play videos with MPV (recommended)'
    'vlc: play videos with VLC'
    #'yt-dlp: fallback method for extracting video info'
)

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    mv "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-LbryViewer/gtk-lbry-viewer.desktop \
        "$pkgdir"/usr/share/applications/gtk-lbry-viewer.desktop
    cp "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-LbryViewer/icons/gtk-lbry-viewer.png \
        "$pkgdir"/usr/share/pixmaps/gtk-lbry-viewer.png
}
