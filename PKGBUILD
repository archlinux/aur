# Maintained by Faisal Moledina (faisal at moledina dot me)
pkgname=onedriver-git
_pkgname=onedriver
pkgver=0.12.0.r11.g65be12a
pkgrel=1
pkgdesc="Native Linux filesystem for Microsoft OneDrive"
arch=('x86_64')
url='https://github.com/jstaf/onedriver'
license=('GPL3')
depends=(
  'fuse2'
  'webkit2gtk'
)
makedepends=('go')
provides=('onedriver')
conflicts=('onedriver')
source=("$_pkgname::git+$url.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.commit=$(git rev-parse HEAD) -linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/onedriver

  export CGO_CFLAGS="-Wno-deprecated-declarations ${CFLAGS}"

  go build \
    -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.commit=$(git rev-parse HEAD) -linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/onedriver-launcher
}

package() {
  cd "$_pkgname"

  install -Dm 755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm 755 $_pkgname-launcher "$pkgdir"/usr/bin/$_pkgname-launcher

  install -Dm 644 "resources/$_pkgname@.service" "$pkgdir"/usr/lib/systemd/user/"$_pkgname@.service"
  install -Dm 644 resources/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm 644 resources/$_pkgname.png "$pkgdir"/usr/share/icons/onedriver/$_pkgname.png
  install -Dm 644 resources/$_pkgname.svg "$pkgdir"/usr/share/icons/onedriver/$_pkgname.svg
  install -Dm 644 resources/$_pkgname.1 "$pkgdir"/usr/share/man/man1/$_pkgname.1
}
