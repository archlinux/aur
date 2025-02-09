# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: cosmo0920

_name="cutter"
pkgbase="${_name}-test_framework"
pkgname=("${pkgbase}"{,-docs})
_commit_rel="f77d67bd476936f2075c586726d44a89a18c0d72" # 1.2.9
_commit="b6c4237b638b7a0ea726f5cb07ca3d6b2477eae0" # r5
pkgver="1.2.9+r5+g${_commit::7}"
pkgrel=1
pkgdesc="C/C++ unit test framework"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://${_name}.sourceforge.net/index.html"
_url="https://github.com/clear-code/${_name}"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later' 'GFDL-1.3-or-later')
makedepends=('binutils' 'cairo>=1.4', 'gcc-libs' 'gdk-pixbuf2'
             'glib2-devel>=2.12.3' 'glibc' 'gtk2>=2.12' 'gtk-doc>=1.16'
             'intltool' 'libsoup>=2.4' 'pango' 'ruby-erb' 'ruby-prime'
             'ruby-fast_gettext' 'ruby-parser' 'ruby-rdtool' 'sh' 'zlib'
             'zstd')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgname}_g_object_ref_is_g_object.patch"
        "${pkgname}_rd2entry-lib_empty_values.patch"
        "${pkgname}_makefile_license_destdir.patch"
        "${pkgname}_gstreamer_plugin_name.patch")
sha256sums=('397cab253fb1e66d8d2a74516e29696d0266da19e6d87be6e821b269e22b12af'
            'dd07526a84d9ea8911afda5c6849751657280dec6c40ca7cf993dcb09de4fe7e'
            '5a84e58c89be37a56b528e663b1eea00bb7217760271af7e1ffc1b8d205f372a'
            '416f94d80c4e1e577c7e86add059b9cd7ef29d783154eb6e264a1a7bb10c683d'
            '86318d8f4486d1bbdff0f9b90a9c866c785ecb90ddbc6760f4864d8fc2b3fcef')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_g_object_ref_is_g_object.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_rd2entry-lib_empty_values.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_makefile_license_destdir.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_gstreamer_plugin_name.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --enable-bfd \
    --enable-gtk-doc \
    --enable-gtk-doc-html \
    --disable-goffice \
    --disable-gstreamer
    # --disable-deprecated-glib-api
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   ./test/run-test.sh
# }

package_cutter-test_framework() {
  depends=('binutils' 'cairo>=1.4' 'gcc-libs' 'gdk-pixbuf2' 'glib2>=2.12.3' 'glibc'
           'gtk2>=2.12' 'libsoup>=2.4' 'pango' 'sh' 'zlib' 'zstd')
  provides=('lib'{,'cpp','soup'}"${_name}.so" 'libgdkcutter-pixbuf.so')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "README"   "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 "NEWS"     "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -vDm644 "FEATURES" "${pkgdir}/usr/share/doc/${pkgbase}/FEATURES"
  install -vDm644 "TUTORIAL" "${pkgdir}/usr/share/doc/${pkgbase}/TUTORIAL"
  install -vDm644 "USERS"    "${pkgdir}/usr/share/doc/${pkgbase}/USERS"

  install -vDm644 "README.ja"   "${pkgdir}/usr/share/doc/${pkgbase}/README.ja"
  install -vDm644 "NEWS.ja"     "${pkgdir}/usr/share/doc/${pkgbase}/NEWS.ja"
  install -vDm644 "FEATURES.ja" "${pkgdir}/usr/share/doc/${pkgbase}/FEATURES.ja"
  install -vDm644 "TUTORIAL.ja" "${pkgdir}/usr/share/doc/${pkgbase}/TUTORIAL.ja"
  install -vDm644 "USERS.ja"    "${pkgdir}/usr/share/doc/${pkgbase}/USERS.ja"

  cd "${pkgdir}/usr/share"
  rm -rf "gtk-doc"
}

package_cutter-test_framework-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/doc/reference"
  make DESTDIR="${pkgdir}" install-data

  cd "${pkgdir}/usr/share/gtk-doc/html"
  mv -f "${_name}" "${pkgbase}"
}
