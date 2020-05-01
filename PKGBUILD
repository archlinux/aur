# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cloud-hypervisor-git
pkgver=0.7.0.r2.g2a16ce7e
pkgrel=1
pkgdesc="An open source Virtual Machine Monitor (VMM) that runs on top of KVM"
arch=('x86_64')
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
license=('apache' 'BSD')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=("git+https://github.com/cloud-hypervisor/cloud-hypervisor.git")
sha256sums=('SKIP')


pkgver() {
  cd "cloud-hypervisor"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/v//'
}

check() {
  cd "cloud-hypervisor"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "cloud-hypervisor"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/cloud-hypervisor"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/cloud-hypervisor"
  install -Dm644 "docs"/* -t "$pkgdir/usr/share/doc/cloud-hypervisor"
  install -Dm644 "LICENSE-BSD-3-Clause" -t "$pkgdir/usr/share/licenses/cloud-hypervisor"
}
