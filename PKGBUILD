# Maintainer:
# Contributor: Robert Brzozowski <robson75@linux.pl>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>

## options
: ${_build_git:=false}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname='compiz'
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.9.14.2
pkgrel=4
pkgdesc="Composite manager for Aiglx and Xgl, with plugins and CCSM"
url="https://launchpad.net/compiz"
arch=('i686' 'x86_64')
license=(
  'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
  'MIT'
)

# main package
_main_package() {
  depends=(
    'boost-libs'
    'fuse2'
    'glibmm'
    'glu'
    'libnotify'
    'libwnck3'
    'libxslt'
    'metacity'
    'protobuf'
    'python-cairo'
    'python-gobject'
    'xorg-server'
  )
  makedepends=(
    'boost'
    'cmake'
    'cython'
    'intltool'
    'python-setuptools'
  )
  optdepends=(
    'xorg-xprop: grab various window properties for use in window matching rules'
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
  provides=(
    "ccsm=${pkgver:0:6}"
    "compiz-bcop=${pkgver:0:6}"
    "compiz-core=${pkgver:0:6}"
    "compiz-plugins-extra=${pkgver:0:6}"
    "compiz-plugins-main=${pkgver:0:6}"
    "compizconfig-python=${pkgver:0:6}"
    "libcompizconfig=${pkgver:0:6}"
  )

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi

  source+=(
    "focus-prevention-disable.patch"
    "gtk-extents.patch"
    "reverse-unity-config.patch"
    "screenshot-launch-fix.patch"
    "no-compile-gschemas.patch"
  )
  sha256sums+=(
    'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
    '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
    '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
    '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
    '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
  )
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname-${pkgver%%.r*}"
  _pkgext="tar.xz"
  source+=(
    "$_pkgsrc.$_pkgext"::"https://launchpad.net/$_pkgname/${pkgver:0:6}/${pkgver%%.r*}/+download/$_pkgsrc.$_pkgext"
  )
  sha256sums+=(
    'cfa061e93b032275ff9e7041f582a8f6d5ae271cf8a89e6bc74e3d3635999d3c'
  )

  pkgver() {
    echo "${pkgver%%.r*}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  conflicts+=('compiz')
  provides+=("compiz=${pkgver:0:6}")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+https://git.launchpad.net/compiz")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
prepare() {
  cd "$_pkgsrc"

  # Reverse Unity specific configuration patches
  patch -p1 -i "$srcdir/reverse-unity-config.patch"

  # Set focus prevention level to off which means that new windows will always get focus
  patch -p1 -i "$srcdir/focus-prevention-disable.patch"

  # Fix incorrect extents for GTK+ tooltips, csd etc
  patch -p1 -i "$srcdir/gtk-extents.patch"

  # Fix application launching for the screenshot plugin
  patch -p1 -i "$srcdir/screenshot-launch-fix.patch"

  # Don't try to compile gschemas during make install
  patch -p1 -i "$srcdir/no-compile-gschemas.patch"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"

    -DCMAKE_CXX_STANDARD=17
    -DCMAKE_BUILD_TYPE="Release"
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_INSTALL_LIBDIR="/usr/lib"
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=ON
    -DCOMPIZ_BUILD_WITH_RPATH=OFF
    -DCOMPIZ_PACKAGING_ENABLED=ON
    -DBUILD_GTK=ON
    -DBUILD_METACITY=ON
    -DBUILD_KDE4=OFF
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

  # documentation
  #install -Dm644 "$_pkgsrc"/{AUTHORS,NEWS,README} \
  #  -t "$pkgdir/usr/share/doc/compiz/"

  # gsettings schema files
  if ls build/generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -Dm644 build/generated/glib-2.0/schemas/*.gschema.xml \
      -t "$pkgdir/usr/share/glib-2.0/schemas/"
  fi

  # licenses
  install -Dm644 "$_pkgsrc"/{COPYING,COPYING.GPL,COPYING.LGPL,COPYING.MIT} \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# execute
_main_package
