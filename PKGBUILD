# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>

pkgname=vhba-module-dkms-git
_pkgname=vhba-module
pkgver=20170610.r2.g3008c64c
pkgrel=1
pkgdesc="Kernel module that emulates SCSI devices (DKMS, git master)"
url="http://cdemu.sourceforge.net/"
arch=(i686 x86_64)
license=(GPL)
depends=('dkms')
makedepends=(git 'linux-headers>=4.11' 'linux-headers<4.12' linux)
provides=("vhba-module=$pkgver-$pkgrel")
conflicts=(vhba-module)
install=$pkgname.install
_gitrepo=cdemu
source=("$_gitrepo::git+https://git.code.sf.net/p/cdemu/code"
        60-vhba.rules dkms.conf)
sha256sums=('SKIP'
            '3052cb1cadbdf4bfb0b588bb8ed80691940d8dd63dc5502943d597eaf9f40c3b'
            '8cab0ebb4fee72069d63616b0983f105b98d1261e72e9bef5509a6e60bc382a7')

prepare() {
  sed -e "s/#MODULE_VERSION#/${pkgver}/" -i "dkms.conf"
}

pkgver() {
  cd "${srcdir}/${_gitrepo}"
  git describe --long --tags --match "vhba-module-*" | sed -r 's/^vhba-module-//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_gitrepo/$_pkgname"
  install -Dt "$pkgdir/usr/src/${_pkgname}-$pkgver" -m644 Makefile vhba.c ../../dkms.conf
  install -Dt "$pkgdir/usr/lib/udev/rules.d" -m644 ../../60-vhba.rules
}

# vim:set ts=2 sw=2 et:
