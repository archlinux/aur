# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor:	farseerfc	<farseerfc@archlinuxcn.org>
# Contributor:	refujee		<gmail.com: refujee>
# Contributor:	sausageandeggs	<archlinux.us: sausageandeggs>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>

# Select version of Lua. Possible values are luajit, lua51, lua52 and an empty
# string to disable Lua support. luajit is used in the official builds.
_lua=luajit
_branch=master
#_branch=stable

_ogname=powder-toy
pkgname=powder-toy-git
pkgver=snapshot.206.1.g55c14fc1
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!"
arch=(x86_64 i686)
provides=('powder-toy')
conflicts=('powder-toy')
depends=('glibc' 'libx11' 'sdl2' $_lua 'fftw' 'bzip2' 'zlib' 'hicolor-icon-theme')
makedepends=('meson' 'libicns')
url="http://powdertoy.co.uk/"
license=('GPL3')
source=("${_ogname}::git+https://github.com/ThePowderToy/The-Powder-Toy.git#branch=$_branch"
        "${_ogname}.sh"
        "${_ogname}.patch"
        "${_ogname}.desktop"
        "${_ogname}-open.desktop"
        "${_ogname}-ptsave.desktop")
sha256sums=('SKIP'
            'b5d181c3141715b7dced8813cae6d07d2adc03bca2a7efe527592740de2d45e2'
            '2b3a51ed0f41be065da71c6f9b48d4b8e75111dd8ea6028b5ad069817c31b7bf'
            '265f530be7597fcc7bbaf2690fd517fe4f8f18372c808a90ddef49a604c8d455'
            '398f6d068dd37e12989f4132ea5966886b14036bac07a589991b283d242b4ca5'
            'fcbf035d286d805dced55f147d649aa0bc74d3be873d5430de92d175d9f59431')

pkgver() {
  cd ${_ogname}
  git describe --tags | sed 's/^v//;s/[-+]/./g'
}

prepare() {
  cd ${_ogname}
  patch --forward --strip=1 --input="${srcdir}/${_ogname}.patch"
}

build() {
  cd ${_ogname}

  # extract document icons from macOS .icns files
  ( cd resources && icns2png -x document.icns )

  local extra_flags=()

  if   grep -q -i pni  /proc/cpuinfo; then
    extra_flags+=("-D x86_sse=sse3")
  elif grep -q -i sse2 /proc/cpuinfo; then
    extra_flags+=("-D x86_sse=sse2")
  elif grep -q -i sse  /proc/cpuinfo; then
    extra_flags+=("-D x86_sse=sse")
  else
    extra_flags+=("-D x86_sse=none")
  fi

  case "$_lua" in
    luajit) extra_flags+=("-D lua=luajit") ;;
     lua51) extra_flags+=("-D lua=lua5.1") ;;
     lua52) extra_flags+=("-D lua=lua5.2") ;;
  esac

  msg2 "building ${_ogname} with the following extra flags: ${extra_flags[*]}"
  meson build_debug -D "ignore-updates=true" "${extra_flags[@]}"
  cd build_debug
  ninja
}

package() {
  install -Dm755 "${_ogname}.sh" "${pkgdir}/usr/bin/${_ogname}"
  install -Dm644 "${_ogname}.desktop" "${pkgdir}/usr/share/applications/${_ogname}.desktop"
  install -Dm644 "${_ogname}-open.desktop" "${pkgdir}/usr/share/applications/${_ogname}-open.desktop"
  install -Dm644 "${_ogname}-ptsave.desktop" "${pkgdir}/usr/share/applications/${_ogname}-ptsave.desktop"

  cd ${_ogname}

  install -Dm755 "build_debug/powder" "${pkgdir}/usr/lib/${_ogname}/${_ogname}"
  install -Dm644 "resources/powdertoy-save.xml" "${pkgdir}/usr/share/mime/packages/${_ogname}-save.xml"
  install -Dm644 "resources/powder.appdata.xml" "${pkgdir}/usr/share/metainfo/${_ogname}.appdata.xml"

  local icon_size
  for icon_size in 16 24 32 48 128 256; do
    install -Dm644 "resources/icon/powder-${icon_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_ogname}.png"
  done
  for icon_size in 16 32 128 256 512; do
    install -Dm644 "resources/document_${icon_size}x${icon_size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/mimetypes/application-vnd.${_ogname}.save.png"
  done
}
