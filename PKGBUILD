# Maintainer: azerty
# Owner: ycftbwc

pkgname=gecit-unofficial
pkgver=0.1.4
pkgrel=1
pkgdesc="DPI bypass tool using eBPF and fake TLS ClientHello injection"
arch=('x86_64' 'aarch64')
url="https://github.com/ycftbwc/gecit-unofficial"
license=('GPL3')
depends=('systemd')
makedepends=('go' 'git' 'clang' 'llvm' 'make')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  
  # makepkg scrubs the environment. We must explicitly export GOROOT
  # so the gobee AST parser can find standard libraries like 'unsafe'.
  export GOROOT="$(go env GOROOT)"
  export GOPATH="${srcdir}/gopath"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  
  # Use the Makefile targets for the specific architecture
  if [[ "$CARCH" == "x86_64" ]]; then
    make gecit-linux-amd64
  elif [[ "$CARCH" == "aarch64" ]]; then
    make gecit-linux-arm64
  fi
}

package() {
  cd "$pkgname"
  
  # Use a wildcard to install the compiled binary regardless of architecture
  install -Dm755 bin/gecit-linux-* "$pkgdir/usr/bin/gecit"
  
  # We need to manually construct the systemd service file here since the install.sh
  # script writes it directly to /etc/systemd/system/ during execution.
  # We will install it to /usr/lib/systemd/system/ which is the standard location for pacman packages.
  
  install -d "$pkgdir/usr/lib/systemd/system/"
  cat > "$pkgdir/usr/lib/systemd/system/gecit.service" <<EOF
[Unit]
Description=gecit DPI bypass (eBPF)
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/gecit run --fake-ttl 3 --doh=false
ExecStopPost=/usr/bin/gecit cleanup
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

  # Install the LICENSE file
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
