# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="osiris"
pkgver=2.4.3
pkgrel=1
pkgdesc="A graphical toolkit for X11-based Linux and Unix platforms forked from Qt 2.3.2"
arch=('aarch64' 'i686' 'x86_64')
url="https://libranext.com/home/osiris"
_url="https://centre.libranext.com/libranext/${pkgname}"
license=('QPL-1.0 AND GPL-2.0-only AND custom:QT-commercial')
depends=('fontconfig' 'gcc-libs' 'glibc' 'libgl' 'libjpeg' 'libpng>=1.6'
         'libx11' 'libxext' 'libxft' 'libxmu' 'zlib>=1.2.13') # 'libice' 'libmng' 'libsm' 
makedepends=('cmake' 'glu>=9' 'meson>=1.1')
provides=("lib${pkgname}"{,-mt}.so 'libqutil.so')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz"
        "${pkgname}_meson_format_security.patch"
        "${pkgname}_meson_qapplication_x11.patch"
        "${pkgname}_meson_ldconfig_profile.patch"
        "${pkgname}_meson_dependencies.patch"
        "${pkgname}_meson_install_dir.patch"
        "${pkgname}_meson_lib_soversion.patch")
b2sums=('45bea6fd06d1ffe2e8be88c6dcee80732543ad6437775cd23d1118a59b5563fc078a755b490eec3e68ee609b6c2ee7b892d7027d52f5ee6a5a53ef0cbd97b4e6'
        'ede05cb239c762fd9dbced66abea3e3623b9f2488501540729da3e75cd333127aa56bb94b011f75f808d5ea7cd4f430fdabeb042596d999cd9c9ae639f1a481f'
        '79a4f823f53d9544409af2e3081b1f5e67d6c83c1a2af834e8b073aa58e568f16baa68cb55eb2b94653ea050db6e306a52278a1b6aa6eec7007357661f48f826'
        '8540b8365388c9c16b8e440f0812f8ccee2238c540ace13e667bbe3ef547cf73f8080e8ccb320867e550ad2201d53bd9dd6dfd2ca70b5f14da37430424e04c96'
        'c2da7fc7f9ccbfbdd010b35b1e474425a1040316979257bf9b006c788a2d230614f72933c671d20a33822505ed37df18adc8e91ca4ae71bc4433acf0e1973b64'
        '653b13347a967654a43ef8608b1f6146c1404668e26448811157793365eaaf070fe0292d06b8d44c146389c3e05d1d5b8c7d006518f77c10dbc44c338a1667b7'
        'c4ef31a79f121466f91e0aff9a28da6c9a24c1736d9c813e4e60b3f039b1f47337138314d3b5acec2d64ce4833bdecdf7c1c9427e5cf1235ecd96e7fd171184b')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_format_security.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_qapplication_x11.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_ldconfig_profile.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_dependencies.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_install_dir.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_meson_lib_soversion.patch"
}

build() {
  export CXXFLAGS+=" -Wno-format-security"
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    -D gif=enabled
    -D jpeg=enabled
    -D mng=disabled # disabled by upstream (?)
    -D sm=disabled # disabled by upstream (?)
    -D xft=enabled
    -D opengl=enabled
    -D qt1compat=enabled
    -D multi-thread=enabled
    -D single-thread=enabled
    -D examples=disabled
    -D tutorial=disabled
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.GPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
