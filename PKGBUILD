# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor:	farseerfc	<farseerfc@archlinuxcn.org>
# Contributor:	refujee		<gmail.com: refujee>
# Contributor:	sausageandeggs	<archlinux.us: sausageandeggs>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>

# Select version of Lua. Possible values are luajit, lua51, lua52 and an empty
# string to disable Lua support. luajit is used in the official builds.
_lua=luajit

pkgname=powder-toy
pkgver=95.0
pkgrel=2
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!"
arch=(x86_64 i686)
depends=('glibc' 'libx11' 'sdl2' $_lua 'fftw' 'bzip2' 'zlib' 'hicolor-icon-theme')
makedepends=('scons' 'libicns')
url="https://powdertoy.co.uk/"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ThePowderToy/The-Powder-Toy/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}-open.desktop"
        "${pkgname}-ptsave.desktop")
sha256sums=('f60c3dc93e4ceddeda92b768e75a2d218f8df3da4a569b7d7cb57fff5515e15b'
            '4b75d58bfff9278bceb27fa14738e9a1abef6fe60680bb9f5eb0592f3d69a02a'
            'b5d181c3141715b7dced8813cae6d07d2adc03bca2a7efe527592740de2d45e2'
            '265f530be7597fcc7bbaf2690fd517fe4f8f18372c808a90ddef49a604c8d455'
            '398f6d068dd37e12989f4132ea5966886b14036bac07a589991b283d242b4ca5'
            'fcbf035d286d805dced55f147d649aa0bc74d3be873d5430de92d175d9f59431')

prepare() {
  cd "The-Powder-Toy-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

build() {
  cd "The-Powder-Toy-${pkgver}"

  # extract document icons from macOS .icns files
  ( cd resources && icns2png -x document.icns )

  local extra_flags=()

  case "$CARCH" in
    x86_64) extra_flags+=(--64bit) ;;
      i686) extra_flags+=(--32bit) ;;
  esac

  if   grep -q -i pni  /proc/cpuinfo; then
    extra_flags+=(--sse3)
  elif grep -q -i sse2 /proc/cpuinfo; then
    extra_flags+=(--sse2)
  elif grep -q -i sse  /proc/cpuinfo; then
    extra_flags+=(--sse)
  else
    extra_flags+=(--no-sse)
  fi

  case "$_lua" in
    luajit) extra_flags+=(--luajit) ;;
     lua51)                         ;; # lua51 support is enabled by default
     lua52) extra_flags+=(--lua52)  ;;
        "") extra_flags+=(--nolua)  ;;
  esac

  msg2 "building ${pkgname} with the following extra flags: ${extra_flags[*]}"
  scons --lin --release --output="${pkgname}" ${MAKEFLAGS} "${extra_flags[@]}"
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-open.desktop" "${pkgdir}/usr/share/applications/${pkgname}-open.desktop"
  install -Dm644 "${pkgname}-ptsave.desktop" "${pkgdir}/usr/share/applications/${pkgname}-ptsave.desktop"

  cd "The-Powder-Toy-${pkgver}"

  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -Dm644 "resources/powdertoy-save.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-save.xml"
  install -Dm644 "resources/powder.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"

  local icon_size
  for icon_size in 16 24 32 48 128 256; do
    install -Dm644 "resources/icon/powder-${icon_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${pkgname}.png"
  done
  for icon_size in 16 32 128 256 512; do
    install -Dm644 "resources/document_${icon_size}x${icon_size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/mimetypes/application-vnd.${pkgname}.save.png"
  done
}
