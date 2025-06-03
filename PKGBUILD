# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="mp3splt"
pkgbase="${_basename}-gtk"
pkgname=("${pkgbase}"{,'-docs'})
_commit_rel="00b0f6298827678591e682543f12b02fca4c7075" # 0.9.3.1519
_commit="4b48268258c478993bd43703c0cdb0962b79f85f" # r4
pkgver="0.9.3.1519+r4+g${_commit::7}"
pkgrel=3
pkgdesc="Split mp3, ogg, and flac files without decoding - GTK3 GUI"
arch=('i686' 'x86_64')
url="https://${_basename}.sourceforge.net"
_url="https://github.com/${_basename}/${_basename}"
license=('GPL-2.0-or-later')
makedepends=('doxygen' 'graphviz' 'gstreamer>=1' 'gtk3>=3.4.2'
             'libaudclient>=3' 'libmp3splt>=0.9.3.1519') # 'gnome-doc-utils'
# checkdepends=('cutter-test_framework')
_pkgsrc="${_basename}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${_basename}_gcc10_no_common.patch"
        "${_basename}_gcc15_function_declaration.patch"
        "${_basename}_doxyfile_enable_search.patch")
b2sums=('39a816d6fecb3ae15dc4a36dc2a93c8b9f695800f4366465581e3cc8e77a4b1052a7fed0e02421d549e7100bb5014b16f3ce965c2c9e37d2abb7fc2079d590fd'
        'ebd400ca67cd862daa149cec08b7a82cb47993d726845c6e87edce7e8c718dc49da299047eff37621305adda6c423d56394b22453880bc81e93f32ffe1cf5852'
        'bd122ddafeef4ccbd3cab8d182efbaa5528e05c5e12ca57a9ff5806fb404098fab225e67d4f214206637f14194c9a0430e0e7aa42907ade2d7246d9f15051b50'
        'b5e791f379716aaf7edd17b21f098526399c7d227dc87e48fef300e1122a7f291b8a5e52c8bac7ca26972c125cd471e7bf7f3840590f580d76d91ae3e61c5cff')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://bugs.gentoo.org/707126, https://bugs.debian.org/957561
  patch -Np1 -i "${srcdir}/${_basename}_gcc10_no_common.patch"
  patch -Np1 -i "${srcdir}/${_basename}_gcc15_function_declaration.patch"
  patch -Np1 -i "${srcdir}/${_basename}_doxyfile_enable_search.patch"

  cd "${pkgbase}"
  sed -i 's/1518/1519/g' 'configure.ac' 'README'

  # disable gnome-doc-utils
  sed -i 's| help/Makefile||g' 'configure.ac'

  cd "doc"
  sed -i 's/#//g' "Makefile.am"
}

build() {
  cd "${srcdir}/${_pkgsrc}/${pkgbase}"
  # ./autogen.sh
  libtoolize -f
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --enable-gstreamer \
    --enable-audacious \
    --disable-cutter \
    --disable-gnome # https://aur.archlinux.org/packages/gnome-doc-utils#comment-964738
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/${pkgbase}/test"
#   ./run-tests.sh
# }

package_mp3splt-gtk() {
  arch=('x86_64')
  depends=('cairo' 'dbus-glib' 'gdk-pixbuf2' 'glib2' 'glibc' 'gstreamer>=1'
           'gtk3>=3.4.2' 'libaudclient>=3' "libmp3splt>=0.9.3.1519")

  cd "${srcdir}/${_pkgsrc}/${pkgbase}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/doc"

  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgbase}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

package_mp3splt-gtk-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/${pkgbase}/doc"
  make DESTDIR="${pkgdir}" install-data-local
}
