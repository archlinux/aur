# Maintainer:
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

_pkgname="tricks"
pkgname="$_pkgname"
pkgver=1.0.0
pkgrel=1
pkgdesc="The social network for programmers!"
#url="https://tricks.aseman.io/"
url="https://github.com/Aseman-Land/Tricks"
license=('GPL3')
arch=('x86_64')

depends=(
  'qt-aseman'
  'syntax-highlighting5'
  'qt5-base'
  'qt5-graphicaleffects'
  'qt5-quickcontrols2'
)
makedepends=(
  'gcc'
  'git'
  'qt5-svg'
)

options=('!emptydirs' '!strip')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

_source_tricks() {
  source+=(
    'larpon.qtfirebase'::'git+https://github.com/Larpon/QtFirebase.git'
    'ftylitak.qzxing'::'git+https://github.com/ftylitak/qzxing.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_tricks() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['larpon.qtfirebase']='cpp/thirdparty/qtfirebase'
      ['ftylitak.qzxing']='cpp/thirdparty/qzxing'
    )
    _submodule_update
  )
}

_submodule_update() {
  local key;
  for key in ${!_submodules[@]} ; do
    git submodule init "${_submodules[${key}]}"
    git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
    git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
  done
}

_source_tricks

prepare() {
  _prepare_tricks
}

build() {
  mkdir -p build && cd build

  local _qmake_options=(
    -r "${srcdir:?}/$_pkgsrc"
    APP_SECRET_ID="tapp_eb7536ef1cdc592f6b503addeaddd8e6c94cfb110f0e08a15b0bc97cef0beb1d"
    CONFIG+="qtquickcompiler"
  )

  qmake "${_qmake_options[@]}"  
  make
}

package() {
  # desktop file
  install -Dm644 \
    "${pkgsrc:?}/$_pkgsrc/configurations/default/linux/share/Tricks.desktop" \
    -t "${pkgdir:?}/usr/share/applications/"

  # icons
  install -dm755 "${pkgdir:?}/usr/share/icons/hicolor/"
  cp -r "${pkgsrc:?}/$_pkgsrc/configurations/default/linux/share/hicolor"/* "${pkgdir:?}/usr/share/icons/hicolor/"

  # executable
  install -Dm755 "${pkgsrc:?}/build/tricks" -t "${pkgdir:?}/usr/bin/"

  # license
  install -Dm644 "${pkgsrc:?}/$_pkgsrc/LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
