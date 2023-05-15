# Maintainer:
# Contributor: Robert Brzozowski <robson75@linux.pl>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au
# Contributor: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>

pkgname=compiz
pkgver=0.9.14.2
pkgrel=2
pkgdesc="Composite manager for Aiglx and Xgl, with plugins and CCSM"
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
)
makedepends=(
  'boost'
  'cmake'
  'intltool'
  'cython'
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
  "ccsm=$pkgver"
  "compiz-bcop=$pkgver"
  "compiz-core=$pkgver"
  "compiz-plugins-extra=$pkgver"
  "compiz-plugins-main=$pkgver"
  "compizconfig-python=$pkgver"
  "libcompizconfig=$pkgver"
)
source=(
  "https://launchpad.net/${pkgname}/${pkgver:0:6}/${pkgver}/+download/${pkgname}-${pkgver}.tar.xz"
  "focus-prevention-disable.patch"
  "gtk-extents.patch"
  "reverse-unity-config.patch"
  "screenshot-launch-fix.patch"
  "no-compile-gschemas.patch"
)
sha256sums=(
  'cfa061e93b032275ff9e7041f582a8f6d5ae271cf8a89e6bc74e3d3635999d3c'
  'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b'
  '16ddb6311ce42d958505e21ca28faae5deeddce02cb558d55e648380274ba4d9'
  '6ec9c04540ca1649c687d9ab2c8311caea7075831e2cffe719ec7958c9ebab7b'
  '89ee91a8ea6b1424ef76661ea9a2db43412366aacddc12d24a7adf5e04bfbc61'
  '4ab3277da201314b3f65e30128bc30704ddee584fdbbfc8d0d83c7e0de91fa9a'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

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
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build
  cd build

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
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,regex,animation,wall,ccp"

    make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
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
  install -Dm644 "$srcdir/$pkgname-$pkgver"/{COPYING,COPYING.GPL,COPYING.LGPL,COPYING.MIT} \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
