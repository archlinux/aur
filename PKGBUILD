# Maintainer: Samuel Littley <samuel.littley@toastwaffle.com>
pkgname=google-compute-engine-oslogin-git
pkgver=e725e85
pkgrel=1
pkgdesc='Google Cloud OS Login support for Google Compute Engine instances.'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/compute-image-packages'
license=('Apache')
depends=('pam' 'curl' 'json-c')
makedepends=('git' 'make')
source=('git://github.com/GoogleCloudPlatform/compute-image-packages.git'
        'google_oslogin_control.patch'
        'Makefile.patch')
install="${pkgname}.install"
sha256sums=('SKIP'
            '969587d7876624cfd1256ad31481dccbc3e78446249d06c88927fc7f88798b86'
            'd9b73fb7044ed0d6b8a8b0711a6aefa9139221067de3b1d9534afc577b29243e')

_srcpath=compute-image-packages/google_compute_engine_oslogin

prepare() {
  cd "${srcdir}/${_srcpath}"
  patch -p0 bin/google_oslogin_control "${srcdir}/google_oslogin_control.patch"
  patch -p0 Makefile "${srcdir}/Makefile.patch"
}

pkgver() {
  cd "${srcdir}/${_srcpath}"
  echo "$(git describe --always |sed "s#${_pkgname}-##g;s#-#_#g;s#v##")"
}

build() {
  cd "${srcdir}/${_srcpath}"
  make
}

package() {
  cd "${srcdir}/${_srcpath}"
  make DESTDIR="${pkgdir}" install
}
