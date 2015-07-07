# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: vorbote P. A. López-Valencia;  palopezv on Google's email service
# Contributor: ... (unknown)
# Contributor: fnord0; fnord0 AAAAAAAAAAAAATTTTTTTTTTTTTTTTT riseup net
# See AUR page for current maintainer.
# Category: system

# Versions after 9.10 drop svg and pspcl6. The extra binaries will be
# installed if the version you choose has a makefile produces them.
# This PKGBUILD is tested to work with versions 9.10 and 9.16
# and should work with later versions.
# Just change pkgver and run updpgksums.

# 6. What is GhostSVG?
# GhostSVG is an interpreter for SVG (Scalable Vector Graphics) files. This
# consists of an SVG interpreter hooked up to the Ghostscript graphics library.
# This project has acheived proof of concept, but is not actively being worked
# on.

# Recommended build command: makepkg -scCfi

set -u
pkgname='ghostpdl'
pkgver='9.16'
pkgrel='1'
pkgdesc='Ghostscript RIP for PS, PDF, PCL-5, PCL-XL, SVG and XPS.'
arch=('i686' 'x86_64')
url='http://www.ghostscript.com'
license=('AGPL')
depends=('ghostscript' 'glu' 'freeglut' 'libjpeg' 'libxt')
source=("http://downloads.ghostscript.com/public/${pkgname}-${pkgver}.tar.bz2") # .gz and .bz2 are available. Unpacking .bz2 is a LOT slower so is not suited for package testing.
sha256sums=('4a2e23bd61b345ddb14ee942c51dc817dcb8e3a8cdbbd507fa9401e5946f2915')

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  # get rid of a harmless shell warning
  sed -i -e 's:^\(if test \)\($ac_cv_c_compiler_gnu\)\( = yes; then\)$:\1"\2"\3:g' configure
  # Compiling is several minutes even on a very fast computer. 
  # This prevents recompile so we can use 'makepkg -fe' to test packaging.
  if [ ! -s 'config.status' ]; then
    ./configure --prefix=/usr
  fi
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/${pkgname}/doc"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.AFPL"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _exe in 'main/obj/pcl6' 'svg/obj/gsvg' 'language_switch/obj/pspcl6' 'xps/obj/gxps'; do
    if [ -x "${srcdir}/${pkgname}-${pkgver}/${_exe}" ]; then # pspcl6 and svg were dropped after 9.10
      _exeb="`basename "${_exe}"`"
      install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${_exe}" "${pkgdir}/usr/share/${pkgname}/${_exeb}"
      ln -sf "/usr/share/${pkgname}/${_exeb}" "${pkgdir}/usr/bin/"
    fi
  done
  for _exe in 'tools/pcl2pdf' 'tools/pcl2pdfwr'; do
    ln -sf "/usr/share/${pkgname}/${_exe}" "${pkgdir}/usr/bin/"
  done
  cp -pr 'tools' "${pkgdir}/usr/share/${pkgname}/"
  cp -pr 'urwfonts' "${pkgdir}/usr/share/${pkgname}/"
  for _doc in 'README.txt' doc/ghost* 'doc/who_owns_what.txt'; do
    install -Dm644 "${_doc}" "${pkgdir}/usr/share/${pkgname}/doc/${_doc}"
  done
  set +u
}
set +u
