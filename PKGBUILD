# Maintainer: Shaun <shaun@lastra.us>
pkgname=livekit-ingress
pkgver=1.5.0
pkgrel=1
pkgdesc="Ingest streams (RTMP/WHIP) or files (HLS, MP4) to LiveKit WebRTC"
arch=('x86_64')
url="https://github.com/livekit/ingress"
license=('Apache-2.0')
depends=('gstreamer' 'gst-plugins-base-libs' 'redis')
optdepends=(
  'gst-plugins-base: For transcoding support'
  'gst-plugins-good: For transcoding support'
  'gst-plugins-bad: For transcoding support'
  'gst-plugins-ugly: For transcoding support'
  'gst-libav: For transcoding support'
)
makedepends=('go' 'git')
backup=('etc/livekit/ingress.yaml')
install=livekit-ingress.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/livekit/ingress/archive/refs/tags/v${pkgver}.tar.gz"
        "livekit-ingress.service"
        "ingress.yaml")
sha256sums=('6fe9d89dc5d9069c192b0c5d771a92d64652fdebf903b1182997f535244a7042'
            '09b64847bba802b4e0f6e4c5044f4ac6b6f308eb50e3ae468eac0e51ec895064'
            'e1bffd98c11d0cde574ddf7a063757bb59ddf8deff2902b8c26213bfab31fbab')

build() {
  cd "${srcdir}/ingress-${pkgver}"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o livekit-ingress ./cmd/server
}

package() {
  install -Dm755 "${srcdir}/ingress-${pkgver}/livekit-ingress" "${pkgdir}/usr/bin/livekit-ingress"

  # Per-session handler subprocess: server spawns `ingress run-handler ...` via PATH
  # (see pkg/service/cmd.go upstream). Symlink instead of duplicating the binary.
  ln -s livekit-ingress "${pkgdir}/usr/bin/ingress"

  install -Dm644 "${srcdir}/livekit-ingress.service" "${pkgdir}/usr/lib/systemd/system/livekit-ingress.service"
  install -Dm644 "${srcdir}/ingress.yaml" "${pkgdir}/etc/livekit/ingress.yaml"
  install -Dm644 "${srcdir}/ingress-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
