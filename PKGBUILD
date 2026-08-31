# Maintainer: KorigamiK <korigamik@gmail.com>

pkgname=psp-sdk-bin
pkgver=20260801
pkgrel=1
pkgdesc="PlayStation Portable Software Development Kit (binary version)"
arch=('x86_64')
url="https://github.com/pspdev/pspdev"
license=('MIT')
depends=('bash' 'expat' 'glibc' 'gmp' 'libgcc' 'libstdc++' 'mpfr' 'ncurses' 'pacman' 'xz' 'zstd')
optdepends=()
provides=('psp-sdk')
conflicts=('psp-sdk')
options=('!strip' 'emptydirs')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pspdev/pspdev/releases/download/v${pkgver}/pspdev-ubuntu-latest-x86_64.tar.gz")
sha256sums=('7a6cb2de21bfbc1d4aa06d10d0a45c547dedc8f6e1c8fc7ff8c7ba6eee667ee6')

package() {
  # Create destination directory
  install -dm755 "${pkgdir}/opt/pspdev"

  # Copy all files from the extracted archive to the package directory
  cp -a "${srcdir}/pspdev/"* "${pkgdir}/opt/pspdev/"

  # Use Arch's pacman instead of the bundled Ubuntu binary.
  sed -i 's|^export PATH=.*|export PATH="/usr/bin:${PATH}"|' "${pkgdir}/opt/pspdev/bin/psp-pacman"
  install -dm755 \
    "${pkgdir}/opt/pspdev/etc/pacman.d/gnupg" \
    "${pkgdir}/opt/pspdev/etc/pacman.d/hooks" \
    "${pkgdir}/opt/pspdev/share/libalpm/hooks"

  # Create environment setup file
  install -dm755 "${pkgdir}/etc/profile.d"
  cat >"${pkgdir}/etc/profile.d/pspdev.sh" <<EOF
export PSPDEV="/opt/pspdev"
export PATH="\$PATH:\$PSPDEV/bin"
EOF
  chmod 755 "${pkgdir}/etc/profile.d/pspdev.sh"

  # Install a custom license file if PSP SDK doesn't have one
  if [ ! -f "${pkgdir}/opt/pspdev/LICENSE" ]; then
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat >"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
See the project page at ${url} for license information.
EOF
  fi
}
