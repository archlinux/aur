# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="cutter"
pkgbase="${_name}-test"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=1.2.8
pkgrel=1
pkgdesc="A C/C++ unit test framework"
arch=('any')
url="https://${_name}.sourceforge.net/index.html"
_url="https://github.com/clear-code/${_name}"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later' 'GFDL-1.3-or-later')
makedepends=('intltool>=0.35.0' 'pkgconf>=0.16' 'glib2-devel' 'goffice08'
             'gstreamer113' 'gtk-doc>=1.16' 'perl>=5.8.1' 'glib2' 'gdk-pixbuf2'
             'libsoup>=2.4' 'cairo>=1.4' 'pango' 'gtk2>=2.12.0' 'at-spi2-core'
             'binutils' 'ruby' 'ruby-rdtool' 'ruby-racc' 'ruby-erb'
             'ruby-fast_gettext' 'ruby-parser')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_fix_g_object_ref.patch"
        "${pkgname}_fix_rd2entry-lib_rb.patch"
        "${pkgname}_fix_license_makefile_am.patch"
        "${pkgname}_fix_gst-cutter-test_c.patch")
sha256sums=('af29d3d61076fc03313fc1b8da76aa8b884edf683e684898be5d33ba8440df14'
            'dd07526a84d9ea8911afda5c6849751657280dec6c40ca7cf993dcb09de4fe7e'
            '5a84e58c89be37a56b528e663b1eea00bb7217760271af7e1ffc1b8d205f372a'
            'd6aba0ff3b2d8ea100996798c4499e562dc8114569232df3b8b030d8843ef78d'
            '86318d8f4486d1bbdff0f9b90a9c866c785ecb90ddbc6760f4864d8fc2b3fcef')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  autoupdate
  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --sbindir='/usr/bin' \
    --disable-deprecated-glib-api \
    --enable-bfd \
    --enable-gtk-doc \
    --enable-gtk-doc-html
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   ./test/run-test.sh
# }

package_cutter-test() {
  arch=('x86_64')
  depends=('glibc' 'gcc-libs' 'sh' 'at-spi2-core' 'freetype2' 'zstd' 'zlib'
           'binutils' 'harfbuzz' 'fontconfig' 'glib2' 'goffice08' 
           'gstreamer113' 'gdk-pixbuf2' 'libsoup>=2.4' 'cairo>=1.4'
           'cairo>=1.4' 'pango' 'gtk2>=2.12.0')
  optdepends=("${pkgbase}-docs: HTML documentation")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/gtk-doc"

  libtool --finish "${pkgdir}/usr/lib"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/ui"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/report"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/stream"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/loader-customizer"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/factory/ui"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/factory/report"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/factory/stream"
  libtool --finish "${pkgdir}/usr/lib/${_name}/module/factory/loader-customizer"

  install -Dm644 "README"      "${pkgdir}/usr/share/doc/${_name}/README"
  install -Dm644 "NEWS"        "${pkgdir}/usr/share/doc/${_name}/NEWS"
  install -Dm644 "FEATURES"    "${pkgdir}/usr/share/doc/${_name}/FEATURES"
  install -Dm644 "TUTORIAL"    "${pkgdir}/usr/share/doc/${_name}/TUTORIAL"
  install -Dm644 "USERS"       "${pkgdir}/usr/share/doc/${_name}/USERS"

  # install -Dm644 "README.ja"   "${pkgdir}/usr/share/doc/${_name}/README.ja"
  # install -Dm644 "NEWS.ja"     "${pkgdir}/usr/share/doc/${_name}/NEWS.ja"
  # install -Dm644 "FEATURES.ja" "${pkgdir}/usr/share/doc/${_name}/FEATURES.ja"
  # install -Dm644 "TUTORIAL.ja" "${pkgdir}/usr/share/doc/${_name}/TUTORIAL.ja"
  # install -Dm644 "USERS.ja"    "${pkgdir}/usr/share/doc/${_name}/USERS.ja"
}

package_cutter-test-docs() {
  pkgdesc="HTML documentation for ${pkgbase}"

  cd "${srcdir}/${_pkgsrc}/doc/reference"
  make DESTDIR="${pkgdir}" install-data
}
