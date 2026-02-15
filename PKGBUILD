# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cloud-hypervisor-git
pkgver=50.0.r139.gecb971a49
pkgrel=1
pkgdesc="An open source Virtual Machine Monitor (VMM) that runs on top of KVM"
arch=('x86_64')
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
license=('Apache-2.0' 'BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=("cloud-hypervisor=$pkgver")
conflicts=('cloud-hypervisor')
source=("git+https://github.com/cloud-hypervisor/cloud-hypervisor.git")
sha256sums=('SKIP')


prepare() {
  cd "cloud-hypervisor"

  if [ ! -f "cloud-hypervisor/Cargo.lock" ]; then
    cargo update \
      --manifest-path "cloud-hypervisor/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "cloud-hypervisor/Cargo.toml"
}

pkgver() {
  cd "cloud-hypervisor"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "cloud-hypervisor"

  #cargo test \
  #  --frozen \
  #  --manifest-path "cloud-hypervisor/Cargo.toml"
}

package() {
  cd "cloud-hypervisor"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/cloud-hypervisor/cloud-hypervisor"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/cloud-hypervisor"
  install -Dm644 "docs"/* -t "$pkgdir/usr/share/doc/cloud-hypervisor"
  install -Dm644 "LICENSES/BSD-3-Clause.txt" -t "$pkgdir/usr/share/licenses/cloud-hypervisor"
}
