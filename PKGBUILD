# Maintainer: 古方元水 <ye@archlinux>
# Contributor: 糯米狐 <nuomihu@archlinux>

pkgname=hanako-bin
pkgver=0.331.4
pkgrel=1
pkgdesc="HanaAgent - a personal AI agent with memory and soul"
arch=('x86_64')
url="https://github.com/liliMozi/openhanako"
license=('Apache-2.0')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'libxkbcommon'
  'libxrandr'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxext'
  'libxrender'
  'xdg-utils'
  'at-spi2-core'
  'libsecret'
  'cups'
  'mesa'
  'egl-wayland'
  'dbus'
)
optdepends=(
  'pipewire: audio support'
  'pulseaudio: audio support (fallback)'
  'libappindicator-gtk3: system tray indicator'
)
options=('!strip')
provides=('hanako')
conflicts=('hanako')
source=("https://github.com/liliMozi/openhanako/releases/download/v${pkgver}/HanaAgent-${pkgver}-Linux-amd64.deb")
sha512sums=('745df3955c26545181f1ab0e222b2410ac3e10ffad79a96ce2e332eb396b671363e3208439aba975ebdc00e5c07f22aac04465347cce345fe02147074871da0b')

prepare() {
  cd "${srcdir}"
  # Extract deb archive
  ar x "HanaAgent-${pkgver}-Linux-amd64.deb"
}

package() {
  cd "${srcdir}"

  # Extract all files from deb's data.tar.xz
  tar xJf data.tar.xz -C "${pkgdir}"

  # CLI wrapper
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/hanako" << 'BINEOF'
#!/bin/sh
exec /opt/HanaAgent/hanako "$@"
BINEOF

  # Arch uses user namespaces for sandbox, no SUID needed
  chmod 0755 "${pkgdir}/opt/HanaAgent/chrome-sandbox"

  # AppArmor profile doesn't apply on Arch
  rm -f "${pkgdir}/opt/HanaAgent/resources/apparmor-profile"
}
