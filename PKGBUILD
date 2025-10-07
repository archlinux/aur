# Maintainer: Shaun <shaun@lastra.us>
pkgname=livekit-ingress
pkgver=1.4.3
pkgrel=4
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
sha256sums=('f6fbeb97d324019b4aa1536be09e560eb6b5ac05c8f8e289e096c10a8c2d4a8d'
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

  # Build main server binary with native Arch GStreamer
  go build -o livekit-ingress ./cmd/server

  # The same binary serves as both server and transcoding helper
  # Just copy it with the expected name
  cp livekit-ingress ingress
}

package() {
  # Install main server binary
  install -Dm755 "${srcdir}/ingress-${pkgver}/livekit-ingress" "${pkgdir}/usr/bin/livekit-ingress"

  # Install transcoding helper (same binary, different name)
  install -Dm755 "${srcdir}/ingress-${pkgver}/ingress" "${pkgdir}/usr/bin/ingress"

  # Install systemd service
  install -Dm644 "${srcdir}/livekit-ingress.service" "${pkgdir}/usr/lib/systemd/system/livekit-ingress.service"

  # Install default config
  install -Dm644 "${srcdir}/ingress.yaml" "${pkgdir}/etc/livekit/ingress.yaml"
}
