# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

pkgname=anbox-modules-dkms
_pkgname=anbox-modules
pkgver=5
arch="$(uname -r)"
url='https://github.com/choff/anbox-modules'
pkgrel=12.1
pkgdesc='Android kernel driver (binder/binderfs, ashmem) in DKMS format for Kernel 5.8 thru 5.12'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL3')
provides=("${pkgname}")
depends=('linux-headers' 'dkms')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/choff/${_pkgname}.git#branch=master")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
}

build() {
  
  cd "${srcdir}/${_pkgname}/binder"
  make

  cd "${srcdir}/${_pkgname}/ashmem"
  make
}

package() {
  
  install -dm755 "$pkgdir/usr/bin"
  # install -dm755 "${pkgdir}/usr/lib/modules/${_arch}"
  install -dm755 "${pkgdir}/usr/lib/modules-load.d"
  install -dm755 "${pkgdir}/usr/src/binder-1"
  install -dm755 "${pkgdir}/usr/src/ashmem-1"
  
  cp -r "${srcdir}/${_pkgname}/binder/"* "${pkgdir}/usr/src/binder-1/"
  cp -r "${srcdir}/${_pkgname}/ashmem/"* "${pkgdir}/usr/src/ashmem-1/"
  
  install -Dm644 "${srcdir}/${_pkgname}/binder/dkms.conf" "${pkgdir}/usr/lib/modules-load.d/binder.conf"
  install -Dm644 "${srcdir}/${_pkgname}/ashmem/dkms.conf" "${pkgdir}/usr/lib/modules-load.d/ashmem.conf"
  
  cd "${srcdir}/${_pkgname}/binder"
  make DESTDIR="${pkgdir}/usr/src/binder-1" install
  
  cd "${srcdir}/${_pkgname}/ashmem"
  make DESTDIR="${pkgdir}/usr/src/ashmem-1" install
  
  echo '** To activate binder_linux and ashmem_linux **
# $ sudo modprobe binder_linux devices=binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder
# $ sudo modprobe ashmem_linux'

}

# sudo modprobe binder_linux devices=binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder
# sudo modprobe ashmem_linux

# vim:set ts=2 sw=2 et:
