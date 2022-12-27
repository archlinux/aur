# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
# Based on <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=powder-toy&id=6455baf7ea519532a40654cf77c948430d1581a4>
# and <https://aur.archlinux.org/cgit/aur.git/commit/PKGBUILD?h=powder-toy-git&id=65c5f88eb2df75df77c4da139859232d7d94f2c0>

# Select version of Lua. Possible values are luajit, lua51, lua52 and an empty
# string to disable Lua support. luajit is used in the official builds.
_lua=luajit

_pkgname=powder-toy
pkgname="${_pkgname}-beta"
pkgver=97.0.351
pkgrel=3
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat! - Beta branch"
arch=(x86_64 i686)
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc' 'libx11' 'sdl2' "$_lua" 'fftw' 'zlib' 'curl' 'hicolor-icon-theme')
makedepends=('meson' 'ninja' 'libicns')
url="https://powdertoy.co.uk/"
license=('GPL3')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/The-Powder-Toy/The-Powder-Toy/archive/refs/tags/v${pkgver}b.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}-open.desktop"
        "${pkgname}-ptsave.desktop")
sha256sums=('da0713ddeb4d71ca0c2562c404155db7f4d0b735796a4bae08b5f1dce62ad7d4'
            'b5d181c3141715b7dced8813cae6d07d2adc03bca2a7efe527592740de2d45e2'
            '265f530be7597fcc7bbaf2690fd517fe4f8f18372c808a90ddef49a604c8d455'
            '398f6d068dd37e12989f4132ea5966886b14036bac07a589991b283d242b4ca5'
            'fcbf035d286d805dced55f147d649aa0bc74d3be873d5430de92d175d9f59431')

build() {
  cd "The-Powder-Toy-${pkgver}b"

  # extract document icons from macOS .icns files
  pushd >/dev/null resources
  icns2png -x document.icns
  popd >/dev/null

  local extra_flags=()

  extra_flags+=(-Dignore_updates=true)
  extra_flags+=(-Dinstall_check=false)
  extra_flags+=(-Dbeta=true)

  if   grep -q -i pni  /proc/cpuinfo; then
    extra_flags+=(-Dx86_sse=sse3)
  elif grep -q -i sse2 /proc/cpuinfo; then
    extra_flags+=(-Dx86_sse=sse2)
  elif grep -q -i sse  /proc/cpuinfo; then
    extra_flags+=(-Dx86_sse=sse)
  else
    extra_flags+=(-Dx86_sse=none)
  fi

  case "$_lua" in
    luajit) extra_flags+=(-Dlua=luajit) ;;
     lua51) extra_flags+=(-Dlua=lua5.1) ;;
     lua52) extra_flags+=(-Dlua=lua5.2) ;;
  esac

  msg2 "building ${_pkgname} with the following extra flags: ${extra_flags[*]}"
  arch-meson --buildtype=release build "${extra_flags[@]}"
  meson compile -C build
}

check() {
  cd "The-Powder-Toy-${pkgver}b"
  meson test -C build
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgname}-open.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-open.desktop"
  install -Dm644 "${pkgname}-ptsave.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-ptsave.desktop"

  cd "The-Powder-Toy-${pkgver}b"

  install -Dm755 "build/powder" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -Dm644 "resources/powdertoy-save.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}-save.xml"
  install -Dm644 "resources/powder.appdata.xml" "${pkgdir}/usr/share/metainfo/${_pkgname}.appdata.xml"
  install -Dm644 "resources/powder.man" "${pkgdir}/usr/share/man/man6/${_pkgname}.6"

  local icon_size
  for icon_size in 16 24 32 48 128 256; do
    install -Dm644 "resources/icon/powder-${icon_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_pkgname}.png"
  done
  for icon_size in 16 32 128 256 512; do
    install -Dm644 "resources/document_${icon_size}x${icon_size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/mimetypes/application-vnd.${_pkgname}.save.png"
  done
}
