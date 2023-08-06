# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy [dot] lecocq [at] protonmail [dot] com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

_pkgmainbranch=emacs
pkgbase=emacs28
pkgname=(emacs28 emacs28-nativecomp emacs28-nox)
pkgver=28.2
pkgrel=2
arch=('x86_64')
url='https://www.gnu.org/software/emacs/emacs.html'
license=('GPL3')
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
  libsystemd.so
  libtiff.so
  libxfixes
  libxml2.so
  m17n-lib
  zlib
)
makedepends=(libgccjit)
source=(https://ftp.gnu.org/gnu/emacs/${_pkgmainbranch}-${pkgver}.tar.xz{,.sig})
b2sums=('a7e4990658b5e7306510f8dded93aaf0b82cdd9306df8b786526d038c3249ef9579287075f2235eb01a71ae1699db555254f137b86ab2d2305b45895053df552'
        'SKIP')
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>

prepare() {
  cp -ar ${_pkgmainbranch}-${pkgver} ${pkgbase}-${pkgver}-nativecomp
  cp -ar ${_pkgmainbranch}-${pkgver} ${pkgbase}-${pkgver}-nox
}

build() {
  local _confflags="--sysconfdir=/etc \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-cairo \
    --with-harfbuzz \
    --with-libsystemd \
    --with-modules"

  export ac_cv_lib_gif_EGifPutExtensionLast=yes

  cd ${_pkgmainbranch}-${pkgver}
  ./configure $_confflags \
    --with-x-toolkit=gtk3
  make

  cd ../${pkgbase}-${pkgver}-nativecomp
  ./configure \
    --with-x-toolkit=gtk3 \
    --with-native-compilation \
    $_confflags
  make NATIVE_FULL_AOT=1 bootstrap

  cd ../${pkgbase}-${pkgver}-nox
  ./configure \
    --without-x \
    --without-sound \
    $_confflags
  make
}

package_emacs28() {
  pkgdesc='The extensible, customizable, self-documenting real-time display editor'
  provides=('emacs' 'emacs28')
  conflicts=('emacs' 'emacs28')

  cd ${_pkgmainbranch}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "${pkgdir}"/usr/share/emacs/${pkgver} -exec chown root:root {} \;
}

package_emacs28-nativecomp() {
  pkgdesc='The extensible, customizable, self-documenting real-time display editor with native compilation enabled'
  depends+=(libgccjit)
  provides=('emacs' 'emacs28')
  conflicts=('emacs' 'emacs28')

  cd ${pkgbase}-${pkgver}-nativecomp
  make DESTDIR="${pkgdir}" install

  # remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "${pkgdir}"/usr/share/emacs/${pkgver} -exec chown root:root {} \;
}

package_emacs28-nox() {
  pkgdesc='The extensible, customizable, self-documenting real-time display editor without X11 support'
  depends=(
    gmp
    gnutls
    hicolor-icon-theme
    jansson
    lcms2
    libacl.so
    libdbus-1.so
    libgpm.so
    libncursesw.so
    libsystemd.so
    libxml2.so
    zlib
  )
  provides=('emacs' 'emacs28')
  conflicts=('emacs' 'emacs28')

  cd ${pkgbase}-${pkgver}-nox
  make DESTDIR="${pkgdir}" install

  # remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "${pkgdir}"/usr/share/emacs/${pkgver} -exec chown root:root {} \;
}
