# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="goffice"
pkgbase="${_name}08"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.8.17
pkgrel=1
pkgdesc="A GLib/GTK+ set of document-centric objects and charting library"
arch=('any')
url="https://git.gnome.org/browse/${_name}"
license=('GPL-2.0-or-later')
makedepends=('intltool>=0.35.0' 'pkgconf>=0.18' 'glib2-devel' 'gtk-doc>=1.11'
             'perl>=5.8.1' 'libgsf>=1.14.9' 'pango>=1.8.1' 'cairo>=1.2.0'
             'gtk2>=2.12.0' 'gdk-pixbuf2' 'pcre' 'lasem02' 'at-spi2-core')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/goffice/0.8/${_pkgsrc}.tar.xz"
        "${pkgname}_fix_go-combo-box_c.patch"
        # https://pcre.org/pcre.txt
        "${pkgname}_fix_regutf8_c.patch"
        # https://bugzilla.gnome.org/show_bug.cgi?id=788710
        "${pkgname}_fix_docs_reference_makefile.patch")
sha256sums=('165070beb67b84580afe80a8a100b674a81d553ab791acd72ac0c655f4fadb15'
            '5736fd5c775f5a12b7cbcf88866d67e7ef0ed9054d83be2fb1a268b8b3b2835c'
            '97cbdd32472cedab7007fed779f4f7e0fa6bcb1a66f5913a27db3376cb32c10e'
            'e364c8140b997ffa345954991fa0385dca615e5b340e9c56b12c8f4341eaa75f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
  find . -type f -exec sed -i 's/\* #include <\([^>]*\)>/\* #include \&lt\1\&gt/g' {} +

  mv -f "configure.in" "configure.ac"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --sbindir='/usr/bin' \
    --disable-static \
    --enable-introspection \
    --with-lasem \
    --enable-gtk-doc
    
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package_goffice08() {
  arch=('x86_64')
  depends=('glibc' 'glib2>=2.8.0' 'libgsf>=1.14.9' 'libxml2>=2.4.12'
           'pango>=1.8.1' 'cairo>=1.2.0' 'gtk2>=2.12.0' 'gdk-pixbuf2' 'pcre'
           'lasem02' 'at-spi2-core')
  optdepends=("${pkgbase}-docs: HTML documentation")
  provides=("${_name}=${pkgver}" "${_name}-0.8=${pkgver}")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/gtk-doc"

  libtool --finish "${pkgdir}/usr/lib"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/plot_pie"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/plot_barcol"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/plot_xy"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/plot_radar"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/plot_surface"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/plot_distrib"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/reg_linear"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/reg_logfit"
  libtool --finish "${pkgdir}/usr/lib/goffice/0.8.17/plugins/smoothing"
}

package_goffice08-docs() {
  pkgdesc="HTML documentation for ${pkgbase}"

  cd "${srcdir}/${_pkgsrc}/docs"
  make DESTDIR="${pkgdir}" install
}
