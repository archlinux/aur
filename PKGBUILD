# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name="gstreamer"
pkgbase="${_name}113"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=1.13.91
_common_commit="f0c2dc9aadfa05bb5274c40da750104ecbb88cba"
pkgrel=2
pkgdesc="GStreamer open-source multimedia framework core library"
arch=('x86_64')
url="https://gstreamer.freedesktop.org"
license=('LGPL-2.0-or-later')
makedepends=('gtk-doc>=1.12' 'glib2-devel' 'gobject-introspection>=1.31.1'
             'libunwind')
install="${_name}.install"
_pkgsrc="${_name}-${pkgver}"
_common_src="common-${_common_commit}"
source=("${_pkgsrc}.tar.gz::https://gitlab.freedesktop.org/gstreamer/${_name}/-/archive/${pkgver}/${_pkgsrc}.tar.gz"
        "${_common_src}.tar.gz::https://gitlab.freedesktop.org/gstreamer/common/-/archive/${_common_commit}/${_common_src}.tar.gz"
        "${_name}.install"
        "${pkgbase}_fix_g_object.patch"
        # https://bugs.gentoo.org/705974
        "${pkgbase}_fix_make43.patch")
sha256sums=('1fe669d99225cfad8ff529e4d362eddd310c3ba87bc914f001e365b9709f6081'
            '58aaa46f3f1c29aa6f363a102fb6dff20beb240e6536256cdd161dce277ee345'
            'e092452caee7f04f6fde34c3e84552b5322b31cd86b6dbe98d7e30a8e2756f26'
            '38dbb3fffc6ef809df43dd13bc36bbe0ab25d294f75bf9b2bcb068b89434d179'
            '6b76b79280040e42f8d64622983f8580fb0d94e44b4aa74d4c7ea27d60003f83')

prepare() {
  cd "${srcdir}"
  cp -r "${_common_src}"/* "${_pkgsrc}/common"

  cd "${_pkgsrc}"
  for _patch in "${srcdir}/${pkgbase}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib' \
    --with-package-name="GStreamer (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org" \
    --disable-static \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package_gstreamer113() {
  arch=('x86_64')
  depends=('glibc' 'gcc-libs' 'glib2' 'libcap' 'libelf' 'libunwind')
  optdepends=("${pkgbase}-docs: HTML documentation")
  provides=("${_name}=${pkgver}")
  conflicts=("${_name}")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/gtk-doc"

  libtool --finish "${pkgdir}/usr/lib"
  libtool --finish "${pkgdir}/usr/lib/gstreamer-1.0"
}

package_gstreamer113-docs() {
  pkgdesc="HTML documentation for ${pkgbase}"

  cd "${srcdir}/${_pkgsrc}/docs"
  make DESTDIR="${pkgdir}" install
}
