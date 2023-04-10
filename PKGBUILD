# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cloud-hypervisor-git
pkgver=31.0.r1.g90dcbc323
pkgrel=1
pkgdesc="An open source Virtual Machine Monitor (VMM) that runs on top of KVM"
arch=('x86_64')
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
license=('Apache' 'BSD')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("cloud-hypervisor=$pkgver")
conflicts=('cloud-hypervisor')
source=("git+https://github.com/cloud-hypervisor/cloud-hypervisor.git")
sha256sums=('SKIP')


prepare() {
  cd "cloud-hypervisor"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "cloud-hypervisor"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "cloud-hypervisor"

  #cargo test \
  #  --frozen
}

package() {
  cd "cloud-hypervisor"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/cloud-hypervisor"
  install -Dm644 "docs"/* -t "$pkgdir/usr/share/doc/cloud-hypervisor"
  install -Dm644 "LICENSE-BSD-3-Clause" -t "$pkgdir/usr/share/licenses/cloud-hypervisor"
}
