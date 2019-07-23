##########################################################################
# Maintainer:   Harsha Kuchampudi <harshakuchampudi AT gmail DOT com>
# Github:       https://github.com/hkuchampudi/Windscribe
# Updated:      2019-03-09
##########################################################################

pkgname=windscribe-cli
pkgver=1.4_51
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
sha256sums_armv6h=('7e4731577e1c63c00cdc14a6bfc3320bbee2b04bdaa877d9265d0bb61254a66c')
sha256sums_i686=('5aae451347c7b0896d31ccb421ae2a9658e9ec18664cce126ab6525aa63bf05b')
sha256sums_x86_64=('ee4b8a574445ae1e2f83e6ae0b3fec91272fcd798d4130717ff229583a82d473')
sha256sums=('5be3a28e3b49a233b68ac4638bc5407e1fde043de5bfaddff00d0031947a6d06')

package() {
  # Extract the debian package
  echo "Extracting debian package"
  ar vx $srcdir/${pkgname}_${pkgver}_${pkgrel}.deb
  mkdir $srcdir/data
  mkdir $srcdir/control
  tar xf "data.tar.xz" -C "${srcdir}/data"
  tar xf "control.tar.gz" -C "${srcdir}/control"

  # Check the md5sums packaged with the Debian package
  echo "Checking packaged md5sums"
  cd $srcdir/data
  if ! md5sum -c $srcdir/control/md5sums; then
    "Packaged md5sum mismatch!"
    exit 1
  else
    cd $srcdir
  fi
  
  # Configure bash completion
  echo "Configuring bash completion"
  install -Dm644 "${srcdir}/data/etc/bash_completion.d/windscribe_complete" -t "${pkgdir}/etc/bash_completion.d/"

  # Make windscribe directory
  echo "Creating windscribe directory"
  mkdir $pkgdir/etc/windscribe

  # Configure systemd service
  echo "Configuring systemd service"
  install -Dm644 "${srcdir}/windscribe.service" -t "${pkgdir}/usr/lib/systemd/system/"
  
  # Configure windscribe binary and license
  echo "Configuring binary and license"
  install -Dm755 "${srcdir}/data/usr/bin/windscribe" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/data/usr/share/doc/windscribe-cli/copyright" "${pkgdir}/usr/share/licenses/windscribe-cli/LICENSE"
}
