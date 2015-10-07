# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Iven Hsu <ivenvd AT gmail>

_name=compiz
pkgname=compiz-manjaro
_series=0.9.12
pkgver=${_series}.2
pkgrel=1
_greybirdver=1.5.3
pkgdesc="OpenGL compositing window manager. Includes friendly defaults, GWD theme selector and autostart for Xfce & MATE."
arch=('i686' 'x86_64')
url="https://launchpad.net/${_name}"
license=('GPL' 'LGPL' 'MIT')
depends=('boost' 'xorg-server' 'libxcomposite' 'startup-notification' 'librsvg' 'dbus' 'mesa' 'libxslt' 'fuse' 'glibmm' 'libxrender' 'libwnck3' 'pygtk' 'desktop-file-utils' 'pyrex' 'protobuf' 'metacity>=3.16.0' 'glu' 'libsm' 'dconf')
makedepends=('cmake' 'intltool')
optdepends=(
  'xorg-xprop: grab various window properties for use in window matching rules'
)
conflicts=('compiz' 'compiz09-manjaro-test' 'compiz-core-bzr' 'compiz-core-devel' 'compiz-core' 'compiz-gtk-standalone' 'compiz-xfce' 'compiz-mate'
           'compiz-core-mate' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-fusion-plugins-unsupported' 'compiz-decorator-gtk'
           'compiz-decorator-kde' 'libcompizconfig' 'compizconfig-python' 'compizconfig-backend-gconf' 'compiz-bcop' 'ccsm')
replaces=('compiz09-manjaro-test')
provides=("${_name}=${pkgver}")
source=("${url}/${_series}/${pkgver}/+download/${_name}-${pkgver}.tar.bz2"
        "focus-prevention-disable.patch"
        "gtk-extents.patch"
        "xfce4-notifyd-nofade.patch"
        "c++11.patch"
        "switcher-background.patch"
        "${pkgname}-defaults.patch"
        "${pkgname}.gschema.override"
        "compiz-gtk-decorator-theme-selector"
        "compiz-gtk-decorator-theme.desktop"
        "compiz-xfce-autostart"
        "compiz-xfce-autostart.desktop"
        "compiz-xfce-uninstall-helper"
        "compiz-xfce-uninstall-helper.desktop"
        "${pkgname}-decoratortheme"
        "${pkgname}-decoratortheme.desktop"
        "${pkgname}-mate-decoratortheme"
        "${pkgname}-mate-decoratortheme.desktop"
        "greybird-${_greybirdver}.tar.gz::https://github.com/shimmerproject/Greybird/archive/v${_greybirdver}.tar.gz")
