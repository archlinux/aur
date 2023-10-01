# Maintainer:
# Contributor: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor: farseerfc <farseerfc@archlinuxcn.org>
# Contributor: refujee <gmail.com: refujee>
# Contributor: sausageandeggs <archlinux.us: sausageandeggs>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Select version of Lua. Possible values are luajit, lua51, lua52 and an empty
# string to disable Lua support. luajit is used in the official builds.
_lua=luajit
_branch=master

_appexe="powder-toy"
_appid="uk.co.powdertoy.tpt"
_appvendor="powdertoy"

_pkgname="powder-toy"
pkgname="$_pkgname-git"
pkgver=97.0.352.r218.g5584acd18
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!"
arch=(x86_64 i686)
url="http://powdertoy.co.uk/"
license=('GPL3')

depends=(
  "$_lua"

  bzip2
  curl
  fftw
  glibc
  hicolor-icon-theme
  jsoncpp
  libpng
  sdl2
)
makedepends=(
  git
  meson
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  url="https://github.com/ThePowderToy/The-Powder-Toy"
  provides=("$_pkgname")
  conflicts=("$_pkgname")
fi

source=(
  "$_pkgname"::"git+https://github.com/ThePowderToy/The-Powder-Toy.git#branch=$_branch"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_pkgname"
  git describe --tags --match "v[0-9]*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  local opt_lua opt_sse

  case "$_lua" in
    luajit) opt_lua=luajit ;;
     lua51) opt_lua=lua5.1 ;;
     lua52) opt_lua=lua5.2 ;;
         *) opt_lua=none   ;;
  esac

  if grep -q -i pni /proc/cpuinfo; then
    opt_sse=sse3
  elif grep -q -i sse2 /proc/cpuinfo; then
    opt_sse=sse2
  elif grep -q -i sse /proc/cpuinfo; then
    opt_sse=sse
  else
    opt_sse=none
  fi

  local extra_flags=(
    -Dignore_updates=true
    -Dapp_exe="${_appexe}"
    -Dapp_id="${_appid}"
    -Dapp_vendor="${_appvendor}"
    -Dlua="${opt_lua}"
    -Dx86_sse="${opt_sse}"
  )

  echo "building ${pkgname} with the following extra flags: ${extra_flags[*]}"
  arch-meson --buildtype=release build "${extra_flags[@]}"
  meson compile -C build
}

package() {
  cd "$_pkgname"

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
