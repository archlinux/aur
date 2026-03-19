# Maintainer: brooqs <brooqs@users.noreply.github.com>
pkgname=steward
pkgver=1.2.1
pkgrel=1
pkgdesc='AI Personal Assistant — single binary, multi-provider, voice-enabled'
arch=('x86_64' 'aarch64')
url='https://github.com/brooqs/steward'
license=('MIT')
depends=('glibc')
makedepends=('go' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brooqs/steward/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  # Build embedded admin frontend
  cd internal/admin/frontend
  npm ci
  npm run build
  cd ../../..

  # Build Go binary
  export CGO_ENABLED=0
  go build -trimpath \
    -ldflags="-s -w -X main.version=${pkgver}" \
    -o steward ./cmd/steward

  go build -trimpath \
    -ldflags="-s -w -X main.version=${pkgver}" \
    -o steward-satellite ./cmd/satellite
}

package() {
  cd "${pkgname}-${pkgver}"

  # Binaries
  install -Dm755 steward "${pkgdir}/usr/bin/steward"
  install -Dm755 steward-satellite "${pkgdir}/usr/bin/steward-satellite"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Example config
  install -Dm644 config/core.yml.example "${pkgdir}/etc/steward/core.yml.example"

  # Integration examples
  install -dm755 "${pkgdir}/etc/steward/integrations"
  for f in config/integrations/*.yml.example; do
    [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/etc/steward/integrations/$(basename $f)"
  done

  # Systemd service
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/steward.service" << 'EOF'
[Unit]
Description=Steward AI Personal Assistant
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/steward -config /etc/steward/core.yml
Restart=always
RestartSec=5
Environment=HOME=/var/lib/steward

[Install]
WantedBy=multi-user.target
EOF
}
