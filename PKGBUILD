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
JIT=              # Enable native just-in-time compilation with libgccjit available
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
pkgname=emacs-lucid
pkgver=29.4
_pkgver_major=${pkgver/.*}
pkgrel=3
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version)"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=(
  acl
  alsa-lib
  cairo
  dbus
  fontconfig
  freetype2
  gdk-pixbuf2
  giflib
  glib2
  gmp
  gnutls
  gpm
  harfbuzz
  hicolor-icon-theme
  jansson
  lcms2
  libice
  libjpeg-turbo
  libotf
  libpng
  librsvg
  libsm
  libtiff
  libwebp
  libx11
  libxcb
  libxcomposite
  libxext
  libxfixes
  libxi
  libxinerama
  libxml2
  libxmu
  libxpm
  libxrandr
  libxrender
  libxt
  m17n-lib
  ncurses
  sqlite
  systemd-libs
  tree-sitter
  xaw3d
  xcb-util
  zlib
)
optdepends=(
  'lldb: For debugging with LLDB instead of GDB'
)
conflicts=(emacs)
provides=("emacs=$_pkgver_major")
options=(!strip)
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>
_source_url_prefix="ftp://ftp.gnu.org/gnu/emacs"
source=(${_source_url_prefix}/emacs-$pkgver.tar.xz
        ${_source_url_prefix}/emacs-$pkgver.tar.xz.sig)
b2sums=('825fd2665b6427dbc3cb618b40df2f71fa6b08883bdd07be6d8acf0039df2aeebd294e679e98f4c64a9dd9bdad93589fc7c176cf3860d4fb823fce23f7f2b3cd'
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
