# Maintainer: epitron <chris@ill-logic.com>

pkgname=kvmtool-git
pkgver=1573.3fea89a
pkgrel=1
pkgdesc="A lightweight (~5kloc) KVM-based virtual machine which can host Linux guests only"
license=('GPL2')
url="https://git.kernel.org/cgit/linux/kernel/git/will/kvmtool.git/"

arch=('i686' 'x86_64') # TODO: add ARM support!
depends=('binutils')   # TODO: create an AUR package that builds a lightweight, stripped-down lkvm kernel, and transfer the qemu boot image over to it
makedepends=('git')

source=(
  ${pkgname}::git+https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git
  http://wiki.qemu.org/download/linux-0.2.img.bz2
)

sha256sums=(
  SKIP
  41c222db3c669724dd202d2f0fe655ad88f847d8c263ed08bb90219082e7b423
)

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  install -Dm 755 lkvm -t "${pkgdir}/usr/bin"
  install -Dm 644 README ../linux-0.2.img -t "${pkgdir}/usr/share/kvmtool"

  cd "${pkgdir}/usr/bin"
  # ln -s lkvm vm
}
