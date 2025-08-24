# Maintainer:  dreieck
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>


_pkgname=gtkam
pkgname="${_pkgname}-git"
pkgver=1.1+3.r960.20250812.3526c71
pkgrel=1
pkgdesc="A GTK frontend for libgphoto2. Latest git checkout."
url="http://gphoto.sourceforge.net/proj/gtkam"
arch=('i686' 'x86_64')
depends=(
  'glibc'
  'libatk-1.0.so'      # 'at-spi2-core'
  'libcairo.so'        # 'cairo'
  'libfontconfig.so'   # 'fontconfig'
  'libfreetype.so'     # 'freetype2'
  'libgio-2.0.so'      # 'glib2'
  'libglib-2.0.so'     # 'glib2'
  'libgobject-2.0.so'  # 'glib2'
  'libgdk-x11-2.0.so'  # 'gtk2'
  'libgtk-x11-2.0.so'  # 'gtk2'
  'libharfbuzz.so'     # 'harfbuzz'
  'libpangoft2-1.0.so'   # 'pango'
  'libpangocairo-1.0.so' # 'pango'
  'libpango-1.0.so'      # 'pango'
  'libexif.so'
  'libexif-gtk'
  'libgphoto2.so'
  'libgdk_pixbuf-2.0.so'
)
makedepends=(
  # Source preparation:
  'autoconf'
  'automake'
  'gettext'
  'libtool'
  'git'
  # Build time:
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  #'gimp'  # See comment in `prepare()`: GIMP plugin is disabled since not working with GIMP 3.x.
  'glib2'
  'gtk2'
  'harfbuzz'
  'intltool'
  'libexif>=0.3.2'
  'libgphoto2>=2.5.0'
  'pango'
  'zopfli'
)
optdepends=(
  #'gimp: To use the GIMP plugin provided with this package.'  # See comment in `prepare()`: GIMP plugin is disabled since not working with GIMP 3.x.
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
license=('GPL-2.0-or-later')
source=("${_pkgname}::git+https://github.com/gphoto/gtkam.git")
sha256sums=(
  'SKIP'
)

_CFLAGSADDITIONS='-Wno-deprecated-declarations -Wno-unused-but-set-variable -Wno-pointer-sign -Wno-format -Wno-unused-but-set-variable'
CFLAGS+=" ${_CFLAGSADDITIONS}"
export CFLAGS


prepare() {
  cd "${srcdir}/${_pkgname}"

  ## See https://askubuntu.com/a/27679/413199 for the preparation command chain.
  ## libtoolize --force
  ## aclocal
  ## autoheader
  ## automake --force-missing --add-missing
  ## autoconf

  # See https://askubuntu.com/a/215378/413199 for the single autoreconf call.
  autoreconf -vif

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --without-bonobo \
    --without-gnome \
    --disable-scrollkeeper \
    --without-gimp

    # Currently (2025-08-10), with gimp version 3.0.4, even with `--with-gimp` it is configured without GIMP. See https://github.com/gphoto/gtkam/issues/13. So we disable GIMP plugin for now.
    # Works only with GIMP 2.x, see https://github.com/gphoto/gtkam/issues/13#issuecomment-3172686233.

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^gtkam-||' -e 's|-release||' -e 's|\-g[0-9a-f]*$||' | tr '_-' '.+')"
  # _ver="$(grep -E '^[[:space:]]*VERSION[[:space:]]*=' Makefile | awk -F= '{print $2}' | sed -E -e 's|#.*$||' | tr -d '[[:space:]]')"
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

  cd "${srcdir}/${_pkgname}"

  make

  local _png
  for _png in `find -type f -name '*.png'`; do
    zopflipng -m -y "${_png}" "${_png}"
  done
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log AUTHORS ChangeLog CHANGES INSTALL NEWS README TODO
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
