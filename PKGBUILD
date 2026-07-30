# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>
# Co-Maintainer: Hors Icq <horsicq at googlemail dot com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=detect-it-easy-git
_pkgname=${pkgname%-git}
pkgver=4.0.0.r21502.44209ea
pkgrel=1
pkgdesc='Detect It Easy (DIE) is a program for determining types of files'
arch=('x86_64')
url='https://horsicq.github.io'
license=('MIT')
provides=('detect-it-easy')
conflicts=('detect-it-easy')
depends=(
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'graphite'
  'hicolor-icon-theme'
  'icu'
  'krb5'
  'qt5-base'
  'qt5-script'
  'qt5-svg'
  'systemd-libs'
)
makedepends=(
  'cmake'
  'git'
  'qt5-tools'
)

_srcname="DIE-engine"
source=('git+https://github.com/horsicq/DIE-engine.git')
sha512sums=('SKIP')

_prefix="==> "

pkgver() {
  cd "$_srcname"
  local _base_ver=$(cat release_version.txt)
  local _rev_count=$(git rev-list --count HEAD)
  local _short_hash=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.%s" "$_base_ver" "$_rev_count" "$_short_hash"
}

prepare() {
  cd "$srcdir/$_srcname"
  git submodule update --init --recursive
}

build() {
  cd "$_srcname" || return
  echo "${_prefix}Building detect-it-easy"

  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="$(pwd)/build/release" \
    -DCMAKE_C_FLAGS_RELEASE="${CFLAGS} -DNDEBUG" \
    -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} -DNDEBUG"

  cmake --build build -j$(nproc)
}

package() {
  cd "$_srcname" || return

  echo "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt/"${_pkgname}",usr/bin,usr/share/icons}
  install -d "$pkgdir/opt/${_pkgname}"/{lang,qss,info,db,db_extra,signatures,images,yara_rules,peid}

  echo "${_prefix}Copying the package binaries"
  install -Dm 755 build/release/die -t "$pkgdir"/opt/"${_pkgname}"
  install -Dm 755 build/release/diec -t "$pkgdir"/opt/"${_pkgname}"
  install -Dm 755 build/release/diel -t "$pkgdir"/opt/"${_pkgname}"

  echo "${_prefix}Copying the package files"
  install -Dm 644 build/src/translations/*.qm -t "$pkgdir"/opt/"${_pkgname}"/lang
  install -Dm 644 dep/XStyles/qss/* -t "$pkgdir"/opt/"${_pkgname}"/qss
  cp -r dep/XInfoDB/info/* -t "$pkgdir"/opt/"${_pkgname}"/info/
  cp -r dep/Detect-It-Easy/db/* -t "$pkgdir"/opt/"${_pkgname}"/db/
  cp -r dep/Detect-It-Easy/db_extra/* -t "$pkgdir"/opt/"${_pkgname}"/db_extra/
  cp -r dep/XYara/yara_rules/* -t "$pkgdir"/opt/"${_pkgname}"/yara_rules/
  cp -r dep/XPEID/peid/* -t "$pkgdir"/opt/"${_pkgname}"/peid/
  install -Dm 644 dep/signatures/crypto.db -t "$pkgdir"/opt/"${_pkgname}"/signatures
  cp -r images/* -t "$pkgdir"/opt/"${_pkgname}"/images/

  echo "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/"${_pkgname}"/die "$pkgdir"/usr/bin/die
  ln -s /opt/"${_pkgname}"/diec "$pkgdir"/usr/bin/diec
  ln -s /opt/"${_pkgname}"/diel "$pkgdir"/usr/bin/diel

  echo "${_prefix}Setting up desktop icons"
  cp -r LINUX/hicolor "$pkgdir"/usr/share/icons

  echo "${_prefix}Setting up desktop shortcuts"
  install -Dm 644 LINUX/io.github.horsicq.detect-it-easy.desktop -t "$pkgdir"/usr/share/applications

  echo "${_prefix}Setting up metainfo file"
  install -Dm 644 LINUX/io.github.horsicq.detect-it-easy.metainfo.xml -t "$pkgdir"/usr/share/metainfo

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  echo "${_prefix}Applying directory layout fix"
  install -d "$pkgdir/usr/lib/die/"
  for dir in db db_extra images info lang qss signatures yara_rules peid; do
    ln -s "/opt/${_pkgname}/$dir" "$pkgdir/usr/lib/die/$dir"
  done
}
