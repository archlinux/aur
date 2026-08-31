# Maintainer: eval-exec <eval-exec@github>
# Contributor: Patryk Rozanski <rozanski.patryk@gmail.com>
pkgname=neomacs-bin
_pkgname=neomacs
pkgver=0.0.16
pkgrel=1
pkgdesc="GPU powered Emacs written in Rust with a modern display engine (prebuilt binary)"
arch=('x86_64')
url="https://github.com/eval-exec/neomacs"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'ncurses'
  'zlib'
)
optdepends=(
  'gstreamer: for video playback support'
  'gst-plugins-base-libs: for video playback plugins'
)
provides=('neomacs')
conflicts=('neomacs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eval-exec/neomacs/releases/download/v${pkgver}/neomacs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('385d3485855cedfd77b57c2b3917e1fd4e624607901622679da3ce25c08ea112')

package() {
  local _dir="neomacs-${pkgver}-x86_64-unknown-linux-gnu"

  # Install binaries
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_dir}/bin/neomacs" "${pkgdir}/usr/bin/neomacs"
  if [ -f "${srcdir}/${_dir}/bin/neomacsclient" ]; then
    install -m755 "${srcdir}/${_dir}/bin/neomacsclient" "${pkgdir}/usr/bin/neomacsclient"
  fi

  # Install libexec (internal helper binaries and neomacs.pdump)
  if [ -d "${srcdir}/${_dir}/libexec" ]; then
    cp -a "${srcdir}/${_dir}/libexec" "${pkgdir}/usr/"
  fi

  # Install shared files (Lisp library, icons, desktop entry)
  if [ -d "${srcdir}/${_dir}/share" ]; then
    cp -a "${srcdir}/${_dir}/share" "${pkgdir}/usr/"
  fi

  # License
  install -Dm644 "${srcdir}/${_dir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
