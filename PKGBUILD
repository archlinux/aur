# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=pipe-viewer
pkgname=pipe-viewer-git
pkgver=0.2.3.r0.g64f14fc
pkgrel=1
pkgdesc="A lightweight YouTube client for Linux (CLI/GTK) (fork of straw-viewer)"
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('Artistic2.0')
makedepends=('git' 'perl-module-build')

provides=()
conflicts=()

depends=('perl' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-gtk3' 'perl-libwww' 'perl-file-sharedir' 'perl-unicode-linebreak')

optdepends=(
    'ffmpeg: conversions and MKV merging'
    'gnome-icon-theme: icons in menus'
    'perl-json-xs: faster JSON parsing'
    'perl-lwp-useragent-cached: local cache support'
    'perl-term-readline-gnu: better STDIN support'
    'mpv: play videos with MPV (recommended)'
    'vlc: play videos with VLC'
    'wget: download videos with wget'
    'youtube-dl: play videos with encrypted signatures'
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
    mv "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-PipeViewer/gtk-pipe-viewer.desktop \
        "$pkgdir"/usr/share/applications/gtk-pipe-viewer.desktop
    cp "$pkgdir"/usr/share/perl5/vendor_perl/auto/share/dist/WWW-PipeViewer/icons/gtk-pipe-viewer.png \
        "$pkgdir"/usr/share/pixmaps/gtk-pipe-viewer.png
}
