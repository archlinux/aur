# Maintainer: KorigamiK <korigamik@gmail.com>

pkgname=psp-sdk-bin
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="PlayStation Portable Software Development Kit (binary version)"
arch=('x86_64')
url="https://github.com/pspdev/pspdev"
license=('MIT')
depends=('bash')
optdepends=()
provides=('psp-sdk')
conflicts=('psp-sdk')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("https://github.com/pspdev/pspdev/releases/latest/download/pspdev-ubuntu-latest-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  # Create destination directory
  install -dm755 "${pkgdir}/opt/pspdev"

  # Copy all files from the extracted archive to the package directory
  cp -a "${srcdir}/pspdev/"* "${pkgdir}/opt/pspdev/"

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
