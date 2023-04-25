# Maintainer: dreieck

_pkgname="libxfce4panel-1"
pkgname="${_pkgname}-shim"
pkgver=4.18.3
pkgrel=1
pkgdesc="Dummy/ meta package that symlinks the 'libxfce4panel-2' files from the package 'xfce4-panel' to 'libxfce4panel-1', as required by some xfce plugins."
arch=("any")
license=('custom: public domain')
depends=("xfce4-panel>=4.18")
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  'af68dd29515606a94237214e4c33b0e3f4f2408ed92df3674a043bf2fa2c0078'
)

pkgver() {
  pacman -Q xfce4-panel | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  local _lib
  local _2lib
  local _1lib

  install -d -v -m755 "${pkgdir}/usr/include/xfce4"
  install -d -v -m755 "${pkgdir}/usr/lib"
  install -d -v -m755 "${pkgdir}/usr/lib/pkgconfig"
  install -d -v -m755 "${pkgdir}/usr/share/gir-1.0"
  install -d -v -m755 "${pkgdir}/usr/share/gtk-doc/html"
  install -d -v -m755 "${pkgdir}/usr/share/vala/vapi"

  ln -svr "${pkgdir}/usr/include/xfce4/libxfce4panel-2"          "${pkgdir}/usr/include/xfce4/libxfce4panel-1"
  for _lib in /usr/lib/libxfce4panel-2*; do
    _2lib="$(basename ${_lib})"
    _1lib="$(sed -E -e 's|libxfce4panel-2|libxfce4panel-1|' <<<"${_2lib}")"
    ln -svr "${pkgdir}/usr/lib/${_2lib}" "${pkgdir}/usr/lib/${_1lib}"
  done
  ln -svr "${pkgdir}/usr/lib/pkgconfig/libxfce4panel-2.pc"       "${pkgdir}/usr/lib/pkgconfig/libxfce4panel-1.pc"
  ln -svr "${pkgdir}/usr/share/gir-1.0/Libxfce4panel-2.0.gir"    "${pkgdir}/usr/share/gir-1.0/Libxfce4panel-1.0.gir"
  ln -svr "${pkgdir}/usr/share/gtk-doc/html/libxfce4panel-2.0"   "${pkgdir}/usr/share/gtk-doc/html/libxfce4panel-1.0"
  for _lib in /usr/share/vala/vapi/libxfce4panel-2*; do
    _2lib="$(basename ${_lib})"
    _1lib="$(sed -E -e 's|libxfce4panel-2|libxfce4panel-1|' <<<"${_2lib}")"
    ln -svr "${pkgdir}/usr/share/vala/vapi/${_2lib}"              "${pkgdir}/usr/share/vala/vapi/${_1lib}"
  done

  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt"     "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}
