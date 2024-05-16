# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: Faisal Moledina <faisal at moledina dot me>

_pkgname=onedriver
pkgname="$_pkgname-git"
pkgver=0.14.1.r8.gf07678f
pkgrel=1
pkgdesc="Native Linux filesystem for Microsoft OneDrive"
arch=('x86_64')
url='https://github.com/jstaf/onedriver'
license=('GPL3')
depends=('fuse3' 'webkit2gtk')
makedepends=('go')
provides=('onedriver')
conflicts=('onedriver')
source=("$_pkgname::git+$url")
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
  export CGO_ENABLED=1

  ./cgo-helper.sh

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
  install -Dm 755 -t "$pkgdir"/usr/bin $_pkgname{,-launcher}

  cd pkg/resources
  install -Dm 644 -t "$pkgdir"/usr/lib/systemd/user $_pkgname@.service
  install -Dm 644 -t "$pkgdir"/usr/share/applications $_pkgname-launcher.desktop
  install -Dm 644 -t "$pkgdir"/usr/share/icons/onedriver $_pkgname{.png,-128.png,.svg}
  install -Dm 644 -t "$pkgdir"/usr/share/man/man1 $_pkgname.1
}
