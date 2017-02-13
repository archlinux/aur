# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on hplip from [extra]

pkgname=hplip-minimal
pkgver=3.16.11
pkgrel=2
pkgdesc="The HP printer drivers, and not much else"
arch=('i686' 'x86_64' 'armv6h')
url="http://hplipopensource.com"
license=('GPL')
depends=('ghostscript>=8.64-6')
makedepends=('cups' 'libusb')
optdepends=('cups: for printing support' 'libusb: for advanced usb support')
conflicts=('hplip')
options=('!docs')
source=("http://downloads.sourceforge.net/hplip/hplip-$pkgver.tar.gz")
md5sums=('7d187c3142ba323a3021767d333ad9f4')

prepare() {
  cd "$srcdir/hplip-$pkgver"

  # https://bugs.archlinux.org/task/30085 - hack found in Gentoo
  # Use system foomatic-rip for hpijs driver instead of foomatic-rip-hplip
  # The hpcups driver does not use foomatic-rip
  local i
  for i in ppd/hpijs/*.ppd.gz ; do
    rm -f ${i}.temp
    gunzip -c ${i} | sed 's/foomatic-rip-hplip/foomatic-rip/g' |  gzip > ${i}.temp || return 1
    mv ${i}.temp ${i}
  done

  export AUTOMAKE='automake --foreign'
  autoreconf --force --install
}

build() {
  cd "$srcdir/hplip-$pkgver"

  ./configure --prefix=/usr --disable-qt4 --disable-doc-build --disable-dbus-build --disable-network-build \
              --disable-scan-build --disable-fax-build --disable-foomatic-rip-hplip-install \
              --enable-foomatic-ppd-install --enable-new-hpcups --disable-cups-drv-install \
              --enable-cups-ppd-install --enable-pp-build
  make
}

package() {
  cd "$srcdir/hplip-$pkgver"
  make DESTDIR="$pkgdir/" install

  # remove config provided by sane and autostart of hp-daemon
  rm -rf "$pkgdir"/etc/{sane.d,xdg}

  # remove HAL .fdi file because HAL is no longer used
  rm -rf "$pkgdir"/usr/share/hal

  # remove rc script
  rm -rf "$pkgdir"/etc/init.d
}
