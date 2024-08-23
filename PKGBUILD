# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name="gstreamer"
pkgbase="${_name}113"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=1.13.91
_commit="bc431c2af309ed78881da7e07011be7f3152db0a" # tags/1.13.91^0
_common_commit="f0c2dc9aadfa05bb5274c40da750104ecbb88cba"
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework core library"
arch=('any')
url="https://gstreamer.freedesktop.org"
license=('LGPL-2.0-or-later')
makedepends=('gtk-doc>=1.12' 'glib2-devel' 'gobject-introspection>=1.31.1'
             'libunwind')
install="${_name}.install"
_pkgsrc="${_name}-${_commit}"
_common_src="common-${_common_commit}"
source=("${_pkgsrc}.tar.gz::https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${_common_src}.tar.gz::https://gitlab.freedesktop.org/gstreamer/common/-/archive/${_common_commit}/${_common_src}.tar.gz"
        "${_name}.install"
        # https://bugs.gentoo.org/705974
        "${pkgbase}_fix_make43.patch")
sha256sums=('93b7dabf9dba0c7ff39e65142e7646d701d25bf5340d4e6e8b2103c25870180d'
            '58aaa46f3f1c29aa6f363a102fb6dff20beb240e6536256cdd161dce277ee345'
            'e092452caee7f04f6fde34c3e84552b5322b31cd86b6dbe98d7e30a8e2756f26'
            '6b76b79280040e42f8d64622983f8580fb0d94e44b4aa74d4c7ea27d60003f83')

prepare() {
  cd "${srcdir}"
  cp -r "${_common_src}"/* "${_pkgsrc}/common"

  cd "${_pkgsrc}"
  for _patch in "${srcdir}/${pkgbase}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  find . -type f -exec sed -i 's/target = g_object_ref (element);/target = G_OBJECT(g_object_ref(element));/' {} +
  find . -type f -exec sed -i 's/obj = g_object_ref (object);/obj = G_OBJECT(g_object_ref(object));/' {} +
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
    --enable-gtk-doc \
    --disable-static
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
  optdepends=('bash-completion: for shell autocompletion'
              "${pkgbase}-docs: HTML documentation")
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
