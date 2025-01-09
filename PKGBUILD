# Maintainer: xEricL <aur@alpineclient.com>
pkgname=alpine-client
_gitname=pinnacle
pkgver=1.8.4
pkgrel=1
pkgdesc='A lightweight multi-version Minecraft modpack'
arch=('x86_64')
url='https://alpineclient.com'
license=('MPL2')
depends=('glibc' 'tar' 'xorg-xrandr' 'xdg-desktop-portal' 'zenity')
options=(!strip !debug)
makedepends=('go>=1.23.4' 'git')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/alpine-client/$_gitname/archive/$pkgver.tar.gz")
# sha256sum is auto-generated in GitHub Actions workflow
sha256sums=('d0f20c46bd61c0e6126d255ff0472af818d1bd7e758e1670f359b6f012561d70')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$srcdir/$_gitname-$pkgver"
  go build -a -trimpath -buildmode=pie -mod=readonly -modcacherw \
    -ldflags="-s -w -linkmode=external -X main.version=$pkgver" \
    -o alpine-client .
}

package() {
  install -Dm755 \
        "$srcdir/$_gitname-$pkgver/alpine-client" \
        "$pkgdir/usr/bin/alpine-client"
  install -Dm644 \
        "$srcdir/$_gitname-$pkgver/ci/pkg/linux/arch/alpine-client.desktop" \
        "$pkgdir/usr/share/applications/alpine-client.desktop"
  install -Dm644 \
        "$srcdir/$_gitname-$pkgver/ci/pkg/linux/arch/alpine-client.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/alpine-client.png"
  install -Dm644 \
        "$srcdir/$_gitname-$pkgver/ci/pkg/linux/arch/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
