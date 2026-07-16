# Maintainer: ForeverZer0 <efreed09@gmail.com>

pkgname=klack
pkgver=1.1.0
pkgrel=1
pkgdesc="A mechanical keyboard sound simulator"
url="https://codeberg.org/ForeverZer0/$pkgname"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('alsa-lib' 'pipewire-alsa')
makedepends=('zig>=0.16.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cedb4ccf464b17e5bc77238864ecc799312b8d3a757364b10a3f5730dc13196a')

build() {
  cd "${srcdir}/${pkgname}"

  zig build \
    -Doptimize=ReleaseFast \
    --prefix "${srcdir}/install" \
    --global-cache-dir "${srcdir}/.zig-cache" \
    --summary all
}

package() {
  cd "${srcdir}/${pkgname}"
  # Install the compiled binary
  install -Dm755 "${srcdir}/install/bin/$pkgname" "${pkgdir}/usr/bin/$pkgname"
  # Install systemd service
  install -dm755 "${pkgdir}/usr/lib/systemd/user"

  install -Dm644 "completions/klack.bash" "${pkgdir}/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "completions/_klack" "${pkgdir}/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "completions/klack.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/$pkgname.fish"

  cat <<EOF >"${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
[Unit]
Description=klack - Mechanical Keyboard Sound Simulator
Documentation=https://codeberg.org/ForeverZer0/klack

[Service]
Type=simple
ExecStart=/usr/bin/klack
Restart=on-failure
RestartSec=2s

[Install]
WantedBy=default.target
EOF
  # Install documentation and license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
