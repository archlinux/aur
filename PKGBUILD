# Maintainer: Peter Hoeg <firstname at lastname dot com>

_pkgbase=tensor
pkgname=${_pkgbase}-git
pkgver=r37.09370d4
pkgrel=2
pkgdesc='Matrix QML client'
arch=('x86_64' 'i686')
url=('http://www.matrix.org')
license=('GPL')
depends=('qt5-base')
source=("git+https://github.com/davidar/${_pkgbase}.git"
        'tensor.desktop')
sha1sums=('SKIP'
          '4f03c6d93dce615c02360f3b2ab42e6aee883147')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${srcdir}/${_pkgbase}
  git submodule update --init
  cd matrix-js-sdk && npm install && npm run build && cd ..
}

build() {
  cd ${srcdir}/${_pkgbase}
  qmake
  make
}

package() {
  cd ${srcdir}/${_pkgbase}

  for r in 16 24 32 48 64 128 192 256 384 ; do
    _icondir=${pkgdir}/usr/share/icons/hicolor/${r}x${r}/apps
    mkdir -p $_icondir
    convert -resize ${r}x${r} src/logo.png ${_icondir}/tensor.png
  done

  mkdir -p $pkgdir/usr/bin
  install -m755 tensor $pkgdir/usr/bin/tensor

  mkdir -p $pkgdir/usr/share/applications
  install -m644 $srcdir/tensor.desktop $pkgdir/usr/share/applications/tensor.desktop
}

# vim:set ts=2 sw=2 et:
