# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=labjack-exodriver-git
_gitname="labjack-exodriver"
pkgver=161.612b06a
pkgrel=1
pkgdesc="Linux low-level LabJack U12, U3, U6, UE9, Digit and T7 USB library"
arch=('i686' 'x86_64')
url="http://labjack.com/support/software"
license=('MIT')
depends=("libusbx")
makedepends=('git')
provides=('labjack-exodriver')
conflicts=('labjack-exodriver')
install='labjack-exodriver.install'
source=("${_gitname}::git+git://github.com/labjack/exodriver.git" 'LICENSE')
md5sums=('SKIP'
'6b654d05134aa959b7db1f4b05c7f33d')

pkgver() {
  cd "${srcdir}"/"${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}"/"${_gitname}"

  sed -i -e 's:/usr/local/:/usr/:g' liblabjackusb/Makefile
  sed -i -e 's:GROUP="adm":GROUP="labjack":g' 10-labjack.rules
  cd liblabjackusb
  make
  ln -s liblabjackusb.so.* liblabjackusb.so

}

package() {
  cd "$srcdir/${_gitname}"
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include
  mkdir -p ${pkgdir}/usr/share/doc/labjack-exodriver
  install -D -m755 liblabjackusb/liblabjackusb.so.* ${pkgdir}/usr/lib/
  cp -dpr --no-preserve=ownership \
    liblabjackusb/liblabjackusb.so ${pkgdir}/usr/lib/liblabjackusb.so
  install -D -m644 10-labjack.rules \
    ${pkgdir}/lib/udev/rules.d/10-labjack.rules
  install -D -m644 liblabjackusb/labjackusb.h ${pkgdir}/usr/include/
  install -D -m644 ../LICENSE \
    ${pkgdir}/usr/share/licenses/labjack-exodriver/LICENSE
  cp -dpr --no-preserve=ownership \
    examples ${pkgdir}/usr/share/doc/labjack-exodriver
}

# vim:set ts=2 sw=2 et:
