# Maintainer:
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>
# Contributor: Martin Weinelt <hexa at darmstadt dot ccc dot de>

_pkgname="quaternion"
pkgname="$_pkgname"
pkgver=0.0.95.1
pkgrel=2
pkgdesc='Qt-based IM client for the Matrix protocol'
#url="https://matrix.org/docs/projects/client/quaternion.html"
url="https://github.com/quotient-im/Quaternion"
arch=('aarch64' 'i686' 'x86_64')
license=(GPL3)

depends=(
  hicolor-icon-theme
  qt5-multimedia
  qt5-quickcontrols2
  qt5-tools
  qtkeychain-qt5
)
makedepends=(
  cmake
  git
)
optdepends=(
  'qt5-graphicaleffects: Display the conversation history at startup'
  'qtkeychain: Store access tokens in a keyring'
)


if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source=(
    "$_pkgsrc"::"git+https://github.com/quotient-im/Quaternion#tag=$pkgver"
    "libquotient"::'git+https://github.com/quotient-im/libQuotient'
  )
  sha256sums=(
    'SKIP'
    'SKIP'
  )

  prepare() {
    ( # submodules - quoternion
      cd "$_pkgsrc"
      git submodule init "lib"
      git submodule set-url "lib" "${srcdir}/libquotient"
      git -c protocol.file.allow=always submodule update "lib"
    )
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=(
    "$_pkgsrc"::"git+https://github.com/quotient-im/Quaternion"
    "libquotient"::'git+https://github.com/quotient-im/libQuotient'

    # submodules - libquotient
    'gtad'::'git+https://github.com/quotient-im/gtad.git'
    'doxygen-awesome-css'::'git+https://github.com/jothepro/doxygen-awesome-css.git'
  )
  sha256sums=(
    'SKIP'
    'SKIP'

    'SKIP'
    'SKIP'
  )

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude '[a-z]*' --exclude '*[a-z][a-z]*' \
      | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  }

  prepare() {
    ( # submodules - quoternion
      cd "$_pkgsrc"
      git submodule init "lib"
      git submodule set-url "lib" "${srcdir}/libquotient"
      git -c protocol.file.allow=always submodule update "lib"
    )

    ( # submodules - libquotient
      cd "$_pkgsrc/lib"
      local _submodules=(
        'gtad/gtad'
        'doxygen-awesome-css'
      )
      for submodule in "${_submodules[@]}" ; do
        git submodule init "${submodule}"
        git submodule set-url "${submodule}" "${srcdir}/${submodule##*/}"
        git -c protocol.file.allow=always submodule update "${submodule}"
      done
    )
  }
fi

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_BUILD_TYPE=Release
    -DUSE_INTREE_LIBQMC=ON
    -DBUILD_WITH_QT6=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
