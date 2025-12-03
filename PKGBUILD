# Maintainer: MatricalDefunkt <dev <at> matricaldefunkt <dot> me>
#
# This PKGBUILD downloads and installs PraxisLIVE from official GitHub releases.

pkgname=praxis-live-bin
pkgver=6.4.0
pkgrel=1
pkgdesc="Hybrid visual IDE for live programming"
arch=('x86_64')
url='https://www.praxislive.org/'
license=('GPL3')
depends=('java-runtime>=25' 'glibc' 'gcc-libs')
optdepends=('jack: for JACK audio support'
            'pipewire-jack: alternative JACK implementation')
options=('!strip')
install=praxis-live-bin.install
source=("praxislive_${pkgver}-${pkgrel}_amd64.deb::https://github.com/praxis-live/praxis-live/releases/download/v${pkgver}/praxislive_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('63ee576f42bfb030f6f477ec656c5c40a37c6bc80fc15083dabcd9aa6703e2b3')

package() {
  cd "${srcdir}"

  # Extract data from deb package
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  find "${pkgdir}" -type f -exec chmod 644 {} \;

  # Make executables executable in all bin directories
  find "${pkgdir}" -type f -path "*/bin/*" -exec chmod 755 {} \;
  
  # Ensure all .sh files are executable
  find "${pkgdir}" -type f -name "*.sh" -exec chmod 755 {} \;

  # Fix any symlinks or scripts in /usr/bin
  if [ -d "${pkgdir}/usr/bin" ]; then
    chmod 755 "${pkgdir}/usr/bin/"* 2>/dev/null || true
  fi

  # Remove the bundled JDK (incompatible with Arch Linux)
  # The bundled Java 24 cannot spawn processes due to glibc incompatibility
  rm -rf "${pkgdir}/usr/lib/praxislive/jdk"

  # Configure to use system Java instead of bundled JDK
  # Comment out the jdkhome setting in praxislive.conf
  sed -i 's/^jdkhome=/#jdkhome=/' "${pkgdir}/usr/lib/praxislive/etc/praxislive.conf"

  # Install license if it exists in the package
  if [ -f "${pkgdir}/usr/lib/praxislive/LICENSE" ]; then
    install -Dm 0644 "${pkgdir}/usr/lib/praxislive/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
