# Maintainer: Jack Kamm <jackkamm AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr, emacs-git from the AUR

################################################################################
# Assign "YES" to the variable you want enabled; empty or any other value
# for NO.
# =================================================
#
################################################################################
JIT="YES"         # Enable native just-in-time compilation with libgccjit available
                  # in core.
                  #
                  # To compile all site-lisp on demand (repos/AUR packages,
                  # ELPA, MELPA, whatever), add
                  #    (setq native-comp-deferred-compilation t)
                  # to your .emacs file.
                  # 
                  # And to keep the eln cache clean add 
                  #    (setq native-compile-prune-cache t)
                  # to delete old versions.

################################################################################

################################################################################
pkgname=emacs-lucid-nativecomp
pkgver=29.2
_pkgver_major=${pkgver/.*}
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version with native compilation)"
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
  #libwebp.so
  libwebpdemux.so
  libx11
  libxcb
  libxcomposite
  libxext
  libxfixes
  libxi
  libxinerama
  libxml2.so
  libxmu
  libxpm
  libxrandr
  libxrender
  libxt
  m17n-lib
  xaw3d
  xcb-util
  zlib
)
optdepends=(
  'lldb: For debugging with LLDB instead of GDB'
)
conflicts=(emacs)
provides=("emacs=$_pkgver_major")
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>
_source_url_prefix="ftp://ftp.gnu.org/gnu/emacs"
source=(${_source_url_prefix}/emacs-$pkgver.tar.xz
        ${_source_url_prefix}/emacs-$pkgver.tar.xz.sig)
b2sums=('d634fbd94a2fde4824daf5d4d44d6f9e9693900af9ebeda75488fd4d14b7f6cd22e0c9fc15a4c73b4b90843aa782dbd698ba0d40c50465eb4b902105cd9e2c2c'
        'SKIP')
################################################################################

################################################################################

if [[ $JIT == "YES" ]]; then
  depends+=( 'libgccjit' );
fi
################################################################################

################################################################################
build() {
  cd "$srcdir"/emacs-$pkgver

  local _conf=(
    --sysconfdir=/etc
    --prefix=/usr
    --libexecdir=/usr/lib
    --with-tree-sitter
    --localstatedir=/var
    --disable-build-details
    --with-modules
    --with-x-toolkit=lucid
    --without-gconf
    --without-gsettings
    --program-transform-name='s/^ctags$/ctags.emacs/'
  )

################################################################################

  if [[ $JIT == "YES" ]]; then
    _conf+=( '--with-native-compilation=aot' );
  fi

################################################################################

  ./configure "${_conf[@]}"

  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
}

################################################################################
