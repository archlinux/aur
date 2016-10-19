# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Iven Hsu <ivenvd AT gmail>

_name=compiz
pkgname=compiz-manjaro
_series=0.9.13
pkgver=${_series}.0
pkgrel=5
_greybirdver=1.6.2
pkgdesc="OpenGL compositing window manager. Includes friendly defaults, GWD theme selector and autostart for Xfce & MATE."
arch=('i686' 'x86_64')
url="https://launchpad.net/${_name}"
license=('GPL' 'LGPL' 'MIT')
depends=('boost' 'xorg-server' 'libxcomposite' 'startup-notification' 'librsvg' 'dbus' 'mesa' 'libxslt' 'fuse' 'glibmm' 'libxrender' 'libwnck3' 'pygtk' 'desktop-file-utils' 'pyrex' 'protobuf' 'metacity' 'glu' 'libsm' 'dconf' 'zenity')
makedepends=('cmake' 'intltool')
optdepends=(
  'xorg-xprop: grab various window properties for use in window matching rules'
)
conflicts=('compiz' 'compiz09-manjaro-test' 'compiz-core-bzr' 'compiz-core-devel' 'compiz-core' 'compiz-gtk-standalone' 'compiz-xfce' 'compiz-mate'
           'compiz-core-mate' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-fusion-plugins-unsupported' 'compiz-fusion-plugins-experimental'
           'compiz-decorator-gtk' 'compiz-decorator-kde' 'libcompizconfig' 'compizconfig-python' 'compizconfig-backend-gconf' 'compiz-bcop' 'ccsm')
replaces=('compiz09-manjaro-test')
provides=("${_name}=${pkgver}")
source=("${url}/${_series}/${pkgver}/+download/${_name}-${pkgver}.tar.bz2"
        "focus-prevention-disable.patch"
        "gtk-extents.patch"
        "trailfocus-fix.patch"
        "metacity322-branch-rollup.patch"
        "${pkgname}-defaults.patch"
        "${pkgname}.gschema.override"
        "compiz-gtk-decorator-theme-selector"
        "compiz-gtk-decorator-theme-selector.desktop"
        "compiz-xfce-autostart-setup"
        "compiz-xfce-autostart-setup.desktop"
        "compiz-xfce-uninstall-helper"
        "compiz-xfce-uninstall-helper.desktop"
        "greybird-${_greybirdver}.tar.gz::https://github.com/shimmerproject/Greybird/archive/v${_greybirdver}.tar.gz")
sha256sums=('f08eb54d578be559e3e723f3fe4291a56f5c96b2fdfb9c9e74ebb6596a1ca702'
            'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
            '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
            '01e94ac52cd39eb5462a8505c7df61c7b14b05159de64f8700dfadb524bdb2ce'
            '4deb954e539853ab5297d0603b1dd7ce72361425d7d88e4e49c9351d91bf0a91'
            'b635bfbefd558cd255d6cb119378b01d9b3815b8f5f6b3a03dfe736c0cd5746b'
            '149213e0b29e34744b6e8e51cdaccc4011fd29c5f9475c59aa7482f3fe4a68af'
            '28d14e5ec0694b4a451540f35210eac5699e9daf1b00020bf59d8b0296d7d9bf'
            '0faaf9e9df28d2857108ccd0910d50ba631c34c2b1659b8860da8c2b552fc889'
            '3e46a0b50a16d9fd6fd4f9d28f6082fc76f39dff8a82a79af312126a6bcf7cc2'
            'd23b8633186bb3a2a841734ad0b917500f3536a67046f5d8fbb08818eab59160'
            '5c471a34a1d79a45e8c4a924f0f58d71199328e45c80472fe32ecaac76c987ee'
            '02eec20f75eb1f9571a2cf92013fc3c78d13c155a8ede0467cc10b83cdeba43c'
            '473a38b379381311b68dcc579005c0d5bbfbabefe1de7107d897c68b81e6b460')
install="${pkgname}.install"

prepare() {
  cd "${_name}-${pkgver}"
  
  # Fix decorator start command
  sed -i 's/exec \\"${COMPIZ_BIN_PATH}compiz-decorator\\"/exec \/usr\/bin\/compiz-decorator/g' plugins/decor/decor.xml.in

  # Set focus prevention level to off which means that new windows will always get focus
  patch -p1 -i "${srcdir}/focus-prevention-disable.patch"
  
  # Use Python 2
  find -type f \( -name 'CMakeLists.txt' -or -name '*.cmake' \) -exec sed -e 's/COMMAND python/COMMAND python2/g' -i {} \;
  find compizconfig/ccsm -type f -exec sed -e 's|^#!.*python|#!/usr/bin/env python2|g' -i {} \;
  
  # Fix Python build directory with CMake 3.2
  sed -i 's/${PY_BUILD_DIR}/lib/g' compizconfig/ccsm/CMakeLists.txt
  
  # Fix incorrect extents for GTK+ tooltips, csd etc
  patch -p1 -i "${srcdir}/gtk-extents.patch"

  # Fix ambiguous function call in trailfocus plugin
  patch -p1 -i "${srcdir}/trailfocus-fix.patch"
  
  # Metacity 3.22 support
  patch -p1 -i "${srcdir}/metacity322-branch-rollup.patch"
  
  # Manjaro defaults
  patch -p1 -i "${srcdir}/${pkgname}-defaults.patch"
}

build() {
  cd "${_name}-${pkgver}"
  
  export PYTHON="/usr/bin/python2"
  
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
  cd "${_name}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  #make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -dm755 "${pkgdir}${CMAKE_DIR}/Modules/"
  install -m644 ../cmake/FindCompiz.cmake "${pkgdir}${CMAKE_DIR}/Modules/"	

  # Add documentation
  install -dm755 "${pkgdir}/usr/share/doc/compiz/"
  install ../{AUTHORS,NEWS,README} "${pkgdir}/usr/share/doc/compiz/"

  # Add the gsettings schema files manually
  if ls generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/" 
    install -m644 generated/glib-2.0/schemas/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/" 
  fi 
  
  ## Manjaro stuff
  # Add Manjaro dconf/gsettings schema override file
  install -Dm644 "${srcdir}/${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
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
  
  # greybird window decorations
  cd "${srcdir}/Greybird-${_greybirdver}"
  mkdir -p "${pkgdir}/usr/share/themes/compiz-xfce-greybird"
  cp LICENSE* "${pkgdir}/usr/share/themes/compiz-xfce-greybird"
  cp -r metacity-1/ "${pkgdir}/usr/share/themes/compiz-xfce-greybird"
  rm "${pkgdir}/usr/share/themes/compiz-xfce-greybird/metacity-1/metacity-theme-2.xml"
  sed -i 's|Greybird|compiz-xfce-greybird|' "${pkgdir}/usr/share/themes/compiz-xfce-greybird/metacity-1/metacity-theme-3.xml"
}

