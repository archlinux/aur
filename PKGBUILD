# Maintainer: lectrode <electrodexsnet AT gmail>
# Contributor: Matthew "Madness" Evan <matthew.v.evan@outlook.com>
# Contributor: Robert Brzozowski <robson75@linux.pl>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>

_name=compiz
pkgname=compiz-easy-patch
pkgver=0.9.14.2
pkgrel=3
pkgdesc="OpenGL compositing window manager. Includes friendly defaults, GWD theme selector and autostart for Xfce & MATE."
arch=('i686' 'x86_64')
url="https://launchpad.net/compiz"
license=('GPL' 'LGPL' 'MIT')
depends=(
  'boost-libs'
  'xorg-server'
  'fuse2'
  'glibmm'
  'libwnck3'
  'python-gobject'
  'python-cairo'
  'protobuf'
  'metacity'
  'glu'
  'libxslt'
  'zenity'
)
makedepends=(
  'boost'
  'cmake'
  'intltool'
  'cython'
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
  'compiz'
  'compiz-manjaro'
)
provides=(
  "ccsm=$pkgver"
  "compiz-bcop=$pkgver"
  "compiz-core=$pkgver"
  "compiz-plugins-extra=$pkgver"
  "compiz-plugins-main=$pkgver"
  "compizconfig-python=$pkgver"
  "libcompizconfig=$pkgver"
  "compiz=${pkgver}"
)
source=(
  "https://launchpad.net/${_name}/${pkgver:0:6}/${pkgver}/+download/${_name}-${pkgver}.tar.xz"
  "focus-prevention-disable.patch"
  "gtk-extents.patch"
  "reverse-unity-config.patch"
  "screenshot-launch-fix.patch"
  "no-compile-gschemas.patch"
  "compiz-easy-defaults.patch"
  "compiz-easy.gschema.override"
  "compiz-gtk-decorator-theme-selector"
  "compiz-gtk-decorator-theme-selector.desktop"
  "compiz-xfce-autostart-setup"
  "compiz-xfce-autostart-setup.desktop"
  "compiz-xfce-uninstall-helper"
  "compiz-xfce-uninstall-helper.desktop"
)
sha256sums=(
  'cfa061e93b032275ff9e7041f582a8f6d5ae271cf8a89e6bc74e3d3635999d3c'
  'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
  '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
  '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
  '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
  '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
  '4d28bc2cefbfae77b9157f39876f5296b5edb7fb00de2a391a262688d2f7590c'
  'b549d6a61115ab0cbd6bf74be79cd449477aaadb6a9968743236e3ed3d93f668'
  '28d14e5ec0694b4a451540f35210eac5699e9daf1b00020bf59d8b0296d7d9bf'
  '0faaf9e9df28d2857108ccd0910d50ba631c34c2b1659b8860da8c2b552fc889'
  '3e46a0b50a16d9fd6fd4f9d28f6082fc76f39dff8a82a79af312126a6bcf7cc2'
  'd23b8633186bb3a2a841734ad0b917500f3536a67046f5d8fbb08818eab59160'
  '5c471a34a1d79a45e8c4a924f0f58d71199328e45c80472fe32ecaac76c987ee'
  '02eec20f75eb1f9571a2cf92013fc3c78d13c155a8ede0467cc10b83cdeba43c'
)

install="${pkgname}.install"

prepare() {
  cd "$srcdir/${_name}-$pkgver"

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

  # Easy defaults
  patch -p1 -i "${srcdir}/compiz-easy-defaults.patch"
}

build() {
  cd "$srcdir/${_name}-$pkgver"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=On \
    -DCOMPIZ_BUILD_WITH_RPATH=Off \
    -DCOMPIZ_PACKAGING_ENABLED=On \
    -DBUILD_GTK=On \
    -DBUILD_METACITY=On \
    -DBUILD_KDE4=Off \
    -DCOMPIZ_BUILD_TESTING=Off \
    -DCOMPIZ_WERROR=Off \
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,expo,grid,regex,animation,ccp"

    make
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  cd build

  make DESTDIR="$pkgdir" install

  # findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  # make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -Dm644 ../cmake/FindCompiz.cmake \
    -t "${pkgdir}${CMAKE_DIR}/Modules/"

  # Add documentation
  install -Dm644 ../{AUTHORS,NEWS,README} \
    -t "$pkgdir/usr/share/doc/compiz/"

  # Add the gsettings schema files
  if ls generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -Dm644 generated/glib-2.0/schemas/*.gschema.xml \
      -t "$pkgdir/usr/share/glib-2.0/schemas/"
  fi

  # Install licenses
  install -Dm644 "$srcdir/${_name}-$pkgver"/{COPYING,COPYING.GPL,COPYING.LGPL,COPYING.MIT} \
    -t "$pkgdir/usr/share/licenses/$pkgname"

  ## Easy Patch Stuff ##

  # Add dconf/gsettings schema override file
  install -Dm644 "${srcdir}/compiz-easy.gschema.override" \
    -t "$pkgdir/usr/share/glib-2.0/schemas/"

  # Make ccsm icon appear in Xfce settings manager
  sed -i 's|Categories=Settings;DesktopSettings;|Categories=Settings;DesktopSettings;X-XFCE-SettingsDialog;X-XFCE-OtherSettings;|' "${pkgdir}/usr/share/applications/ccsm.desktop"

  # Install GWD theme selector app
  install -Dm755 "${srcdir}/compiz-gtk-decorator-theme-selector" \
    -t "$pkgdir/usr/bin/"
  install -Dm644 "${srcdir}/compiz-gtk-decorator-theme-selector.desktop" \
    -t "$pkgdir/usr/share/applications/"

  # Place autostart/theme scripts/enablers
  install -Dm755 "${srcdir}"/compiz-xfce-{'autostart-setup','uninstall-helper'} \
    -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}"/compiz-xfce-{'autostart-setup','uninstall-helper'}.desktop \
    -t "${pkgdir}/etc/xdg/autostart/"
}
