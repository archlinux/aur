# Maintainer:
# Contributor: Radoslav Georgiev <rgeorgiev583@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

_pkgname="xbindkeys_config"
pkgname="$_pkgname-gtk2"
pkgver=0.1.4
pkgrel=2
pkgdesc="Easy to use GUI to configure Xbindkeys"
url="https://github.com/rgeorgiev583/xbindkeys_config"
license=('GPL-2.0-only')
arch=('i686' 'x86_64')

depends=(
  'gtk2'
  'xbindkeys'
)
makedepends=(
  'meson'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('3d88c4fb82a6afe6da851ab505b8a2eabd32f9bb8c49522583339fe1c4694bfa')

prepare() {
  local _f _sources
  for _f in "$_pkgsrc"/*.c; do
    _sources+="'${_f##*/}', "
  done

  install -Dm644 /dev/stdin "$_pkgsrc/meson.build" << END
project('$_pkgname', 'c')

gtk2_dep = dependency('gtk+-2.0')

executable(
  meson.project_name(),
  sources: [ ${_sources} ],
  dependencies: [gtk2_dep],
  install: true,
)
END

  install -Dm644 /dev/stdin "$_pkgsrc/version.h" << END
#define XBINDKEYS_CONFIG_VERSION "$pkgver"
#define XBINDKEYS_PATCH "xbindkeys" /* for debugging */
END
}

build() (
  local _cflags=(
    ${CFLAGS}
    -Wno-error=implicit-function-declaration
    -Wno-error=incompatible-pointer-types
    -Wno-error=int-conversion
  )
  _cflags=(${_cflags[@]//*format-security*/})

  export CFLAGS="${_cflags[@]}"

  arch-meson "$_pkgsrc" build
  meson compile -C build
)

package() {
  meson install -C build --destdir "$pkgdir"
}
