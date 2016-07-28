# Maintainer: Marcel Huber <`echo "moc tknup liamg tä oofrebuhlecram" | rev`>

pkgbase=mpss
pkgname=(mpss-modules-dkms)
pkgver=3.7.1
pkgrel=1
arch=('x86_64')
url="https://software.intel.com/en-us/articles/intel-manycore-platform-software-stack-mpss"
license=('GPL2')
depends=('dkms')
source=(dkms.conf
        blacklist-mic-host.conf)
source_x86_64=(git+https://github.com/marcelhuberfoo/mpss-modules.git#branch=ModuleAndKernelUpdates)
sha256sums=('a76162c169073060ee3a966e95342f29b3e342c956d29169c10a6dd97e342fa5'
            '42dda3527ed2496b851c0fad6a841f660a0c086ecf742bb4f132308b9e38d913')
sha256sums_x86_64=('SKIP')

## within each split package’s packaging function:
# arch
# backup
# changelog
# conflicts
# depends
# groups
# install
# license
# optdepends
# options
# pkgdesc
# provides
# replaces
# url

package_mpss-modules-dkms() {
  install=$pkgname.install
  pkgdesc="Intel® Manycore Platform Software Stack; mic Kernel module"
  _pkgname=${pkg%-*}
  msg2 "Starting make conf_install...$(pwd)"
  make -C $_pkgname DESTDIR="$pkgdir" sysconfdir=/etc includedir=/usr/include \
    conf_install dev_install

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
  install -Dm644 blacklist-mic-host.conf "${pkgdir}"/etc/modprobe.d/
  sed -e "s|/sbin/modprobe|/usr/bin/modprobe|" \
      -i "${pkgdir}"/etc/sysconfig/modules/mic.modules

  sed '8,9 d' \
      -i "${pkgdir}"/etc/udev/rules.d/50-udev-mic.rules

  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  msg2 "Copy sources (including Makefile) for dmks build..."
  cp -r ${_pkgname}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  cp  ${_pkgname}/.mpss-metadata "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  rm "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/*mic.*

  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
