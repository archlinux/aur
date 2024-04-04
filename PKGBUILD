#
# PKGBUILD for black-magic-probe-utils
#
# Contributor: Uffe Jakobsen <_uffe_|_at_|_uffe_|_dot_|_org_>
# Maintainer: Uffe Jakobsen <_uffe_|_at_|_uffe_|_dot_|_org_>
#
pkgname=black-magic-probe-utils
pkgver=1.5.7087
pkgrel=1
epoch=
_pkgname="Black-Magic-Probe-Book"
_pkgver=${pkgver}
pkgdesc="Black Magic Debug Probe utilities (compuphase)"
arch=("x86_64" "i686")
url="https://github.com/compuphase/Black-Magic-Probe-Book"
license=("Apache-2.0")
depends=('nuklear' 'glfw' 'libusb' 'libbsd' 'zlib' 'gtk3')
source=("https://github.com/compuphase/Black-Magic-Probe-Book/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()

sha256sums=('731d9820fde1fd343399fe79a46425a0d864b91a840a01c22e433d1e1e023118')


prepare()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}/source"
  ln -s -f Makefile.linux Makefile
  rm -f makefile.cfg
  touch makefile.cfg
  echo "#" >> makefile.cfg
  echo "#GLFW_INC := -I~/develop/glfw-3.3/inc" >> makefile.cfg
  echo "#GLFW_LIB := -L~/develop/glfw-3.3/lib" >> makefile.cfg
  echo "#GLFW_LIBNAME := glfw3" >> makefile.cfg
  echo "GLFW_LIBNAME := glfw" >> makefile.cfg
  echo "# EOF" >> makefile.cfg
}

build()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}/source"
  #make -w --trace
  make
}

check()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}/source"
  #make -w --trace -k check
  #make check
}

package()
{
  #cd "${srcdir}/${_pkgname}-${_pkgver}/source"

  #
  #make prefix=/usr DESTDIR="${pkgdir}" install

  #
  cd "${srcdir}/${_pkgname}-${_pkgver}/source"
  install -d "${pkgdir}/usr/bin/"
  # install utils: bmflash bmdebug bmscan bmprofile bmserial bmtrace calltree elf-postlink tracegen
  install -m755 bmflash bmdebug bmscan bmprofile bmserial bmtrace "${pkgdir}/usr/bin/"
  install -D -m755 calltree "${pkgdir}/usr/bin/bmcalltree"
  install -D -m755 elf-postlink "${pkgdir}/usr/bin/bmelf-postlink"
  install -D -m755 tracegen "${pkgdir}/usr/bin/bmtracegen"

  #
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -d "${pkgdir}/usr/share/${pkgname}/examples/"
  install examples/* "${pkgdir}/usr/share/${pkgname}/examples/"

  #
  # udev rules: trigger cheap (China) STLink v2 clones to leave bootloader upon insertion and start flashed BlackMagic firmware/app
  install -D -m644 "${srcdir}/${_pkgname}-${_pkgver}/support/55-blackmagicprobe.rules" "${pkgdir}/usr/share/${pkgname}/etc/udev/rules.d/blackmagicprobe.rules"
  ln -s blackmagicprobe.rules "${pkgdir}/usr/share/${pkgname}/etc/udev/rules.d/55-blackmagicprobe.rules"
}

#
# EOF
#
