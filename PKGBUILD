# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>

set -u
_cvs='-git'
pkgbase="ghostscript${_cvs}"
pkgname=("ghostscript${_cvs}" "ghostxps${_cvs}" "ghostpcl${_cvs}")
pkgver=9.25.r6012.g95281026d
_pkgver="${pkgver%%.r*}"
_pkgverm="${_pkgver%.*}"
pkgrel=1
pkgdesc="An interpreter for the PostScript language"
arch=('i686' 'x86_64')
url="https://www.ghostscript.com/"
license=('AGPL3' 'custom')
depends=('libxt' 'libcups' 'fontconfig' 'zlib' 'libpng' 'libjpeg' 'jbig2dec'
         'libtiff' 'lcms2' 'dbus' 'libpaper' 'ijs' 'openjpeg2')
makedepends=('gtk3' 'gnutls' 'glu' 'freeglut')
makedepends+=('git')
_srcdir=ghostpdl
source=('git://git.ghostscript.com/ghostpdl.git')
md5sums=('SKIP')
sha256sums=('SKIP')

if [ ! -z "${_cvs}" ]; then
pkgver() {
  set -u
  cd "${_srcdir}"
  local _ver1="$(sed -n -e 's:^GS_VERSION_MAJOR=\(.\+\)$:\1:p' 'base/version.mak')"
  local _ver2="$(sed -n -e 's:^GS_VERSION_MINOR=\(.\+\)$:\1:p' 'base/version.mak')"
  local _rev="$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
  _rev="${_rev#ghostpdl.}"
  printf '%s.%s.%s' "${_ver1}" "${_ver2}" "${_rev}"
  set +u
}
  for _pkg in "${pkgname[@]}"; do
    eval "package_${_pkg} () { package_${_pkg%${_cvs}}; }"
  done
fi

prepare() {
  set -u
  cd "${_srcdir}"

  # force it to use system-libs
  rm -r cups/libs expat ijs jbig2dec jpeg lcms2mt libpng openjpeg tiff zlib
  # using tree freetype because of https://bugs.archlinux.org/task/56849
  # lcms2mt is the new lcms2 fork aimed to replace lcms2 in a thread safe way
  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  if [ ! -s 'configure' ]; then
    autoconf
  fi

  if [ ! -s 'Makefile' ]; then
  ./configure --prefix=/usr \
              --enable-dynamic \
              --with-ijs \
              --with-jbig2dec \
              --with-x \
              --with-drivers=ALL \
              --with-fontpath=/usr/share/fonts/gsfonts \
              --enable-fontconfig \
              --enable-freetype \
              --enable-openjpeg \
              --without-luratech \
              --with-system-libtiff \
              --with-libpaper \
              --disable-compile-inits #--help # needed for linking with system-zlib
  fi

  make so-only
  set +u
}

package_ghostscript() {
  set -u
  provides=("ghostscript=${_pkgver}")
  conflicts=('ghostscript')
  optdepends=('texlive-core:      needed for dvipdf'
              'gtk3:              needed for gsx')

  cd "${_srcdir}"

  make DESTDIR="${pkgdir}" \
       CUPSSERVERROOT="${pkgdir}$(cups-config --serverroot)" \
       CUPSSERVERBIN="${pkgdir}$(cups-config --serverbin)" \
       soinstall
  ln -s gsc "${pkgdir}"/usr/bin/gs

  # remove useless broken doc/ symlink - FS#59507
  rm -f "${pkgdir}"/usr/share/ghostscript/${_pkgver}/doc

  # remove unwanted localized manpages
  rm -r "${pkgdir}"/usr/share/man/de

  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 LICENSE
  set +u
}

package_ghostxps() {
  set -u
  provides=("ghostxps=${_pkgver}")
  conflicts=('ghostxps')
  pkgdesc="${pkgdesc/PostScript/XPS document}"
  depends=("ghostscript=${_pkgver}-${pkgrel}")

  cd "${_srcdir}"

  install -Dt "${pkgdir}"/usr/bin sobin/gxpsc
  ln -s gxpsc "${pkgdir}"/usr/bin/gxps

  install -Dt "${pkgdir}"/usr/lib sobin/libgxps.so.${_pkgver}
  ln -s libgxps.so.${_pkgver} "${pkgdir}"/usr/lib/libgxps.so.${_pkgverm}

  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 LICENSE
  set +u
}

package_ghostpcl() {
  set -u
  provides=("ghostpcl=${_pkgver}")
  conflicts=('ghostpcls')
  pkgdesc="${pkgdesc/PostScript/PCL 6}"
  depends=("ghostscript=${_pkgver}-${pkgrel}")

  cd "${_srcdir}"

  install -Dt "${pkgdir}"/usr/bin sobin/gpcl6c
  ln -sf gpcl6c "${pkgdir}"/usr/bin/gpcl6

  install -Dt "${pkgdir}"/usr/lib sobin/libgpcl6.so.${_pkgver}
  ln -s libgpcl6.so.${_pkgver} "${pkgdir}"/usr/lib/libgpcl6.so.${_pkgverm}

  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 LICENSE
  set +u
}
set +u
