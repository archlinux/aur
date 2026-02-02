# Maintainer: ReelVault

pkgname=reelvault
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="Browse and launch your local film collection"
arch=('x86_64')
url="https://github.com/rabfulton/reelvault"
license=('MIT')
depends=('gtk3' 'sqlite' 'curl' 'json-c')
makedepends=('git' 'make' 'gcc' 'pkgconf')
source=("reelvault::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/reelvault"
  local describe revcount shorthash
  describe="$(git describe --tags --long --abbrev=7 2>/dev/null || true)"
  if [[ -n "$describe" ]]; then
    printf '%s\n' "$describe" | sed 's/^v//;s/-/./g'
  else
    revcount="$(git rev-list --count HEAD)"
    shorthash="$(git rev-parse --short HEAD)"
    printf '0.0.0.r%s.g%s\n' "$revcount" "$shorthash"
  fi
}

build() {
  cd "${srcdir}/reelvault"
  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/reelvault"
  make DESTDIR="${pkgdir}" install
}
