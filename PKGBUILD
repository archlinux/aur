# Maintainer:  <none>
# Contributor: dreieck
# Contributor: Richard Steinmetz <steinmetz.richard@googlemail.com>

_gitname="hidapi"
_pkgname="hidapi"
pkgname="${_pkgname}-git"
pkgver=0.14.0+40.r665.20241003.750bf20
pkgrel=1
epoch=1
pkgdesc='Simple library for communicating with USB and Bluetooth HID devices. Latest git checkout.'
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
depends=()
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
  "${_pkgname}-testgui: For a GUI programme using this library"
  'libusb: for the libusb backend -- hidapi-libusb.so'
  'libudev.so: for the hidraw backend -- hidapi-hidraw.so'
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
    --disable-testgui

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="$pkgdir/" install

  rm -fv "${pkgdir}/usr"/share/doc/"${_gitname}"/LICENSE*

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log AUTHORS.txt HACKING.txt README.md
  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt LICENSE-bsd.txt LICENSE-gpl3.txt LICENSE-orig.txt
}
