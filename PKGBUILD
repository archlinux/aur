# Maintainer: Jack Kamm <jackkamm AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr from the AUR

pkgname=emacs-lucid
pkgver=28.2
_pkgver_major=${pkgver/.*}
pkgrel=2
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version)"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=(
  alsa-lib
  dbus
  gmp
  gnutls
  gpm
  hicolor-icon-theme
  jansson
  lcms2
  libacl.so
  libfontconfig.so
  libfreetype.so
  libgdk_pixbuf-2.0.so
  libgif.so
  libgio-2.0.so
  libglib-2.0.so
  libgobject-2.0.so
  libharfbuzz.so
  libice
  libjpeg.so
  libncursesw.so
  libotf
  libpng
  librsvg
  libsm
  libsystemd.so
  libtiff.so
  libxfixes
  libxinerama
  libxml2.so
  libxrandr
  m17n-lib
  xaw3d
  zlib
)
optdepends=(desktop-file-utils)
conflicts=(emacs)
provides=("emacs=$_pkgver_major")
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>
_source_url_prefix="ftp://ftp.gnu.org/gnu/emacs"
source=(${_source_url_prefix}/emacs-$pkgver.tar.xz
        ${_source_url_prefix}/emacs-$pkgver.tar.xz.sig)
sha256sums=('ee21182233ef3232dc97b486af2d86e14042dbb65bbc535df562c3a858232488'
            'SKIP')

build() {
  cd "$srcdir"/emacs-$pkgver

 ./configure \
      --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --localstatedir=/var \
      --with-x-toolkit=lucid --with-xft --with-xaw3d \
      --without-gconf --without-gsettings \
      --with-modules \
      --program-transform-name='s/^ctags$/ctags.emacs/'

  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
}
