# Maintainer: Fernando Nogueira <mrfernando2509@gmail.com>

pkgname=supabase-git
_pkgname=supabase
pkgver=r195.764c066
pkgrel=1
pkgdesc='Supabase CLI'
arch=(x86_64 i686)
url="https://github.com/supabase/cli"
license=('MIT')
makedepends=('go')
provides=(supabase)
conflicts=(supabase)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd cli
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd cli
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -o $_pkgname
}

package() {
  cd cli
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

pkgver() {
    cd cli
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
