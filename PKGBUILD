# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Stefan Husmann (https://aur.archlinux.org/account/haawda)
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ripperx-git
pkgver=3.1.1.r249.20261028.2571d88
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
  'glib2>=2.6'
  'glibc'
  'gtk2>=2.6'
  'libgcc_s.so'
  'libgdk_pixbuf-2.0.so'
  'libpango-1.0.so'
  'libstdc++.so'
  'taglib>=1.9.1'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'gdk-pixbuf2'
  'gettext>=0.15'
  'libgcc'
  'libtool'
  'libstdc++'
  'pango'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
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
  local _CFLAGSADDITIONS
  _CFLAGSADDITIONS=" -fpermissive"
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cmake \
    -S ripperx -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISABLE_DEPRECATED=OFF \
    -DENABLE_NLS=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Fix icon name:
  mv -v "${pkgdir}"/usr/share/pixmaps/ripperX-icon.xpm "${pkgdir}"/usr/share/pixmaps/ripperX.xpm

  cd "${pkgname%-git}"
  # Install git log -- other files are already installed into '/usr/share/doc/ripperX/' by upstream install routine:
  install -Dvm0644 -t "${pkgdir}/usr/share/doc/ripperX"          git.log
  # Install license:
  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
