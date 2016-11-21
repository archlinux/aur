# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the mpv package: Christian Hesse <mail@eworm.de>
# Contributor to the mpv package: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor to the mpv package: Eivind Uggedal <eivind@uggedal.com>

_pkgname=mpv
pkgname=mpv-nowayland
epoch=1
pkgver=0.22.0
pkgrel=1
_waf_version=1.8.12
pkgdesc='A free, open source, and cross-platform media player'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libxrandr' 'jack' 'smbclient' 'rubberband'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz"
	"http://www.freehackers.org/~tnagy/release/waf-${_waf_version}")
sha256sums=('c0f9ac8f0e37a391d19007b333ef8787c2f45d75a0d4401c0098cde52c5082f6'
	    '01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b')

prepare() {
  cd ${_pkgname}-${pkgver}

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_pkgname}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-encoding \
    --enable-libmpv-shared \
    --enable-zsh-comp \
    --disable-wayland \
    --disable-gl-wayland

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
