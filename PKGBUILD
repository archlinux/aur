# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=go2tv
pkgver=2.5.0
pkgrel=1
pkgdesc='Cast media files to Smart TVs and Chromecast devices'
arch=('x86_64')
url="https://github.com/alexballas/${pkgname}"
license=('MIT')
depends=('glibc' 'libx11' 'libglvnd' 'libpipewire' )
makedepends=('go' 'pkg-config' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi')
optdepends=('ffmpeg: transcoding support')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  # allow flag from `pkg-config --cflags libpipewire-0.3` - see also https://go.dev/wiki/InvalidFlag
  export CGO_CFLAGS_ALLOW="-fno-strict-overflow"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -ldflags "-s -w" -o go2tv cmd/go2tv/go2tv.go
}

package() {
  install -Dm755 $pkgname-$pkgver/$pkgname   "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname-$pkgver/LICENSE    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname-$pkgver/assets/linux/app.go2tv.go2tv.desktop "$pkgdir"/usr/share/applications/app.go2tv.go2tv.desktop
  install -Dm644 $pkgname-$pkgver/assets/linux/app.go2tv.go2tv.appdata.xml "$pkgdir"/usr/share/metainfo/app.go2tv.go2tv.appdata.xml
  install -Dm644 $pkgname-$pkgver/assets/go2tv-icon-desktop-512.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/app.go2tv.go2tv.png
  install -Dm644 $pkgname-$pkgver/assets/go2tv-icon-color.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/app.go2tv.go2tv.svg
}

sha256sums=('6e28cab4545975a118be1a1baeb2e40a1029ce1c23b6e868c0faac5c0d14912b')
