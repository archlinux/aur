# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Stefan Husmann (https://aur.archlinux.org/account/haawda)
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartholian (https://aur.archlinux.org/account/Barthalion)

pkgname=ripperx
pkgver=3.0.2
pkgrel=1
pkgdesc="GTK2 program to rip Audio CDs and encode to FLAC, OGG and MP3."
arch=(
  'x86_64'
  'i686'
)
#url="http://ripperx.sourceforge.net/"
url="https://codeberg.org/thothix/ripperx"
depends=(
  'gcc-libs'
  'glib2>=2.6'
  'glibc'
  'gtk2>=2.6'
  'libgdk_pixbuf-2.0.so'
  'taglib>=1.9.1'
)
makedepends=(
  'autoconf>=2.60'
  'automake'
  'gdk-pixbuf2'
  'gettext>=0.15'
  'libtool'
)
license=('GPL-2.0-only')
source=(
  "${pkgname}-v${pkgver}.tar.gz::https://codeberg.org/thothix/ripperx/archive/${pkgver}.tar.gz"
  "ripperx_desktopfile-iconname.patch"
)
sha256sums=(
  '7461cdd3eda85ada3ed0e0059abe37c2b475e8986cd033434fde7601cacc377c'
  'b529f04f4836e49dfd118522f7969486ba8eebb132f4e03bde2ac72630566c0e'
)
options+=('!lto') # With LTO, running 'ripperX' fails with a Segmentation Fault.

prepare() {
  cd "$pkgname"

  local _patch
  for _patch in "${srcdir}/ripperx_desktopfile-iconname.patch"; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done
}

build() {
  cd "$pkgname"
  local _CFLAGSADDITIONS
  _CFLAGSADDITIONS=" -fpermissive"
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --enable-nls \
    --disable-debug

  make -j1
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  install -Dvm0644 ripperX.desktop "$pkgdir"/usr/share/applications/ripperX.desktop
  install -Dvm0644 src/xpms/ripperX-icon.xpm "$pkgdir"/usr/share/pixmaps/ripperX.xpm
  # Symlink icon into /usr/share/icons, since ripperx package version 2.8.0-5 had it there. To not break custom desktop setups.
  install -dvm0755 "$pkgdir"/usr/share/icons
  ln -svr "$pkgdir"/usr/share/pixmaps/ripperX.xpm "$pkgdir"/usr/share/icons/ripperX.xpm

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${pkgname}"  BUGS CHANGELOG.md FAQ README README.* TODO
  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
