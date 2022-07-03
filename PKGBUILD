# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

pkgname=anbox-modules-dkms-aarch64_fix
_pkgname=anbox-modules-aarch64
pkgver=5.15
arch="$(uname -r)"
url='https://github.com/BlackCatDevel0per/anbox-modules-aarch64'
pkgrel=1
pkgdesc='Android kernel driver fork by @choff & fix for aarch64 linux >= 5.14 from bcdev (binder/binderfs & ashmem) in DKMS format'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL3')
provides=("${pkgname}")
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/BlackCatDevel0per/${_pkgname}.git#commit=412d2898f0de978fd8fb308e43a4349f53505681"
  "https://github.com/sickcodes/anbox-modules/commit/7c19d3c66758747d854c63e4c34ef127ce201fa6.patch")
sha256sums=('SKIP'
  '7589f311fd9a503c30a214b54f1f687c26a2f160d4339098c65f655e9b1e3556')
conflicts=('anbox-modules-dkms-git' 'anbox-modules-dkms')

# prepare() {
#   cd "${srcdir}/${_pkgname}"
#
#   # Patch for 5.10-lts
#   patch -p1 -i "${srcdir}"/7c19d3c66758747d854c63e4c34ef127ce201fa6.patch
# }

package() {

  install -dm755 "${pkgdir}/usr/src/anbox-binder-1"
  install -dm755 "${pkgdir}/usr/src/anbox-ashmem-1"

  echo 'Copying files..'
  cp -r "${srcdir}/${_pkgname}/binder/"* "${pkgdir}/usr/src/anbox-binder-1/"
  cp -r "${srcdir}/${_pkgname}/ashmem/"* "${pkgdir}/usr/src/anbox-ashmem-1/"

  echo 'Building anbox-ashmem..'
  cd "${srcdir}/${_pkgname}/binder"
  make
  make DESTDIR="${pkgdir}/usr/src/anbox-binder-1" install

  echo 'Building anbox-binder..'
  cd "${srcdir}/${_pkgname}/ashmem"
  make
  make DESTDIR="${pkgdir}/usr/src/anbox-ashmem-1" install

  echo 'Build done! Please reboot after install to apply changes!'
  echo '**********************************************************'
  echo '
  # Verify by loading these modules and checking the created devices:
  sudo modprobe ashmem_linux
  sudo modprobe binder_linux
  lsmod | grep -e ashmem_linux -e binder_linux
  ls -alh /dev/binder /dev/ashmem
  '

#   echo '** To activate binder_linux and ashmem_linux **
# # $ sudo modprobe binder_linux devices=binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder
# # $ sudo modprobe ashmem_linux'

}

# sudo modprobe binder_linux devices=binder,hwbinder,vndbinder,anbox-binder,anbox-hwbinder,anbox-vndbinder
# sudo modprobe ashmem_linux

# vim:set ts=2 sw=2 et:
