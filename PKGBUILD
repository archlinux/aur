##########################################################################
# Maintainer:   Harsha Kuchampudi <harshakuchampudi AT gmail DOT com>
# Github:       https://github.com/hkuchampudi/Windscribe
# Updated:      2019-03-09
##########################################################################

pkgname=windscribe-cli
pkgver=1.3_19
pkgrel=1
pkgdesc="Port of Windscribe's command line interface"
arch=('x86_64' 'i686' 'armv6h')
url="https://windscribe.com/"
license=('GPL')
depends=('openvpn')
optdepends=('stunnel')
install="windscribe-cli.install"

# Platform specific binaries
source_armv6h=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver//_/-}_armhf.deb")
source_i686=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver//_/-}_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver//_/-}_amd64.deb")

# Common files
source=('windscribe.service')

# Checksums
sha256sums_armv6h=('af8938c03355c7523f3abbe2090cbc43b7f782c3f1caf90c19b91b03173dd524')
sha256sums_i686=('141d9d229cd94de6d5212f909840682f5bf2d85f0de91407cf7fec28ff79161f')
sha256sums_x86_64=('2adef3ff36423de681279a7f8ddaac29612779bdbcba9cf24098952646fa0253')
sha256sums=('5be3a28e3b49a233b68ac4638bc5407e1fde043de5bfaddff00d0031947a6d06')

package() {
  # Extract the debian package
  echo "Extracting debian package"
  ar vx $srcdir/${pkgname}_${pkgver}_${pkgrel}.deb
  mkdir $srcdir/data
  mkdir $srcdir/control
  tar xf "data.tar.xz" -C "${srcdir}/data"
  tar xf "control.tar.gz" -C "${srcdir}/control"
  
  # Configure bash completion
  echo "Configuring bash completion"
  install -Dm644 "${srcdir}/data/etc/bash_completion.d/windscribe_complete" -t "${pkgdir}/etc/bash_completion.d/"

  # Make windscribe directory
  echo "Creating windscribe directory"
  mkdir $pkgdir/etc/windscribe

  # Configure systemd service
  echo "Configuring systemd service"
  install -Dm644 "windscribe.service" -t "${pkgdir}/usr/lib/systemd/system/"
  
  # Configure windscribe binary and license
  echo "Configuring binary and license"
  install -Dm755 "${srcdir}/data/usr/bin/windscribe" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/data/usr/share/doc/windscribe-cli/copyright" "${pkgdir}/usr/share/licenses/windscribe-cli/LICENSE"
}
