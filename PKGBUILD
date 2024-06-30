# Maintainer: lectrode <electrodexsnet AT gmail>
# Contributor: Matthew "Madness" Evan <matthew.v.evan@outlook.com>
# Contributor: Robert Brzozowski <robson75@linux.pl>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>

## options
: ${_build_git:=false}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_name='compiz'
_pkgname='compiz-easy-patch'
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.9.14.2
pkgrel=5.1
pkgdesc="OpenGL compositing window manager. Includes friendly defaults, GWD theme selector and autostart for Xfce & MATE."
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
    'zenity'
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
    'xfce-theme-greybird: A grey and blue Xfce theme'
  )
  replaces=('compiz-manjaro')
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
    "$_name"
    'compiz-manjaro'
  )
  provides=(
    "ccsm=${pkgver:0:6}"
    "compiz-bcop=${pkgver:0:6}"
    "compiz-core=${pkgver:0:6}"
    "compiz-plugins-extra=${pkgver:0:6}"
    "compiz-plugins-main=${pkgver:0:6}"
    "compizconfig-python=${pkgver:0:6}"
    "libcompizconfig=${pkgver:0:6}"
    "$_name=${pkgver:0:6}"
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
    "vertexbuffer-crash-fix.patch"
    "compiz-easy-defaults.patch"
    "compiz-easy.gschema.override"
    "compiz-gtk-decorator-theme-selector"
    "compiz-gtk-decorator-theme-selector.desktop"
    "compiz-xfce-autostart-setup"
    "compiz-xfce-autostart-setup.desktop"
    "compiz-xfce-uninstall-helper"
    "compiz-xfce-uninstall-helper.desktop"
  )
  sha256sums+=(
    'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
    '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
    '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
    '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
    '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
    'e27f686714d7666ceb839a2aa9ac4ca1b907f519791ccd3b2ea303921f402be1'
    '4d28bc2cefbfae77b9157f39876f5296b5edb7fb00de2a391a262688d2f7590c'
    'b549d6a61115ab0cbd6bf74be79cd449477aaadb6a9968743236e3ed3d93f668'
    '28d14e5ec0694b4a451540f35210eac5699e9daf1b00020bf59d8b0296d7d9bf'
    '0faaf9e9df28d2857108ccd0910d50ba631c34c2b1659b8860da8c2b552fc889'
    '3e46a0b50a16d9fd6fd4f9d28f6082fc76f39dff8a82a79af312126a6bcf7cc2'
    'd23b8633186bb3a2a841734ad0b917500f3536a67046f5d8fbb08818eab59160'
    '5c471a34a1d79a45e8c4a924f0f58d71199328e45c80472fe32ecaac76c987ee'
    '02eec20f75eb1f9571a2cf92013fc3c78d13c155a8ede0467cc10b83cdeba43c'
  )

install="${_pkgname}.install"

}

# stable package
_main_stable() {
  _pkgsrc="$_name-${pkgver%%.r*}"
  _pkgext="tar.xz"
  source+=(
    "$_pkgsrc.$_pkgext"::"https://launchpad.net/$_name/${pkgver:0:6}/${pkgver%%.r*}/+download/$_pkgsrc.$_pkgext"
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

  conflicts+=("$_pkgname")
  provides+=("$_pkgname=${pkgver:0:6}")

  _pkgsrc="$_name"
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

  # vertex buffer patch (fix expo wobbly windows crash)
  #https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/66215/diffs?commit_id=d0a0b3738fe16858024addcefa8fc917a5aa6fe0
  patch -p1 -i "$srcdir/vertexbuffer-crash-fix.patch"

  # Easy defaults
  patch -p1 -i "$srcdir/compiz-easy-defaults.patch"
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
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,expo,grid,regex,animation,ccp"

    -DCOMPIZ_BUILD_TESTING=OFF
    -DCOMPIZ_WERROR=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"

  # A race condition consistently causes build to fail in the following environment:
  # * processor has more than 4 threads
  # * compile folder is located on a spindle hdd
  # * MAKEFLAGS is configured to run more than 4 jobs at the same time
  # Limiting max simultaneous make jobs to 4 or less seems to work around the issue
  mjobs=4; [[ "$(nproc)" -lt 4 ]] && mjobs="$(nproc)"
  if [[ "$MAKEFLAGS" = "" ]]; then
    MAKEFLAGS="-j$mjobs"
  else
    curmjobs="$(echo "$MAKEFLAGS"|grep -oE '\-j[0-9]+'|cut -d'j' -f2)"
    if [[ "$curmjobs" = "" ]]; then
      MAKEFLAGS+=" -j$mjobs"
    else
      [[ "$curmjobs" -gt "$mjobs" ]] && MAKEFLAGS="${MAKEFLAGS//-j$curmjobs/-j$mjobs}"
    fi
  fi
  export MAKEFLAGS

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
  install -Dm644 "$_pkgsrc"/{AUTHORS,NEWS,README} \
    -t "$pkgdir/usr/share/doc/compiz/"

  # gsettings schema files
  if ls build/generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -Dm644 build/generated/glib-2.0/schemas/*.gschema.xml \
      -t "$pkgdir/usr/share/glib-2.0/schemas/"
  fi

  # licenses
  install -Dm644 "$_pkgsrc"/{COPYING,COPYING.GPL,COPYING.LGPL,COPYING.MIT} \
    -t "$pkgdir/usr/share/licenses/$pkgname"

  ## Easy Patch Stuff ##

  # Add dconf/gsettings schema override file
  install -Dm644 "$srcdir/compiz-easy.gschema.override" \
    -t "$pkgdir/usr/share/glib-2.0/schemas/"

  # Make ccsm icon appear in Xfce settings manager
  sed -i 's|Categories=Settings;DesktopSettings;|Categories=Settings;DesktopSettings;X-XFCE-SettingsDialog;X-XFCE-OtherSettings;|' "$pkgdir/usr/share/applications/ccsm.desktop"

  # Install GWD theme selector app
  install -Dm755 "$srcdir/compiz-gtk-decorator-theme-selector" \
    -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/compiz-gtk-decorator-theme-selector.desktop" \
    -t "$pkgdir/usr/share/applications/"

  # Place autostart/theme scripts/enablers
  install -Dm755 "$srcdir"/compiz-xfce-{'autostart-setup','uninstall-helper'} \
    -t "${pkgdir}/usr/bin/"
  install -Dm644 "$srcdir"/compiz-xfce-{'autostart-setup','uninstall-helper'}.desktop \
    -t "${pkgdir}/etc/xdg/autostart/"
}

# execute
_main_package
