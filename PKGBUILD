# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname="d-feet"
_commit_rel="53b495c93e2bd00811ba0b7f6583b8f256994e9d" # 0.3.16
_commit="f9bd21197c0dcdea6a25fb4fcfd303e56ead714b" # r16
pkgver="0.3.16+r16+g${_commit::7}"
pkgrel=1
epoch=1
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://gitlab.gnome.org/Archive/d-feet"
license=('GPL-2.0-or-later')
depends=('dconf' 'glib2' 'gtk3>=3.9.4' 'hicolor-icon-theme' 'libwnck3' 'python'
         'python-gobject') # 'python-configparser'
makedepends=('gobject-introspection>=0.9.6' 'meson>=0.50' 'python-pycodestyle'
             'yelp-tools')
# checkdepends=('xorg-server-xvfb')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgname}_meson_drop_unused_argument.patch"
        "${pkgname}_python3_syntax.patch"
        "${pkgname}_meson_specify_project_language.patch")
sha512sums=('2517966922d9392401273dff6ed4465b050c458fa66b9b727b2663c44ed40fce9444d8126595208a755839f0350fdbdd32a418a5ee702aace9c7679a89c8ddb8'
            'e7b90929a984e8d1b1340c27861cd5a50dad3d88cda4828e7ef2f7990e80447d7a793a060bec426cc9255db4d1a50a392ad310096e467ed9d0857cebf2dcbdc2'
            '082938045dda067c1fca4d3954fffbaf6d3fe39e5a69ce4e6d629aa62c148009e7f228f01b76863d2b78d6fac663a93eb06988b1239901bfb41b2f65d62f249e'
            'f07172bf7020ebd27155db65ac459441d97e73a1acc934c453b02d3f4b651790ad541805173d911a613eac3427420e587ea4326afaaeac9387a40fc658120d18')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_drop_unused_argument.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_python3_syntax.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_specify_project_language.patch"
}

build() {
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    -D tests=false
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   xvfb-run meson test -C "${_pkgsrc}/build" --print-errorlogs
# }

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  # python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
  # python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"
  DESTDIR="${pkgdir}" python meson_post_install.py
}
