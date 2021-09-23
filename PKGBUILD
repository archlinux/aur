# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>
# Contributor: lectrode <electrodexsnet AT gmail>

_name=compiz
pkgname=compiz-easy-patch
pkgver=0.9.14.1
pkgrel=6
pkgdesc="OpenGL compositing window manager. Includes friendly defaults, GWD theme selector and autostart for Xfce & MATE."
arch=('x86_64')
url="https://launchpad.net/${_name}"
license=('GPL' 'LGPL' 'MIT')
depends=('boost-libs' 'xorg-server' 'fuse2' 'glibmm' 'libwnck3' 'python-gobject' 'python-cairo' 'protobuf' 'metacity' 'glu' 'zenity')
makedepends=('boost' 'cmake' 'intltool' 'cython')
optdepends=(
  'xorg-xprop: grab various window properties for use in window matching rules'
  'xfce-theme-greybird: A grey and blue Xfce theme'
)
replaces=('compiz-manjaro')
conflicts=('compiz' 'compiz-core' 'compiz-gtk' 'compiz-bcop' 'ccsm' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-fusion-plugins-experimental' 'compizconfig-python' 'libcompizconfig' 'simple-ccsm' 'compiz-manjaro')
provides=("compiz=${pkgver}" "compiz-core=${pkgver}" "compiz-bcop=${pkgver}" "ccsm=${pkgver}" "compiz-plugins-main=${pkgver}" "compiz-plugins-extra=${pkgver}" "compizconfig-python=${pkgver}" "libcompizconfig=${pkgver}")

source=("https://launchpad.net/${_name}/${pkgver:0:6}/${pkgver}/+download/${_name}-${pkgver}.tar.xz"
        "focus-prevention-disable.patch"
        "gtk-extents.patch"
        "reverse-unity-config.patch"
        "screenshot-launch-fix.patch"
        "no-compile-gschemas.patch"
        "compiz-easy-defaults.patch"
        "gcc10_common_fix.patch"
        "compiz-easy.gschema.override"
        "compiz-gtk-decorator-theme-selector"
        "compiz-gtk-decorator-theme-selector.desktop"
        "compiz-xfce-autostart-setup"
        "compiz-xfce-autostart-setup.desktop"
        "compiz-xfce-uninstall-helper"
        "compiz-xfce-uninstall-helper.desktop"
        "remove-unused-or-broken-buttons.patch")

sha256sums=('2505602b6c93d6565e681473df4157634268533c6874c3cdc9493b73b301ac52'
            'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
            '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
            '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
            '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
            '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
            '4d28bc2cefbfae77b9157f39876f5296b5edb7fb00de2a391a262688d2f7590c'
            '2a0844e8d8f561f78efb546f231ce3ff2322e5c1b064cf3d30e2e3fe5631d070'
            'b549d6a61115ab0cbd6bf74be79cd449477aaadb6a9968743236e3ed3d93f668'
            '28d14e5ec0694b4a451540f35210eac5699e9daf1b00020bf59d8b0296d7d9bf'
            '0faaf9e9df28d2857108ccd0910d50ba631c34c2b1659b8860da8c2b552fc889'
            '3e46a0b50a16d9fd6fd4f9d28f6082fc76f39dff8a82a79af312126a6bcf7cc2'
            'd23b8633186bb3a2a841734ad0b917500f3536a67046f5d8fbb08818eab59160'
            '5c471a34a1d79a45e8c4a924f0f58d71199328e45c80472fe32ecaac76c987ee'
            '02eec20f75eb1f9571a2cf92013fc3c78d13c155a8ede0467cc10b83cdeba43c'
            '0f3281255963c03a5a7d03a825dcbfcef758ace78f9d0ed828d28277e2841f32')

install="${pkgname}.install"

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"

  # Reverse Unity specific configuration patches
  echo "#######reverse-unity-config.patch"
  patch -p1 -i "${srcdir}/reverse-unity-config.patch"

  # Set focus prevention level to off which means that new windows will always get focus
  echo "#######focus-prevention-disable.patch"
  patch -p1 -i "${srcdir}/focus-prevention-disable.patch"

  # Fix incorrect extents for GTK+ tooltips, csd etc
  echo "#######gtk-extents.patch"
  patch -p1 -i "${srcdir}/gtk-extents.patch"

  # Fix application launching for the screenshot plugin
  echo "#######screenshot-launch-fix.patch"
  patch -p1 -i "${srcdir}/screenshot-launch-fix.patch"

  # Don't try to compile gschemas during make install
  echo "#######no-compile-gschemas.patch"
  patch -p1 -i "${srcdir}/no-compile-gschemas.patch"

  # Fix linker error that gets raised with gcc 10 due to multiple definitions
  patch -p1 -i "${srcdir}/gcc10_common_fix.patch"

  # Remove buttons no longer supported in metacity
  patch -p1 -i "${srcdir}/remove-unused-or-broken-buttons.patch"  

  # Manjaro defaults
  echo "#######compiz-easy-defaults.patch"
  patch -p1 -i "${srcdir}/compiz-easy-defaults.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  mkdir build; cd build

  cmake .. \
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
  cd "${srcdir}/${_name}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  # make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -dm755 "${pkgdir}${CMAKE_DIR}/Modules/"
  install -m644 ../cmake/FindCompiz.cmake "${pkgdir}${CMAKE_DIR}/Modules/"

  # Add documentation
  install -dm755 "${pkgdir}/usr/share/doc/compiz/"
  install ../{AUTHORS,NEWS,README} "${pkgdir}/usr/share/doc/compiz/"

  # Add the gsettings schema files
  if ls generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/"
    install -m644 generated/glib-2.0/schemas/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/"
  fi

  # Install licenses
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_name}-${pkgver}"/{COPYING,COPYING.GPL,COPYING.LGPL,COPYING.MIT} "${pkgdir}/usr/share/licenses/${pkgname}"
  
  ## Manjaro stuff
  # Add Manjaro dconf/gsettings schema override file
  install -Dm644 "${srcdir}/compiz-easy.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/compiz-easy.gschema.override"
  # Make ccsm icon appear in Xfce settings manager
  sed -i 's|Categories=Settings;DesktopSettings;|Categories=Settings;DesktopSettings;X-XFCE-SettingsDialog;X-XFCE-OtherSettings;|' "${pkgdir}/usr/share/applications/ccsm.desktop"
  # Install GWD theme selector app
  install -Dm755 "${srcdir}/compiz-gtk-decorator-theme-selector" "${pkgdir}/usr/bin/compiz-gtk-decorator-theme-selector"
  install -Dm644 "${srcdir}/compiz-gtk-decorator-theme-selector.desktop" "${pkgdir}/usr/share/applications/compiz-gtk-decorator-theme.desktop"
  # Place autostart/theme scripts/enablers
  install -Dm755 "${srcdir}/compiz-xfce-autostart-setup" "${pkgdir}/usr/bin/compiz-xfce-autostart-setup"
  install -Dm644 "${srcdir}/compiz-xfce-autostart-setup.desktop" "${pkgdir}/etc/xdg/autostart/compiz-xfce-autostart-setup.desktop"
  install -Dm755 "${srcdir}/compiz-xfce-uninstall-helper" "${pkgdir}/usr/bin/compiz-xfce-uninstall-helper"
  install -Dm644 "${srcdir}/compiz-xfce-uninstall-helper.desktop" "${pkgdir}/etc/xdg/autostart/compiz-xfce-uninstall-helper.desktop"
}

