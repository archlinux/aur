pkgname=coreos-cloudinit-git
pkgver=1.10.1.r0.g1cd1ecb
pkgrel=5
pkgdesc="coreos-cloudinit"
arch=('x86_64')
url="https://github.com/coreos/coreos-cloudinit"
license=(apache)
makedepends=('go')
conflicts=('cloud-init' 'coreos-cloudinit')
source=("$pkgname::git+$url" "coreos-cloudinit.service" "switch_core_user.patch")
sha256sums=(
  'SKIP' 
  'a640d582e7fc9024d8a7c394f390020bfabf1c5a0d32d659693f9a2db8275d58' 
  '704088383d9201932c7a78d05781435bac7eb8e1d009999a849ac44b27d9d56a'
)
optdepends=('update-ssh-keys: ssh key management support')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  patch -p1 < ../switch_core_user.patch
  ./build
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${pkgname}/bin/* ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/etc/systemd/system/multi-user.target.wants
  cp coreos-cloudinit.service ${pkgdir}/etc/systemd/system/multi-user.target.wants
}

# vim:set ts=2 sw=2 et:
