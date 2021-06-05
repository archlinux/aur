# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=detect-it-easy-git
pkgver=3.02.r1.aec057a
pkgrel=1
pkgdesc='Detect It Easy, or abbreviated "DIE" is a program for determining types of files'
arch=('x86_64')
url='https://github.com/horsicq/Detect-It-Easy/'
license=(MIT)
provides=(
  'detect-it-easy'
)
conflicts=(
  'detect-it-easy'
)
depends=(
  'freetype2'
  'git'
  'glib2'
  'glibc'
  'graphite'
  'icu'
  'krb5'
  'qt5-base'
  'qt5-script'
  'qt5-svg'
  'systemd-libs'
)
makedepends=(
  'imagemagick'
  'qt5-tools'
)
source=(
  'git+https://github.com/horsicq/DIE-engine.git'
  'detect-it-easy.desktop'
)
sha512sums=(
  'SKIP'
  '65f33f3c5f3d01e771d3f9c5b1d59b4cedc2441cf002f762239580592b2d98820173427d6385ac1fd339a8ae105a89705caa8540e20b3c65640f80ba4711f446'
)
_srcname="DIE-engine"
_pkgname="${pkgname/-git/}"
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>${_stop} "



pkgver() {
  cd "$_srcname" || return
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_srcname" || return
  echo -e "${_prefix}Checking out external dependencies (git submodules)"
  git submodule update --init --recursive
}

build() {
  cd "$_srcname" || return
  echo -e "${_prefix}Building detect-it-easy"

  _subdirs="build_libs gui_source console_source"

  # FIXME UPSTREAM: -Werror=format-security is causing build errors
  export CFLAGS+=" -Wno-format-security"
  export CXXFLAGS+=" -Wno-format-security"

  for _subdir in $_subdirs; do
    pushd "$_subdir" || return
    echo -e "${_prefix}${_prefix}Building $_subdir"
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${QMAKE_CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "$_subdir.pro"
    make -f Makefile clean
    make -f Makefile
    popd || return
  done

  echo -e "${_prefix}${_prefix}Running Qt's Linguist tool chain for gui_source"
  cd gui_source || return
  lupdate gui_source_tr.pro
  lrelease gui_source_tr.pro
}

package() {
  cd "$_srcname" || return

  echo -e "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt/"${_pkgname}",usr/bin,usr/share/pixmaps}
  install -d "$pkgdir/opt/${_pkgname}"/{lang,qss,info,db,signatures}

  echo -e "${_prefix}Copying the package binaries"
  install -Dm 755 build/release/die -t "$pkgdir"/opt/"${_pkgname}"
  install -Dm 755 build/release/diec -t "$pkgdir"/opt/"${_pkgname}"

  echo -e "${_prefix}Copying the package files"
  install -Dm 644 gui_source/translation/* -t "$pkgdir"/opt/"${_pkgname}"/lang
  install -Dm 644 XStyles/qss/* -t "$pkgdir"/opt/"${_pkgname}"/qss
  install -Dm 644 Detect-It-Easy/info/* -t "$pkgdir"/opt/"${_pkgname}"/info
  cp -r Detect-It-Easy/db/* -t "$pkgdir"/opt/"${_pkgname}"/db/
  install -Dm 644 signatures/crypto.db -t "$pkgdir"/opt/"${_pkgname}"/signatures

  echo -e "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/"${_pkgname}"/die "$pkgdir"/usr/bin/die
  ln -s /opt/"${_pkgname}"/diec "$pkgdir"/usr/bin/diec

  echo -e "${_prefix}Setting up desktop icon"
  convert icons/main.ico[0] "$pkgdir"/usr/share/pixmaps/"${_pkgname}".png

  echo -e "${_prefix}Setting up desktop shortcuts"
  install -Dm 644 ../"${_pkgname}".desktop -t "$pkgdir"/usr/share/applications
}
