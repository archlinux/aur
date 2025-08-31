# Maintainer: Jack Kamm <jackkamm AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr, emacs-git from the AUR

pkgname=emacs-lucid
pkgver=30.2
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
b2sums=('9163ba6bfab1010a156c669ac085ad363545d73e3ffac21c710b14b618df61a4c6a80a50fd3fa81d852c2ccace5080e614b679606fa584e28509f99ad6196784'
        'SKIP')

build() {
  cd "$srcdir"/emacs-$pkgver

  local _conf=(
    --sysconfdir=/etc
    --prefix=/usr
    --libexecdir=/usr/lib
    --localstatedir=/var
    --disable-build-details
    --with-cairo
    --with-harfbuzz
    --with-libsystemd
    --with-modules
    --with-native-compilation=aot
    --with-tree-sitter
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
  chown -R root:root "${pkgdir}/usr/share/emacs/${pkgver}"
}
