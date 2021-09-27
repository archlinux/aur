# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

pkgname=anbox-modules-dkms
pkgver=5
_arch="$(uname -r)"
pkgrel=12
pkgdesc='Android kernel driver (binder/binderfs, ashmem) in DKMS format for Kernel 5.12 and above.'
arch=('x86_64' 'aarch64' 'i386')
license=('Apache-2.0')
_license=('GPL3')
provides=("${pkgname}")
depends=('linux-headers')
source=("git+https://github.com/choff/anbox-modules.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
}

build() {
  
  cd "${srcdir}/anbox-modules/binder"
  msg2 "Building binder..."
  make
  
  cd "${srcdir}/anbox-modules/ashmem"
  msg2 "Building ashmem..."
  make
  
}

package() {
  
  install -dm755 "$pkgdir/usr/bin"
  # install -dm755 "${pkgdir}/usr/lib/modules/${_arch}"
  install -dm755 "${pkgdir}/usr/lib/modules-load.d"
  install -dm755 "${pkgdir}/usr/src/binder-1"
  install -dm755 "${pkgdir}/usr/src/ashmem-1"
  
  cp -r "${srcdir}/anbox-modules/binder/"* "${pkgdir}/usr/src/binder-1/"
  cp -r "${srcdir}/anbox-modules/ashmem/"* "${pkgdir}/usr/src/ashmem-1/"
  
  install -Dm644 "${srcdir}/anbox-modules/binder/dkms.conf" "${pkgdir}/usr/lib/modules-load.d/binder.conf"
  install -Dm644 "${srcdir}/anbox-modules/ashmem/dkms.conf" "${pkgdir}/usr/lib/modules-load.d/ashmem.conf"
  
  cd "${srcdir}/anbox-modules/binder"
  make DESTDIR="${pkgdir}/usr/src/binder-1" install
  
  cd "${srcdir}/anbox-modules/ashmem"
  make DESTDIR="${pkgdir}/usr/src/ashmem-1" install
  
}

# sudo modprobe binder_linux devices=binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder
# sudo modprobe ashmem_linux

# vim:set ts=2 sw=2 et:
