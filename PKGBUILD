# Maintainer:
# Contributor: Robert Brzozowski <robson75@linux.pl>
# Contributor: Charles Bos <charlesbos1 AT gmail>

## options
: ${_build_sodeps:=false}

_pkgname='compiz'
pkgname="$_pkgname"
pkgver=0.9.14.2
pkgrel=9
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

_pkgsrc="$_pkgname-${pkgver%%.r*}"
_pkgext="tar.xz"
source=(
  "$_pkgsrc.$_pkgext"::"https://launchpad.net/$_pkgname/${pkgver:0:6}/${pkgver%%.r*}/+download/$_pkgsrc.$_pkgext"

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

  # New upstream patches
  "0006-Drop-toggle-shaded-since-it-s-no-longer-included-in-.patch"
  "0007-64-bit-time-t-compat.patch"

  # https://bugs.launchpad.net/compiz/+bug/2060620
  "1001-fix-crash-in-vertexbuffer.patch"
)
sha256sums=(
  'cfa061e93b032275ff9e7041f582a8f6d5ae271cf8a89e6bc74e3d3635999d3c'

  '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
  'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
  '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
  '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
  '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
  '9b9e92a7174f2255f408d340dcb7b765211777cd92fe9ed17b5888ff13578291'
  '90969b7beba107a7146b11c3a60969b62c2be7a3e891d7dee913504ec6de759c'

  '859dca15821fac3b8d1e231d48932c0fad3f5d3f16cb53a8a761df2bd51b9d3a'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_CXX_STANDARD=17
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON
    -DCOMPIZ_BUILD_WITH_RPATH=OFF
    -DCOMPIZ_PACKAGING_ENABLED=ON
    -DBUILD_GTK=ON
    -DBUILD_METACITY=ON
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,regex,animation,wall,ccp"
    -DCOMPIZ_BUILD_TESTING=OFF
    -DCOMPIZ_WERROR=OFF
    -Wno-dev
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
