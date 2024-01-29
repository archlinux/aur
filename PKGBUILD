# Maintainer: John Luebs <jkl>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

_srcname=emacs
pkgname=emacs-wayland-webkit
pkgver=29.2
pkgrel=1
pkgdesc='The extensible, customizable, self-documenting real-time display editor with native compilation, PGTK and WebKit (xwidgets) enabled'
arch=('x86_64')
url='https://www.gnu.org/software/emacs/emacs.html'
license=('GPL3')
provides=(emacs)
conflicts=(emacs)
depends=(
  gmp
  gnutls
  jansson
  lcms2
  libacl.so
  libasound.so
  libdbus-1.so
  libfontconfig.so
  libfreetype.so
  libgdk-3.so
  libgdk_pixbuf-2.0.so
  libgif.so
  libgio-2.0.so
  libglib-2.0.so
  libgobject-2.0.so
  libgpm.so
  libgtk-3.so
  libharfbuzz.so
  libice
  libjpeg.so
  libncursesw.so
  libotf
  libpango-1.0.so
  libpng
  librsvg-2.so
  libsm
  sqlite libsqlite3.so
  libsystemd.so
  libtiff.so
  libtree-sitter.so
  libwebp.so
  libwebpdemux.so
  libxfixes
  libxml2.so
  m17n-lib
  zlib
  libgccjit
  libwebkit2gtk-4.0.so
)
makedepends=(libgccjit)
source=(https://ftp.gnu.org/gnu/emacs/${_srcname}-${pkgver}.tar.xz{,.sig})
b2sums=('d634fbd94a2fde4824daf5d4d44d6f9e9693900af9ebeda75488fd4d14b7f6cd22e0c9fc15a4c73b4b90843aa782dbd698ba0d40c50465eb4b902105cd9e2c2c'
        'SKIP')
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>

build() {
  local _confflags="--sysconfdir=/etc \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-tree-sitter \
    --localstatedir=/var \
    --with-cairo \
    --disable-build-details \
    --with-harfbuzz \
    --with-libsystemd \
    --with-modules"

  export ac_cv_lib_gif_EGifPutExtensionLast=yes

  cd ${_srcname}-${pkgver}
  ./configure \
    --with-pgtk \
    --with-native-compilation=aot \
    --with-xwidgets \
    $_confflags
  make bootstrap
}

package() {
  cd ${_srcname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "${pkgdir}"/usr/share/emacs/${pkgver} -exec chown root:root {} \;
}
