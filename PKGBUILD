# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Stefan Husmann (https://aur.archlinux.org/account/haawda)
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ripperx-git
pkgver=3.0.3.r227.20260111.bc0b02a
pkgrel=1
pkgdesc="GTK2 program to rip Audio CDs and encode to FLAC, OGG and MP3."
arch=(
  'x86_64'
  'i686'
)
license=('GPL-2.0-only')
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
  'git'
  'autoconf>=2.60'
  'automake'
  'gdk-pixbuf2'
  'gettext>=0.15'
  'libtool'
)
conflicts=("ripperx")
provides=("ripperx=${pkgver}")
source=(
  "${pkgname%-git}::git+https://codeberg.org/thothix/ripperx.git"
  "ripperx_desktopfile-iconname.patch"
)
sha256sums=(
  'SKIP'
  'b529f04f4836e49dfd118522f7969486ba8eebb132f4e03bde2ac72630566c0e'
)
#options+=('!lto') # With LTO, running 'ripperX' fails with a Segmentation Fault.

prepare() {
  cd "${pkgname%-git}"

  #cp "${srcdir}/config.rpath_-_ripperx-stable-2.8.0" "config/config.rpath"

  local _patch
  for _patch in "${srcdir}/ripperx_desktopfile-iconname.patch"; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "${pkgname%-git}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${pkgname%-git}"
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
  cd "${pkgname%-git}"

  make DESTDIR="$pkgdir" install

  install -Dvm0644 ripperX.desktop "$pkgdir"/usr/share/applications/ripperX.desktop
  install -Dvm0644 src/xpms/ripperX-icon.xpm "$pkgdir"/usr/share/pixmaps/ripperX.xpm
  # Symlink icon into /usr/share/icons, since ripperx package version 2.8.0-5 had it there. To not break custom desktop setups.
  install -dvm0755 "$pkgdir"/usr/share/icons
  ln -svr "$pkgdir"/usr/share/pixmaps/ripperX.xpm "$pkgdir"/usr/share/icons/ripperX.xpm

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}"  git.log BUGS CHANGELOG.md FAQ README README.* TODO
  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
