# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=cast-helper-git
_pkgname=cast-helper
pkgver=0.2.1.r0.gcfcf3c8
pkgrel=1
pkgdesc="Chromecast and AirPlay mirroring and media playback, shared by the Dux Shell Cast plugin and other apps (latest master)"
arch=('x86_64' 'aarch64')
url="https://github.com/Conava/cast-helper"
license=('MIT')
depends=('glibc' 'avahi' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugin-pipewire' 'gst-plugin-va')
makedepends=('go' 'git')
optdepends=('gst-plugins-good: more formats and photos'
            'gst-libav: converting videos'
            'libheif: HEIC photos'
            'doubletake-bin: AirPlay mirroring')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  CGO_ENABLED=0 go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-s -w" -o cast-helper .
}

package() {
  cd "$pkgname"
  install -Dm755 cast-helper "$pkgdir/usr/bin/cast-helper"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
