# Maintainer: Jack Kamm <jackkamm AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr, emacs-git from the AUR

pkgname=emacs-lucid
pkgver=30.1
_pkgver_major=${pkgver/.*}
pkgrel=1
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
  libgccjit
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
replaces=(emacs-lucid-nativecomp)
options=(!strip)
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>
_source_url_prefix="ftp://ftp.gnu.org/gnu/emacs"
source=(${_source_url_prefix}/emacs-$pkgver.tar.xz
        ${_source_url_prefix}/emacs-$pkgver.tar.xz.sig)
b2sums=('ad502a2e15a04618f4766ec6e285739cb5bb6f19c5065c3aed03b3e50df590cee382a0331f382de6f13523f1362a4355f65961ce45504f7d33419ea6d04e326f'
        'SKIP')

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

  ./configure "${_conf[@]}"

  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
}
