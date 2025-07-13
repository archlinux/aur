# Maintainer: Dae <daedaevibin@naver.com>
pkgname=voix
pkgver=0.0.16b
pkgrel=1
install=voix.install
pkgdesc="A privilege escalation tool that replaces sudo/doas/sudo-rs, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('AGPL-3.0-or-later' 'VCL-1.0')
depends=('pam')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
source=("https://github.com/Veridian-Zenith/Voix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "Voix-${pkgver}/src"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

backup=('etc/pam.d/voix')

package() {
  cd "Voix-${pkgver}/src"

  # Install binary with setuid bit in one go
  install -Dm4755 build/voix "${pkgdir}/usr/bin/voix"

  # Install config
  install -Dm644 lua/config.lua   "${pkgdir}/etc/voix/config.lua"

  # Install licenses
  install -Dm644 LICENSE-AGPLv3   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AGPLv3"
  install -Dm644 LICENSE-VCL1.0   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-VCL1.0"

 # Make sure PAM directory exists
  install -dm755 "${pkgdir}/etc/pam.d"

  # Create PAM config file
  cat > "${pkgdir}/etc/pam.d/voix" << EOF
auth     required   pam_unix.so
account  required   pam_unix.so
EOF
}
