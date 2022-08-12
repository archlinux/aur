# Maintainer: Dreieck
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: M Rawash <mrawash@gmail.com>


_pkgname='xf86-input-wacom'
_pkgvariantsuffix='-nosystemd'
_vcssuffix='-git'
pkgname="${_pkgname}${_pkgvariantsuffix}${_vcssuffix}"
pkgver=1.1.0+2.r2287.20220719.18ed769
pkgrel=1
pkgdesc="X.Org Wacom tablet driver. Without systemd dependency. Git checkout."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/linuxwacom/xf86-input-wacom"
license=('GPL2')
depends=(
  'libudev.so'
  'libxi'
  'libxinerama'
  'libxrandr'
)
makedepends=(
  'git'
  'xorg-server-devel'
)
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}${_pkgvariantsuffix}=${pkgver}"
  "${_pkgname}${_vcssuffix}=${pkgver}"
)
source=(
  "${_pkgname}::git+https://github.com/linuxwacom/xf86-input-wacom.git"  # Official upstream source
  # "${_pkgname}::git+https://github.com/whot/xf86-input-wacom.git#branch=wip/detect-tool-changes"  # Contains fixes for eraser issue with lenovo m14t: https://github.com/linuxwacom/xf86-input-wacom/issues/186, see https://github.com/linuxwacom/xf86-input-wacom/pull/188
)
sha256sums=(
  'SKIP'
  # 'SKIP'
)


prepare() {
  cd "${srcdir}/${_pkgname}"

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^xf86-input-wacom-||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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

  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared \
    --enable-fuzz-interface \
    --enable-unit-tests

  make
}

check() {
  cd "${srcdir}/${_pkgname}"

  make check
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 -v AUTHORS "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -D -m644 -v README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 -v GPL "${pkgdir}/usr/share/licenses/${pkgname}/GPL2"
}
