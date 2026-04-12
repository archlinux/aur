# Maintainer: nealinux <vimlinux@proton.me>
# Contributor: Tenshi65535 <wu.junyu.aur@outlook.com>
# Contributor: ston <2424284164@qq.com>
pkgname=go-musicfox
pkgver=4.8.2
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64' 'aarch64')
provides=('musicfox')
conflicts=('go-musicfox-bin' 'musicfox')
depends=('flac' 'libpulse' 'dbus')
makedepends=('go' 'gcc' 'pkgconf')
optdepends=('mpv: mpv player backend'
            'mpd: MPD player backend')
# makedepends=('gcc-objc' 'go')
pkgsrcdir=${pkgname}-${pkgver}
source=("$pkgname-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('55f2c9e85022e77cd84346a1567fb06e1916703f9cbd2647c2bb57f9b4672947')


build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export GOPROXY="https://goproxy.cn,direct"
  go build \
    -trimpath \
    -buildmode=pie \
    -ldflags "-s -w -X github.com/go-musicfox/go-musicfox/internal/types.AppVersion=v$pkgver" \
    -o bin/musicfox \
    ./cmd
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/musicfox "$pkgdir/usr/bin/musicfox"
  install -Dm644 deploy/musicfox.desktop "$pkgdir/usr/share/applications/musicfox.desktop"
  install -Dm644 previews/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/musicfox.png"
  install -Dm644 deploy/io.github.go_musicfox.go-musicfox.appdata.xml \
    "$pkgdir/usr/share/metainfo/io.github.go_musicfox.go-musicfox.appdata.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
