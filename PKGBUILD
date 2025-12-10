# Maintainer:  dreieck

## Based on: 'hidapi-git' PKGBUILD version 0.10.1.r18.g6fcb0bb, by
# Contributor: Richard Steinmetz <steinmetz.richard@googlemail.com>

_gitname="hidapi"
_pkgname="hidapi-testgui"
pkgname="${_pkgname}-git"
pkgver=0.15.0+4.r681.20251125.a758717
_pkgmajorver="$(awk -F. '{print $1}' <<<"${pkgver}")"
pkgrel=1
epoch=0
pkgdesc="'hidapi-hidraw-testgui' and 'hidapi-libusb-testgui' for hidapi."
arch=(
  "x86_64"
  "i686"
  "aarch64"
  "armv6h"
  "armv7h"
)
url='https://github.com/libusb/hidapi'
license=(
  'GPL-3.0-or-later'
  'BSD-3-Clause'
  'LicenseRef-HIDAPI'
)
depends=(
  'fox'
  # 'hidapi'
)
makedepends=(
  'autoconf' # for 'autoreconf'
  'automake'
  'bash'
  'git'
  'make'
  #'systemd'
  #'systemd-libs'
  'libusb'
  'libtool' # for 'libtoolize'
  'libudev.so'
)
optdepends=(
  'libusb: for the libusb backend -- hidapi-libusb.so'
  'libudev.so: for the hidraw backend -- hidapi-hidraw.so'
  "libhidapi-hidraw.so=${_pkgmajorver}: To use 'hidapi-hidraw-testgui'."
  "libhidapi-libusb.so=${_pkgmajorver}: To use 'hidapi-libusb-testgui'."
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_gitname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_gitname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver_versionfile="$(< 'VERSION')"
  _ver_gittags="$(git describe --tags | sed -E -e 's|^hidapi-||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _ver="${_ver_gittags}"
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
  cd "${srcdir}/${_gitname}"

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --enable-testgui

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" install

  rm -fv "${pkgdir}/usr"/share/doc/"${_gitname}"/LICENSE*

  rm -fv "${pkgdir}/usr"/include/hidapi/{hidapi.h,hidapi_libusb.h}
  rm -fv "${pkgdir}/usr"/lib/{libhidapi-hidraw.so,libhidapi-hidraw.so.*,libhidapi-libusb.so,libhidapi-libusb.so.*,libhidapi-hidraw.la,libhidapi-libusb.la}
  rm -fv "${pkgdir}/usr"/lib/pkgconfig/{hidapi-hidraw.pc,hidapi-libusb.pc}
  rm -fv "${pkgdir}/usr"/share/doc/"${_gitname}"/{AUTHORS.txt,README.md}

  rmdir "${pkgdir}/usr"/{share/doc/${_gitname},include/hidapi,include,lib/pkgconfig,lib}

  # install -Dvm0755 -t "${pkgdir}/usr/bin" testgui/{hidapi-hidraw-testgui,hidapi-libusb-testgui}

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log AUTHORS.txt HACKING.txt README.md
  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt LICENSE-bsd.txt LICENSE-gpl3.txt LICENSE-orig.txt
}
