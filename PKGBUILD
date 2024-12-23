# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
# Based on <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=powder-toy&id=6455baf7ea519532a40654cf77c948430d1581a4>
# and <https://aur.archlinux.org/cgit/aur.git/commit/PKGBUILD?h=powder-toy-git&id=65c5f88eb2df75df77c4da139859232d7d94f2c0>

# Select version of Lua. Possible values are luajit, lua51, lua52 and an empty
# string to disable Lua support. luajit is used in the official builds.
_lua=luajit

_pkgname=powder-toy
_appexe="${_pkgname}"
pkgname="${_pkgname}-beta"
_appid=uk.co.powdertoy.tpt
_appvendor=powdertoy
pkgver=99.0.376
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat! - Beta branch"
arch=(x86_64 i686)
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc' 'libx11' 'sdl2' "$_lua" 'fftw' 'zlib' 'libpng' 'curl' 'jsoncpp' 'hicolor-icon-theme')
makedepends=('meson' 'ninja')
url="https://powdertoy.co.uk/"
license=('GPL3')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/The-Powder-Toy/The-Powder-Toy/archive/refs/tags/v${pkgver}b.tar.gz")
sha256sums=('c7d8ec36f5319e09929e78ee0c359aa3c84007439ea920c26c17b23e3a74496a')

build() {
  cd "The-Powder-Toy-${pkgver}b"

  local opt_lua opt_sse

  case "$_lua" in
    luajit) opt_lua=luajit ;;
     lua51) opt_lua=lua5.1 ;;
     lua52) opt_lua=lua5.2 ;;
         *) opt_lua=none   ;;
  esac

  if   grep -q -i pni  /proc/cpuinfo; then
    opt_sse=sse3
  elif grep -q -i sse2 /proc/cpuinfo; then
    opt_sse=sse2
  elif grep -q -i sse  /proc/cpuinfo; then
    opt_sse=sse
  else
    opt_sse=none
  fi

  local extra_flags=(
    -Dignore_updates=true
    -Dcan_install=no
    -Dapp_exe="${_appexe}"
    -Dapp_id="${_appid}"
    -Dapp_vendor="${_appvendor}"
    -Dlua="${opt_lua}"
    -Dx86_sse="${opt_sse}"
  )

  msg2 "building ${_pkgname} with the following extra flags: ${extra_flags[*]}"
  arch-meson --buildtype=release build "${extra_flags[@]}"
  meson compile -C build
}

check() {
  cd "The-Powder-Toy-${pkgver}b"
  meson test -C build
}

package() {
  cd "The-Powder-Toy-${pkgver}b"

  install -Dm755 "build/${_appexe}" "${pkgdir}/usr/bin/${_appexe}"
  install -Dm644 "build/resources/powder.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm644 "build/resources/appdata.xml" "${pkgdir}/usr/share/metainfo/${_appid}.appdata.xml"
  install -Dm644 "resources/save.xml" "${pkgdir}/usr/share/mime/packages/${_appvendor}-save.xml"
  install -Dm644 "resources/powder.man" "${pkgdir}/usr/share/man/man6/${_appexe}.6"

  local theme_dir="${pkgdir}/usr/share/icons/hicolor" mimetype="application-vnd.powdertoy.save"
  install -Dm644 "resources/icon_exe.svg" "${theme_dir}/scalable/apps/${_appvendor}-${_appexe}.svg"
  install -Dm644 "resources/icon_cps.svg" "${theme_dir}/scalable/mimetypes/${mimetype}.svg"
  install -Dm644 "resources/generated_icons/icon_exe.png" "${theme_dir}/256x256/apps/${_appvendor}-${_appexe}.png"
  install -Dm644 "resources/generated_icons/icon_cps.png" "${theme_dir}/256x256/mimetypes/${mimetype}.png"
  local icon_size; for icon_size in 16 32 48; do
    install -Dm644 "resources/generated_icons/icon_exe_${icon_size}.png" \
      "${theme_dir}/${icon_size}x${icon_size}/apps/${_appvendor}-${_appexe}.png"
    install -Dm644 "resources/generated_icons/icon_cps_${icon_size}.png" \
      "${theme_dir}/${icon_size}x${icon_size}/mimetypes/${mimetype}.png"
  done
}
