# Maintainer: Dae <daedaevibin@naver.com>
pkgname=voix
pkgver=0.0.16b
pkgrel=4
install=voix.install
pkgdesc="A privilege escalation tool replacing sudo/doas/sudo-rs, using PAM for authentication - WILL REPLACE SUDO!!"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('AGPL-3.0-or-later' 'VCL-1.0')
depends=('pam')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
replaces=('sudo')
conflicts=('sudo')
source=("https://github.com/Veridian-Zenith/Voix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d6387beedec95a242cedaf3dfedaa2af58c2b34fc96820be3247f39f2cb1164')

build() {
  cd "Voix-${pkgver}/src"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

backup=('etc/pam.d/voix')
backup=('etc/voix/config/lua')

package() {
  cd "Voix-${pkgver}/src"

  # Install binary (Setuid fix applied later)
  install -Dm4755 build/voix "${pkgdir}/usr/bin/voix"

  # Symlink /usr/bin/sudo -> /usr/bin/voix
  ln -sf /usr/bin/voix "${pkgdir}/usr/bin/sudo"

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
