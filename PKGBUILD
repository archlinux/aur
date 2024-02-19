# Maintainer: Daniel Albers <daniel@lbe.rs>
# Co-Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Source: <https://github.com/AlD/archlinux/tree/master/pkgbuilds/quassel>
# from: git

pkgbase='quassel'
pkgdesc='QT-based distributed IRC client'
pkgname=("${pkgbase}-git"
         "${pkgbase}-light-git"
         "${pkgbase}-light-webengine-git"
         "${pkgbase}-client-git"
         "${pkgbase}-client-light-git"
         "${pkgbase}-client-light-webengine-git"
         "${pkgbase}-core-git"
         "${pkgbase}-common-git"
        )

pkgver=0.14.0.r8.g020c1634
pkgrel=6
url='http://quassel-irc.org'
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'aarch64')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'hicolor-icon-theme'
             'knotifyconfig5' 'python' 'qca-qt5' 'qt5-base' 'qt5-script'
             'qt5-tools' 'qt5-webengine' 'boost' 'rsync')
source=(
  'git+https://github.com/quassel/quassel.git'
  'git+https://github.com/quassel/quassel-i18n.git'
)
md5sums=('SKIP'
         'SKIP')
## Common build options
_build_common=(
  -Wno-dev
  -DCMAKE_INSTALL_PREFIX=/usr
  -DCMAKE_INSTALL_LIBDIR=lib
  -DHAVE_SSL=ON
)
_build_client_common=(
  -DWANT_MONO=OFF
  -DWANT_CORE=OFF
  -DWANT_QTCLIENT=ON
  -DWITH_WEBKIT=OFF
)
_build_mono_common=(
  -DWANT_MONO=ON
  -DWANT_CORE=OFF
  -DWANT_QTCLIENT=OFF
  -DWITH_WEBKIT=OFF
)

## pkg specific build options
_build_git=(
  "${_build_mono_common[@]}"
  -DWITH_KDE=ON
  -DWITH_WEBENGINE=ON
)
_build_light_git=(
  "${_build_mono_common[@]}"
  -DWITH_KDE=OFF
  -DWITH_WEBENGINE=OFF
)
_build_light_webengine_git=(
  "${_build_mono_common[@]}"
  -DWITH_KDE=OFF
  -DWITH_WEBENGINE=ON
)
_build_client_git=(
  "${_build_client_common[@]}"
  -DWITH_KDE=ON
  -DWITH_WEBENGINE=ON
)
_build_client_light_git=(
  "${_build_client_common[@]}"
  -DWITH_KDE=OFF
  -DWITH_WEBENGINE=OFF
)
_build_client_light_webengine_git=(
  "${_build_client_common[@]}"
  -DWITH_KDE=OFF
  -DWITH_WEBENGINE=ON
)
_build_core_git=(
  -DWANT_MONO=OFF
  -DWANT_CORE=ON
  -DWANT_QTCLIENT=OFF
)

prepare() {
  cd "${srcdir}/${pkgbase}"
  git submodule init
  git config submodule.mysubmodule.url "$srcdir/quassel-i18n"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  #git describe --always | sed 's/-beta/.0.beta/; s/-/./g;'
  git -C "${srcdir}/${pkgbase}" describe --always |
    sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  local pkg
  for pkg in "${pkgname[@]#$pkgbase-*}";do
    _build "${pkg}"
  done
}

_build() {
  [[ $1 == common-git ]] && ln -sf git common-git && return 0
  local -n _build_opts="_build_${1//-/_}"
  if ((${#_build_opts[@]} == 0));then
    error 'No build option configured: %s' "$pkgbase-$1"
    return 1
  fi

  msg2 'Preparing build directory: %s...' "$pkgbase-$1"
  if [[ -d git && ! -d "$1" ]];then
    rm -f "$1"
    rsync -aqzP --del git/ "$1"/
    rm -f "$1/CMakeCache.txt"
  fi
  cmake -S "${srcdir}/${pkgbase}" \
        -B "${srcdir}/$1" \
        "${_build_common[@]}" \
        "${_build_opts[@]}"
  msg2 'Compiling: %s...' "$pkgbase-$1"
  make -C "$1"
}

_install() {
  make -C "${pkgname#$pkgbase-*}" DESTDIR="$pkgdir" install
  case "${pkgname#$pkgbase-*}" in
    common*) rm -rf "$pkgdir/usr"/{bin,lib,share/applications} ;;
    *) rm -rf "$pkgdir/usr/share"/{icons,knotifications5,quassel} ;;
  esac
}

package_quassel-common-git() {
  depends=('hicolor-icon-theme')
  pkgdesc='Common files for Quassel'
  provides=("${pkgbase}-common")
  conflicts=("${pkgbase}-common")

  _install
}

package_quassel-client-git() {
  depends=("${pkgbase}-common-git" 'knotifyconfig5' 'qt5-base' 'qt5-webengine')
  pkgdesc='KDE-based distributed IRC client (client only)'
  provides=("${pkgbase}-client")
  conflicts=("${pkgbase}-client")

  _install
}

package_quassel-client-light-git() {
  pkgdesc='Qt-based distributed IRC client (client only, w/o kde deps)'
  depends=("${pkgbase}-common-git" 'qt5-base')
  provides=("${pkgbase}-client")
  conflicts=("${pkgbase}-client")

  _install
}

package_quassel-client-light-webengine-git() {
  pkgdesc='Qt-based distributed IRC client (client only, w/o kde deps)'
  depends=("${pkgbase}-common-git" 'qt5-base' 'qt5-webengine')
  provides=("${pkgbase}-client")
  conflicts=("${pkgbase}-client")

  _install
}

package_quassel-core-git() {
  pkgdesc='KDE/Qt-based distributed IRC client (core only)'
  depends=('icu' 'qca-qt5' 'qt5-script')
  provides=("${pkgbase}-core")
  conflicts=("${pkgbase}-core")

  _install
}

package_quassel-git() {
  pkgdesc='KDE-based IRC client (monolithic version)'
  depends=("${pkgbase}-common-git" 'knotifyconfig5' 'qca-qt5' 'qt5-base'
           'qt5-script' 'qt5-webengine')
  provides=("${pkgbase}-monolithic")
  conflicts=("${pkgbase}-monolithic")

  _install
}

package_quassel-light-git() {
  pkgdesc='Qt-based IRC client (monolithic version, w/o kde deps)'
  depends=("${pkgbase}-common-git" 'qt5-base')
  provides=("${pkgbase}-monolithic")
  conflicts=("${pkgbase}-monolithic")

  _install
}

package_quassel-light-webengine-git() {
  pkgdesc='Qt-based IRC client (monolithic version, w/o kde deps)'
  depends=("${pkgbase}-common-git" 'qt5-base' 'qt5-webengine')
  provides=("${pkgbase}-monolithic")
  conflicts=("${pkgbase}-monolithic")

  _install
}
