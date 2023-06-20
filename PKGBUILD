# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkg="youtube-viewer"
_pkgname="gtk-youtube-viewer"
pkgname="${_pkgname}"
pkgver=3.10.0
pkgrel=1
pkgdesc="A Gtk3 application for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/${_pkg}"
license=('Artistic2.0')
makedepends=('perl-module-build')
provides=(
  "${_pkg}")
conflicts=(
  "${_pkg}"
  "${_pkg}-git")
depends=(
  'perl>=5.16.0'
  'perl-data-dump'
  'perl-file-sharedir'
  'perl-json'
  'perl-lwp-protocol-https'
  'perl-libwww'
  'perl-unicode-linebreak'
  'perl-gtk3'
  'perl-lwp-useragent-cached'
  'perl-io-compress-brotli'
)
makedepends=(perl-module-build)
optdepends=(
  'mpv: play videos with MPV'
  'perl-json-xs: faster JSON to HASH conversion'
  'perl-unicode-linebreak: for printing results in a fixed-width format (-W)'
  'perl-term-readline-gnu: for better STDIN support'
  'youtube-dl: for playing videos with encrypted signatures'
  'mplayer: play videos with MPlayer'
  'vlc: play videos with VLC'
  'smplayer: play videos with SMPlayer'
  'wget: download videos with wget'
  'gnome-icon-theme: for icons in menus'
)
source=(
  "${_pkg}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "${url}/releases/download/${pkgver}/${_pkg}-${pkgver}.tar.gz.asc"
)
install="${_pkgname}.install"
validpgpkeys=(
  # 
  ABB8BBAA2E279767774149B7D0A443C703A3A056
)
# sums provided by packager makepkg -g
b2sums=('cda4f75254425951463f68db2a3b6661193fafa260c2005c8ffa2e475f550b7a805ba32d9b690c2220ed9e114f86dbc439bf45349ace2527176f6e76e13277b0'
        'SKIP')

build() {
    cd "${_pkg}-${pkgver}"
    perl Build.PL --installdirs vendor \
                  --gtk
}

check() {
    cd "${_pkg}-${pkgver}"
    ./Build test
}

package() {
    cd "${_pkg}-${pkgver}"

    ./Build install --destdir "${pkgdir}"
    rm -r "${pkgdir}/usr/lib"

    install -D -m 644 README.md \
        "${pkgdir}/usr/share/doc/${_pkg}/README.md"

    mkdir -p "${pkgdir}/usr/share/applications" "$pkgdir/usr/share/pixmaps"
    mv "${pkgdir}/usr/share/perl5/vendor_perl/auto/share/dist/WWW-YoutubeViewer/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    cp "${pkgdir}/usr/share/perl5/vendor_perl/auto/share/dist/WWW-YoutubeViewer/icons/${_pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
