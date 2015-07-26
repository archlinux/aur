# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Iven Hsu <ivenvd AT gmail>

_name=compiz
pkgname=compiz-manjaro
_series=0.9.12
pkgver=${_series}.1
pkgrel=5
_greybirdver=1.5.3
pkgdesc="OpenGL compositing window manager. Includes friendly defaults, GWD theme selector and autostart for Xfce & MATE."
arch=('i686' 'x86_64')
url="https://launchpad.net/${_name}"
license=('GPL' 'LGPL' 'MIT')
depends=('boost' 'xorg-server' 'libxcomposite' 'startup-notification' 'librsvg' 'dbus' 'mesa' 'libxslt' 'fuse' 'glibmm' 'libxrender'
         'libwnck3' 'pygtk' 'desktop-file-utils' 'pyrex' 'protobuf' 'metacity>=3.16.0' 'glu' 'libsm' 'dconf')
makedepends=('cmake' 'intltool')
#optdepends=()
conflicts=('compiz' 'compiz09-manjaro-test' 'compiz-core-bzr' 'compiz-core-devel' 'compiz-core' 'compiz-gtk-standalone' 'compiz-xfce' 'compiz-mate'
           'compiz-core-mate' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-fusion-plugins-unsupported' 'compiz-decorator-gtk'
           'compiz-decorator-kde' 'libcompizconfig' 'compizconfig-python' 'compizconfig-backend-gconf' 'compiz-bcop' 'ccsm')
replaces=('compiz09-manjaro-test')
provides=("${_name}=${pkgver}" "${_name}-core-devel=${pkgver}")
source=("${url}/${_series}/${pkgver}/+download/${_name}-${pkgver}.tar.bz2"
        "set-gwd-default.patch"
        "focus-prevention-disable.patch"
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
        "greybird-${_greybirdver}.tar.gz::https://github.com/shimmerproject/Greybird/archive/v${_greybirdver}.tar.gz"
        "metacity-3_16.patch")
sha1sums=('4ccbc1fc3728ded896f14e11db121bf771cec59f'
          'be585a68eacf93a1064ea914a927623c3e774b95'
          'b74ab025a89419c23d6f01c41e414281e1a2382f'
          '1996419be45490410887385975cbbebfa15a539a'
          'e54a97ebda168c507457feee5e5085bd2ae98546'
          '45b98fd5e238a595e3a60741106193321bebdf64'
          'f7e1544f8e6987f86c1b2c3e69b70d2accf95bc9'
          'b428f171ab8b34b236aed9954867102bdd33f9da'
          'a790b6556695b06af4eff910e7dc409aab85f9a8'
          '4b4fa287ea72f8b8eccdf4254dfe2174d9b41b2a'
          '847d498050e96fbb1a43c29a0f98b70a74319203'
          '36b8c620e00cfd7d9099c02589cab6906f483e53'
          '56146a4fc169f46504eaa86ca240de34c4bb1fd8'
          '8eff3fedffb543960ebfc19b15e95d7f7a90ee50'
          '890b02696130b8275104aaea110b9beb3a162dce'
          'ebc447a9c13b6c8563fec789d290354b3d7c8230'
          '699ca81225749cc9a1b8906f5c5d30fdb649b5ef')
install="${pkgname}.install"

prepare() {
  cd "${_name}-${pkgver}"

  # Set gtk-window-decorator as default in the Window Decoration plugin
  patch -p1 -i "${srcdir}/set-gwd-default.patch"

  # Set focus prevention level to off which means that new windows will always get focus
  patch -p1 -i "${srcdir}/focus-prevention-disable.patch"
  
  # Manjaro defaults
  patch -p1 -i "${srcdir}/${pkgname}-defaults.patch"

  find -type f \( -name 'CMakeLists.txt' -or -name '*.cmake' \) -exec sed -e 's/COMMAND python/COMMAND python2/g' -i {} \;
  find compizconfig/ccsm -type f -exec sed -e 's|^#!.*python|#!/usr/bin/env python2|g' -i {} \;
  
  # Fix Python build directory with CMake 3.2
  sed -i 's/${PY_BUILD_DIR}/lib/g' compizconfig/ccsm/CMakeLists.txt
  
  # Metacity 3.16 compatibility
  patch -Np1 -i "${srcdir}/metacity-3_16.patch"
}

build() {
  cd "${_name}-${pkgver}"
  
  export PYTHON="/usr/bin/python2"
  
  mkdir build; cd build
  
  cmake .. \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
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

