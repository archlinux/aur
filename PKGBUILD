#Maintainer: dreieck
#Contributor: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=unison-gtk
_pkgver=2.48.4
_debianver="-1+b1"
pkgname="${_pkgname}-${_pkgver}-compat-bin"
pkgver="${_pkgver}"
pkgrel=4
pkgdesc="GTK2-GUI for unison. Specific version ${_pkgver}, compatible with parallel installation to other versions of unison binaries (but pay attention to the local user configurations!). Prebuilt binary from debian, repackaged."
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=(
  'x86_64'
)
license=('GPL-3.0-or-later')
depends=(
  ${_pkgname%-gtk}-${_pkgver}
  "gtk2"
)
provides=(
  "${_pkgname}-${_pkgver}=${pkgver}"
  "${_pkgname}-${_pkgver%.*}=${pkgver}"
  "${_pkgname}-${_pkgver}-compat=${pkgver}"
  "${_pkgname}-${_pkgver%.*}-compat=${pkgver}"
)
conflicts=(
  "${_pkgname}-${pkgver%.*}"
)
source=(
  "https://archive.debian.org/debian/pool/main/${_pkgname:0:1}/${_pkgname%-gtk}/${_pkgname}_${_pkgver}${_debianver}_amd64.deb"
)
sha256sums=(
  '54ab2d5a7595ef82950f2c3228adc98e022690fb0ba25102d479da46124f32ce'
)

prepare() {
  _content="data.tar.xz"
  mkdir -p "${srcdir}/content"
  cd "${srcdir}/content"
  msg2 "Extracting ${_content} ..."
  bsdtar xf "${srcdir}/${_content}"
}

package() {
  cd "${srcdir}/content"

  cp -a "${srcdir}/content"/* "${pkgdir}"/

  rm -R "${pkgdir}/usr/bin/unison-latest-stable-gtk"
  rm -R "${pkgdir}/usr/share/man/man1/unison-latest-stable-gtk.1.gz"
  rm -R "${pkgdir}/usr/share/bash-completion"  # Would conflict with other unison versions, and file is somehow "broken" anyway.
  rm -R "${pkgdir}/usr/share/doc"              # Documentation files are already installed by package 'unison-2.48.4-compat-bin'.

  ## Install license file into place.
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/content/usr/share/doc/unison-gtk/copyright"

  mv "${pkgdir}/usr/share/applications/unison-gtk.desktop"  "${pkgdir}/usr/share/applications/unison-gtk-${_pkgver}.desktop"
  mv "${pkgdir}/usr/share/pixmaps/unison-gtk.svg"           "${pkgdir}/usr/share/pixmaps/unison-gtk-${_pkgver}.svg"
  mv "${pkgdir}/usr/share/pixmaps/unison-gtk.xpm"           "${pkgdir}/usr/share/pixmaps/unison-gtk-${_pkgver}.xpm"

  cd "${pkgdir}"/usr/bin
  ln -s "unison-${_pkgver}-gtk" "unison-${_pkgver}-x11"
}
