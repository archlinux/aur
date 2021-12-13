# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

pkgname=anbox-modules-dkms
_pkgname=anbox-modules
pkgver=5
arch="$(uname -r)"
url='https://github.com/choff/anbox-modules'
pkgrel=15
pkgdesc='Android kernel driver fork by @choff (binder/binderfs & ashmem) in DKMS format'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL3')
provides=("${pkgname}")
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/choff/${_pkgname}.git#branch=master"
  "https://github.com/sickcodes/anbox-modules/commit/7c19d3c66758747d854c63e4c34ef127ce201fa6.patch")
sha256sums=('SKIP'
  '7589f311fd9a503c30a214b54f1f687c26a2f160d4339098c65f655e9b1e3556')

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Patch for 5.10-lts
  patch -p1 -i "${srcdir}"/7c19d3c66758747d854c63e4c34ef127ce201fa6.patch
}

package() {
  
  install -dm755 "${pkgdir}/usr/src/binder-1"
  install -dm755 "${pkgdir}/usr/src/ashmem-1"
  
  cp -r "${srcdir}/${_pkgname}/binder/"* "${pkgdir}/usr/src/binder-1/"
  cp -r "${srcdir}/${_pkgname}/ashmem/"* "${pkgdir}/usr/src/ashmem-1/"
  
  cd "${srcdir}/${_pkgname}/binder"
  make
  make DESTDIR="${pkgdir}/usr/src/binder-1" install
  
  cd "${srcdir}/${_pkgname}/ashmem"
  make
  make DESTDIR="${pkgdir}/usr/src/ashmem-1" install
  
  echo '** To activate binder_linux and ashmem_linux **
# $ sudo modprobe binder_linux devices=binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder
# $ sudo modprobe ashmem_linux'

}

# sudo modprobe binder_linux devices=binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder
# sudo modprobe ashmem_linux

# vim:set ts=2 sw=2 et:
