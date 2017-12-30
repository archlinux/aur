# Maintainer: Alexei Karpenko <alexei@karpenko.ca>
pkgname=gcc-xtensa-esp32-elf-git
_pkgname=crosstool-NG
pkgver=1.22.0.r75.gbaf03c2c
pkgrel=1
pkgdesc='ESP32 GCC Cross-compiler Toolchain'
arch=(x86_64)
url='https://esp-idf.readthedocs.io/en/latest/get-started/linux-setup.html'
license=(Apache)
depends=(glibc python ncurses python2-pyserial)
makedepends=(gcc git make flex bison gperf)
provides=(gcc-xtensa-esp32-elf)
conflicts=(gcc-xtensa-esp32-elf-bin)
options=(!libtool !buildflags)
source=(git+https://github.com/espressif/crosstool-NG.git#branch=xtensa-1.22.x)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  # cutting off 'crosstool.ng.' prefix that present in the git tag
  git describe --long | sed 's/^crosstool.ng.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  
  echo Building crosstool-ng...
  ./bootstrap
  ./configure --enable-local
  make

  echo Building xtensa-esp32-elf...
  ./ct-ng xtensa-esp32-elf 
  sed -i 's/^CT_GDB_CROSS_EXTRA_CONFIG_ARRAY.*/CT_GDB_CROSS_EXTRA_CONFIG_ARRAY="--with-guile=guile-2.0"/g' .config
  ./ct-ng build
}

package() {
  cd "$srcdir/${_pkgname}"
  for file in builds/xtensa-esp32-elf/bin/xtensa-esp32-elf*; do
    install -m 755 -D -t "$pkgdir/usr/bin" "${file}"
  done
}
