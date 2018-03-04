# Maintainer: Robin Broda <robin at broda dot me>

_pkgname="swftools"
pkgname=("${_pkgname}-git")
pkgver=r5100.eeede5d8
pkgrel=1
pkgdesc='Utilities for editing and generating Adobe Flash (SWF) files'
arch=('x86_64')
url='https://github.com/matthiaskramm/swftools'
license=('GPL')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libjpeg-turbo' 'giflib' 'fontconfig' 'fftw' 'pdflib-lite' 'zziplib')
makedepends=('git')
source=('git+https://github.com/matthiaskramm/swftools')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  ./configure --prefix=/usr
}

build() {
  cd "${_pkgname}"

  # Work around https://github.com/matthiaskramm/swftools/issues/12
  make || make
}

package() {
  cd "${_pkgname}"

  make prefix="${pkgdir}/usr" install

  # Fix invalid symlinks referencing pkgdir
  cd "${pkgdir}/usr/share/${_pkgname}/swfs"
  rm -f default_loader.swf default_viewer.swf
  ln -s tessel_loader.swf default_loader.swf
  ln -s simple_viewer.swf default_viewer.swf
}
