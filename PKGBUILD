# Maintainer: Jack Kamm <jackkamm AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr from the AUR

pkgname=emacs-lucid
pkgver=29.1
_pkgver_major=${pkgver/.*}
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version)"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=(
  cairo
  gmp
  gnutls
  hicolor-icon-theme
  jansson
  lcms2
  libacl.so
  libasound.so
  libdbus-1.so
  libfontconfig.so
  libfreetype.so
  libgdk_pixbuf-2.0.so
  libgif.so
  libgio-2.0.so
  libglib-2.0.so
  libgobject-2.0.so
  libgpm.so
  libharfbuzz.so
  libice
  libjpeg.so
  libncursesw.so
  libotf
  libpng
  librsvg-2.so
  libsm
  sqlite libsqlite3.so
  libsystemd.so
  libtiff.so
  libtree-sitter.so
  libwebp.so
  libwebpdemux.so
  libx11
  libxcb
  libxext
  libxfixes
  libxinerama
  libxml2.so
  libxmu
  libxpm
  libxrandr
  libxrender
  libxt
  m17n-lib
  xaw3d
  zlib
)
conflicts=(emacs)
provides=("emacs=$_pkgver_major")
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>
_source_url_prefix="ftp://ftp.gnu.org/gnu/emacs"
source=(${_source_url_prefix}/emacs-$pkgver.tar.xz
        ${_source_url_prefix}/emacs-$pkgver.tar.xz.sig)
b2sums=('5bec8fd7c63c04b93b2ad87c12c48373930c1b3c6984d139938ad1eb692af76417dc5494057225a04f77ce4797958056aa3522f50e3b0565ef5f060bb15f5402'
        'SKIP')

build() {
  cd "$srcdir"/emacs-$pkgver

 ./configure \
     --sysconfdir=/etc \
     --prefix=/usr  \
     --libexecdir=/usr/lib \
     --with-tree-sitter \
     --localstatedir=/var \
     --disable-build-details \
     --with-modules \
     --with-x-toolkit=lucid \
     --without-gconf \
     --without-gsettings \
     --program-transform-name='s/^ctags$/ctags.emacs/'

  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
}