sha256sums=('8917ac9e6dfdacc740780e1995e932ed865d293ae87821e7a280da5325daec80'
            'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
            '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
            '273aa79cb0887922e3a73fbbe97596495cee19ca6f4bd716c6c7057f323d8198'
            'eb8b432050d1eed9cb1d5f33d2645f81e2bdce2bf55d5cc779986bb751373a45'
            'e3125ed3a7e87a7d4bdaa23f1b6f654a02d0b050ad7a694ce9165fff2c6ff310'
            'cdc9eeaa213dbde3bceb2d0a73171ed319929b6a5146ff55fcd4f17df7b25d13'
            '443f85eae424e8aa993f786f3f90dcf92a5454f728f574a5311bb4747ac54288'
            '4f57ce60785f7b3dd18c7fc29edcfc9004688d2227bbff724ecb4db1200a5ac2'
            '0faaf9e9df28d2857108ccd0910d50ba631c34c2b1659b8860da8c2b552fc889'
            'd8205f6a9e69f904d17bce276941c10ad3d4a767be31d875a951ed7ddc26fd62'
            '8938f927c0f0ee5a9e83489dd66939588ebe4ad65bb59b483a54991421836a53'
            '1000b69dbbdfbf67d309e14f040e2b74ec6e1e25cd2316406ae15ae839e01f37'
            '2c225942951642b0afa6ee0ddc2f3bb312bf3c20e135736851f5772378823b11'
            '4dff6abcf5455c9f91866d031d3c41ed8ae4bd2ca0f4561f3afb8e2605f2176a'
            'dc7d2f58e1bfab312d056f02008faecc0bcd572f41065f1e09c077c62c3f65ca'
            '71d8a014695b23807e3c758e96045b2180c4d8d9ef501f1dded54f9232e1e1eb'
            'a992819fd34c4a9c256519c081e53047ef6527662ae989f4cb0e575fd1592115'
            '856f092ebd199a2a28346938a3dfe62613135ad886c25bbaeebd3a917de4c962')
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

  # Ensure xfce4 notifications are not 'double faded'
  patch -p1 -i "${srcdir}/xfce4-notifyd-nofade.patch"

  # Use C++11 (pre-requisite for switcher-background.patch)
  patch -p1 -i "${srcdir}/c++11.patch"

  # Allow user to change switcher background colour (fixes blank background for Emerald)
  patch -p1 -i "${srcdir}/switcher-background.patch"
  
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
    -DUSE_GCONF=Off \
    -DUSE_GSETTINGS=On \
    -DCOMPIZ_BUILD_TESTING=Off \
    -DCOMPIZ_WERROR=Off \
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,expo,grid,regex,animation,ccp" \
    -DCOMPIZ_DISABLE_PLUGIN_DBUS=On
  
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

  # Remove GConf schemas
  rm -rv "${pkgdir}/usr/share/gconf/"
  
  ## Manjaro stuff
  # Add Manjaro dconf/gsettings schema override file
  install -Dm644 "${srcdir}/${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
  # Make ccsm icon appear in Xfce settings manager
  sed -i 's|Categories=Settings;DesktopSettings;|Categories=Settings;DesktopSettings;X-XFCE-SettingsDialog;X-XFCE-OtherSettings;|' "${pkgdir}/usr/share/applications/ccsm.desktop"
  # Install GWD theme selector app
  install -Dm755 "${srcdir}/compiz-gtk-decorator-theme-selector" "${pkgdir}/usr/bin/compiz-gtk-decorator-theme-selector"
  install -Dm644 "${srcdir}/compiz-gtk-decorator-theme.desktop" "${pkgdir}/usr/share/applications/compiz-gtk-decorator-theme.desktop"
  # Place autostart/theme scripts/enablers
  install -Dm755 "${srcdir}/compiz-xfce-autostart" "${pkgdir}/usr/bin/compiz-xfce-autostart"
  install -Dm644 "${srcdir}/compiz-xfce-autostart.desktop" "${pkgdir}/etc/xdg/autostart/compiz-xfce-autostart.desktop"
  install -Dm755 "${srcdir}/compiz-xfce-uninstall-helper" "${pkgdir}/usr/share/compiz-xfce/compiz-xfce-uninstall-helper"
  install -Dm644 "${srcdir}/compiz-xfce-uninstall-helper.desktop" "${pkgdir}/usr/share/compiz-xfce/compiz-xfce-uninstall-helper.desktop"
  install -Dm755 "${srcdir}/${pkgname}-decoratortheme" "${pkgdir}/usr/bin/${pkgname}-decoratortheme"
  install -Dm644 "${srcdir}/${pkgname}-decoratortheme.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}-decoratortheme.desktop"
  install -Dm755 "${srcdir}/${pkgname}-mate-decoratortheme" "${pkgdir}/usr/bin/${pkgname}-mate-decoratortheme"
  install -Dm644 "${srcdir}/${pkgname}-mate-decoratortheme.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}-mate-decoratortheme.desktop"
  
  # greybird window decorations
  cd "${srcdir}/Greybird-${_greybirdver}"
  mkdir -p "${pkgdir}/usr/share/themes/compiz-xfce-greybird"
  cp LICENSE* "${pkgdir}/usr/share/themes/compiz-xfce-greybird"
  cp -r metacity-1/ "${pkgdir}/usr/share/themes/compiz-xfce-greybird"
  rm "${pkgdir}/usr/share/themes/compiz-xfce-greybird/metacity-1/metacity-theme-2.xml"
  sed -i 's|Greybird|compiz-xfce-greybird|' "${pkgdir}/usr/share/themes/compiz-xfce-greybird/metacity-1/metacity-theme-3.xml"
}

