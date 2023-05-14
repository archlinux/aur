# Merged with official ABS distorm PKGBUILD by João, 2023/05/14 (all respective contributors apply herein)
# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Dmitry A. Ilyashevich <dmitry.ilyashevich@gmail.com>

pkgbase=distorm-git
pkgname=(distorm-git python-distorm-git)
pkgver=3.5.2b_r321.g7a02caa
pkgrel=1
pkgdesc='Powerful disassembler library for x86/AMD64'
url='https://github.com/gdabah/distorm'
arch=($CARCH)
license=(BSD)
makedepends=(git python python-setuptools glibc)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
options=(staticlibs)
source=("git+https://github.com/gdabah/${pkgbase%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  _ver="$(git describe --tags | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgbase%-git}
  make -C make/linux CFLAGS="${CFLAGS} ${CPPFLAGS} -fPIC"
  python setup.py build
}

package_distorm-git() {
  depends=('glibc')
  provides=('libdistorm3.so')
  cd ${pkgbase%-git}
  make -C make/linux PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 include/*.h -t "${pkgdir}/usr/include"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  ln -sf "/usr/lib/libdistorm3.so.$(grep 'LIB_R_VERSION =' make/linux/Makefile|cut -d' ' -f3)" "${pkgdir}/usr/lib/libdistorm3.so"
}

package_python-distorm-git() {
  depends=('python')
  cd ${pkgbase%-git}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}
