# Maintainer:
# Contributor: Robert Brzozowski <robson75@linux.pl>
# Contributor: Charles Bos <charlesbos1 AT gmail>

## options
: ${_build_sodeps:=false}

: ${_commit:=ff7ff00fb3c4f771fd8caf98bb568837f58f0c0a} # 0.9.14.2.r25

_pkgname='compiz'
pkgname="$_pkgname"
pkgver=0.9.14.2
pkgrel=12
pkgdesc="Composite manager for Aiglx and Xgl, with plugins and CCSM"
url="https://launchpad.net/compiz"
arch=('i686' 'x86_64')
license=(
  'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
  'MIT'
)

depends=(
  'glibmm'
  'glu'
  'gtk3'
  'libice'
  'libnotify'
  'libsm'
  'libwnck3'
  'libxslt'
  'metacity'
  'protobuf'
  'python'
  'python-cairo'
  'python-dbus'
  'python-gobject'
)
makedepends=(
  'boost'
  'cmake'
  'cython'
  'git'
  'intltool'
  'ninja'
  'python-setuptools'
)
optdepends=(
  'xorg-xprop: grab various window properties for use in window matching rules'
)

if [ "${_build_sodeps::1}" = "t" ]; then
  depends+=(
    "libprotobuf.so"
  )
fi

provides=(
  "ccsm=${pkgver:0:6}"
  "compiz-bcop=${pkgver:0:6}"
  "compiz-core=${pkgver:0:6}"
  "compiz-plugins-extra=${pkgver:0:6}"
  "compiz-plugins-main=${pkgver:0:6}"
  "compizconfig-python=${pkgver:0:6}"
  "libcompizconfig=${pkgver:0:6}"
)
conflicts=(
  'ccsm'
  'compiz-bcop'
  'compiz-core'
  'compiz-fusion-plugins-experimental'
  'compiz-fusion-plugins-extra'
  'compiz-fusion-plugins-main'
  'compiz-gtk'
  'compizconfig-python'
  'libcompizconfig'
  'simple-ccsm'
)

_pkgsrc="$_pkgname"
_pkgext="tar.xz"
source=(
  "$_pkgsrc"::"git+https://git.launchpad.net/compiz#commit=$_commit"

  # Reverse Unity specific configuration patches
  "0001-reverse-unity-config.patch"

  # Set focus prevention level to off which means that new windows will always get focus
  "0002-focus-prevention-disable.patch"

  # Fix incorrect extents for GTK+ tooltips, csd etc
  "0003-gtk-extents.patch"

  # Fix application launching for the screenshot plugin
  "0004-screenshot-launch-fix.patch"

  # Don't try to compile gschemas during make install
  "0005-no-compile-gschemas.patch"
)
sha256sums=(
  '4acc9a911c9a1e9b30ca1a1af8426d71bab194824bc37b0edb37dd81a45470e0'
  '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
  'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
  '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
  '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
  '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  # fix cmake path
  sed -E -e 's&(/share/cmake)-\S+/&\1/Modules/&' -i "$_pkgsrc/cmake/base.cmake"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-author

    -DBUILD_GTK=ON
    -DBUILD_METACITY=ON
    -DCOMPIZ_BUILD_TESTING=OFF
    -DCOMPIZ_BUILD_WITH_RPATH=OFF
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,regex,animation,wall,ccp"
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON
    -DCOMPIZ_PACKAGING_ENABLED=ON
    -DCOMPIZ_WERROR=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  # make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -Dm644 "$_pkgsrc/cmake/FindCompiz.cmake" \
    -t "${pkgdir}${CMAKE_DIR}/Modules/"

  # gsettings schema files
  if ls build/generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -Dm644 build/generated/glib-2.0/schemas/*.gschema.xml \
      -t "$pkgdir/usr/share/glib-2.0/schemas/"
  fi

  # licenses
  for i in COPYING COPYING.GPL COPYING.LGPL COPYING.MIT; do
    install -Dm644 "$_pkgsrc/$i" "$pkgdir/usr/share/licenses/$pkgname/LICENSE${i#COPYING}"
  done
}
