# Maintainer: 7Ji <pugokushin@gmail.com>

pkgname='usb2host'
pkgver='1.0'
pkgrel='1'
pkgdesc='A tiny program to put dual-role USB port to host mode'
url='https://github.com/7Ji/usb2host'
license=('GPL3')
install="${pkgname}".install
source=("${url}"/archive/refs/tags/v"${pkgver}".tar.gz)
sha256sums=('0a00ab9b3db484be2c90b0cb6a7c99d9a88f22b5768eed90605c3c631b048a23')
arch=('any')

_srcname="${pkgname}-${pkgver}"
build() {
  make -C "${_srcname}" 
}
package() {
  make -C "${_srcname}" install PREFIX="${pkgdir}" NODE='\$$NODE'
  # Arch-specific, use a config file instead of embedding the node name in service file.
  # This is not set in usb2host itself as when users install it they should already know the node name.
  # That, however, is not the case if we want to distribute the pacakge.
  sed 's_ExecStart_EnvironmentFile=/etc/conf.d/'"${pkgname}"'\n&_' \
    -i "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service
  {
    echo "# The node should exist under '/sys/kernel/debug/usb' and has a file entry 'mode'"
    echo "# e.g. for OrangePi5, it's 'fc000000.usb'"
    echo "NODE=fc000000.usb"
  } | \
    install -D --mode 644 /dev/stdin "${pkgdir}"/etc/conf.d/"${pkgname}"
}