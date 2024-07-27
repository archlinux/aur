# Maintainer: xEricL <aur@alpineclient.com>
pkgname=alpine-client
_gitname=pinnacle
pkgver=1.7.1
pkgrel=1
pkgdesc='A lightweight multi-version Minecraft modpack'
arch=('x86_64')
url='https://alpineclient.com'
license=('MPL2')
depends=('glibc' 'xorg-xrandr')
options=(!strip !debug)
makedepends=('go>=1.22.5' 'git')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/alpine-client/$_gitname/archive/$pkgver.tar.gz")
# sha256sum is auto-generated in GitHub Actions workflow
sha256sums=('52384da0d249c949ed6db1ca6e72fb905324e311dbae161e600e798b79978237')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_gitname-$pkgver"
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
    -ldflags="-s -w -compressdwarf=false -linkmode=external -X main.version=$pkgver" \
    -o alpine-client .
}

package() {
  install -Dm755 \
        "$srcdir/$_gitname-$pkgver/alpine-client" \
        "$pkgdir/usr/bin/alpine-client"
  install -Dm644 \
        "$srcdir/$_gitname-$pkgver/pkg/linux/arch/alpine-client.desktop" \
        "$pkgdir/usr/share/applications/alpine-client.desktop"
  install -Dm644 \
        "$srcdir/$_gitname-$pkgver/pkg/linux/arch/alpine-client-icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/alpine-client-icon.png"
  install -Dm644 \
        "$srcdir/$_gitname-$pkgver/pkg/linux/arch/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
  update-desktop-database
}

post_remove() {
  update-desktop-database
}
