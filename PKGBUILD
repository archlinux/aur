# Maintainer: Jack Kamm <jackkamm AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr, emacs-git from the AUR

pkgname=emacs-lucid
pkgver=31.1
_pkgver_major=${pkgver/.*}
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version)"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=(GPL-3.0-or-later)
depends=(
  acl
  alsa-lib
  attr
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
  zlib
)
optdepends=(
  'lldb: For debugging with LLDB instead of GDB'
)
conflicts=(emacs)
provides=("emacs=$_pkgver_major")
replaces=(emacs-lucid-nativecomp)
options=(!strip)
_source_url_prefix="ftp://ftp.gnu.org/gnu/emacs"
source=(
    ${_source_url_prefix}/emacs-$pkgver.tar.xz
    ${_source_url_prefix}/emacs-$pkgver.tar.xz.sig
)
b2sums=('c9f8cf37553c0e2913eb12d7e069735c23baca3b725332f17b4b4784d1e4987c9ae098dae669e65e49fa01d8b9a63e518b210640892216e0a9ae02e51f3d0581'
        'SKIP')
validpgpkeys=(
  '17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
  'CEA1DE21AB108493CC9C65742E82323B8F4353EE'  # Stefan Kangas <stefankangas@gmail.com>
  '8DC2487E51ABDD90B5C4753F0F56D0553B6D411B'  # Sean Whitton <spwhitton@spwhitton.name>
)

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
