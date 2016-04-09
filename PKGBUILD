# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>

pkgname=compiz
pkgver=0.9.12.2
_pkgseries=0.9.12
pkgrel=11
pkgdesc="Composite manager for Aiglx and Xgl, with plugins and CCSM"
arch=('i686' 'x86_64')
url="https://launchpad.net/compiz"
license=('GPL' 'LGPL' 'MIT')
depends=('boost' 'xorg-server' 'libxcomposite' 'startup-notification' 'librsvg' 'dbus' 'mesa' 'libxslt' 'fuse' 'glibmm' 'libxrender' 'libwnck3' 'pygtk' 'desktop-file-utils' 'pyrex' 'protobuf' 'metacity>=3.16.0' 'glu' 'libsm' 'dconf')
makedepends=('cmake' 'intltool')
optdepends=(
  'xorg-xprop: grab various window properties for use in window matching rules'
)
conflicts=('compiz-core')
source=("https://launchpad.net/${pkgname}/${_pkgseries}/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2"
        "focus-prevention-disable.patch"
        "gtk-extents.patch"
        "xfce4-notifyd-nofade.patch"
        "c++11.patch"
        "switcher-background.patch"
        "cmake3.patch"
        "cube-texture.patch"
	"marco-in-mate.patch")
sha256sums=('8917ac9e6dfdacc740780e1995e932ed865d293ae87821e7a280da5325daec80'
            'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
            '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
            '273aa79cb0887922e3a73fbbe97596495cee19ca6f4bd716c6c7057f323d8198'
            'eb8b432050d1eed9cb1d5f33d2645f81e2bdce2bf55d5cc779986bb751373a45'
            'e3125ed3a7e87a7d4bdaa23f1b6f654a02d0b050ad7a694ce9165fff2c6ff310'
            'e5016fd62f9c9659d887eeafd556c18350615cd6d185c8ffa08825465890c5e0'
            '81780f8c56f5b27b09394ae9ed59d10ae50c58f9ade445e9f85d7c2a00445f7e'
            '0d7474aee60c1a482cf26d5d0be6ec2e1b1067fa1d601fdf4aa19a71b07e41d3')
install=${pkgname}.install

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix decorator start command
  sed -i 's/exec \\"${COMPIZ_BIN_PATH}compiz-decorator\\"/exec \/usr\/bin\/compiz-decorator/g' plugins/decor/decor.xml.in

  # Set focus prevention level to off which means that new windows will always get focus
  patch -Np1 -i "${srcdir}/focus-prevention-disable.patch"

  # Use Python 2
  find -type f \( -name 'CMakeLists.txt' -or -name '*.cmake' \) -exec sed -e 's/COMMAND python/COMMAND python2/g' -i {} \;
  find compizconfig/ccsm -type f -exec sed -e 's|^#!.*python|#!/usr/bin/env python2|g' -i {} \;

  # Fix incorrect extents for GTK+ tooltips, csd etc
  patch -Np1 -i "${srcdir}/gtk-extents.patch"

  # Ensure xfce4 notifications are not 'double faded'
  patch -Np1 -i "${srcdir}/xfce4-notifyd-nofade.patch"

  # Use C++11 (pre-requisite for switcher-background.patch)
  patch -Np1 -i "${srcdir}/c++11.patch"

  # Allow user to change switcher background colour (fixes blank background for Emerald)
  patch -Np1 -i "${srcdir}/switcher-background.patch"

  # Get rid of the cmake policy warning messages
  patch -Np1 -i "${srcdir}/cmake3.patch"

  # Fix off-center cube cap pictures
  patch -Np1 -i "${srcdir}/cube-texture.patch"
  
  # Use the Marco gsettings in MATE session (commits 3997+4002)
  patch -p1 -i "${srcdir}/marco-in-mate.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

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
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,regex,animation,wall,ccp" \
    -DCOMPIZ_DISABLE_PLUGIN_DBUS=On

    make
}

package() {
  cd "${pkgname}-${pkgver}/build"
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

  # Remove GConf schemas
  rm -rv "${pkgdir}/usr/share/gconf/" 
}
