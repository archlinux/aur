# Maintainer: RAMA <nooviex@gmail.com>
pkgname=sysc-greet-sway
pkgver=1.0.4
pkgrel=3
pkgdesc="Graphical console greeter for greetd with Sway as the compositor"
arch=('x86_64')
url="https://github.com/Nomadcxx/sysc-greet"
license=('MIT')
depends=('greetd' 'swww' 'sway' 'kitty')
makedepends=('go' 'git')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-greet/archive/v${pkgver}.tar.gz")
sha256sums=('0fc8a2a0da2aa6ffd64d9cee6a7ac26a7249379c9d0650df89974f93114a8916')

build() {
  cd "${srcdir}/sysc-greet-${pkgver}"
  go build -buildvcs=false -o sysc-greet ./cmd/sysc-greet/
}

package() {
  cd "${srcdir}/sysc-greet-${pkgver}"
  
  # Install binary
  install -Dm755 sysc-greet "${pkgdir}/usr/local/bin/sysc-greet"
  
  # Install ASCII configs
  install -dm755 "${pkgdir}/usr/share/sysc-greet/ascii_configs"
  cp -r ascii_configs/* "${pkgdir}/usr/share/sysc-greet/ascii_configs/"

  # Install fonts
  install -dm755 "${pkgdir}/usr/share/sysc-greet/fonts"
  cp -r fonts/* "${pkgdir}/usr/share/sysc-greet/fonts/"

  # Install Assets if present
  if [ -d "Assets" ]; then
    install -dm755 "${pkgdir}/usr/share/sysc-greet/Assets"
    cp -r Assets/* "${pkgdir}/usr/share/sysc-greet/Assets/" 2>/dev/null || true
  fi

  # Install wallpapers
  if [ -d "wallpapers" ]; then
    install -dm755 "${pkgdir}/usr/share/sysc-greet/wallpapers"
    cp -r wallpapers/* "${pkgdir}/usr/share/sysc-greet/wallpapers/" 2>/dev/null || true
  fi

  # Create cache directory
  install -dm755 "${pkgdir}/var/cache/sysc-greet"
  install -dm755 "${pkgdir}/var/lib/greeter/Pictures/wallpapers"

  # Install documentation if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  fi
  
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
