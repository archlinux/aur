# Contributor: dreieck (https://aur.archlinux.org/account/dreieck/)
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='xf86-input-joystick'
pkgname="${_pkgname}-git"
pkgver=1.6.4+1.r299.20231001.c8d19c8
pkgrel=1
pkgdesc="X.Org input driver that translates joystick input to mouse and keyboard events. (Do not use for games with native joystick support or XI2 applications. See manpage.) Latest git checkout."
arch=(
  'i686'
  'x86_64'
)
url="https://gitlab.freedesktop.org/xorg/driver/xf86-input-joystick"
license=(
  'LicenseRef-custom'
)
depends=(
  'glibc'
)
makedepends=(
  'xorg-server-devel'
  'xorgproto'
  'X-ABI-XINPUT_VERSION>=24.2'
  'X-ABI-XINPUT_VERSION<25'
)
provides=()
conflicts=(
  'X-ABI-XINPUT_VERSION<24.2'
  'X-ABI-XINPUT_VERSION>=25'
)
source=(
  "${_pkgname}::git+https://gitlab.freedesktop.org/xorg/driver/xf86-input-joystick.git"
  '50-joystick.conf'
)
sha256sums=(
  'SKIP'
  '20f922c666491465493022ff7022bdac67691fcd03e9c746da6abb17ceddebf1'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  NOCONFIGURE=1 ./autogen.sh

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^xf86-input-joystick-||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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
    --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  install -Dvm644 "${srcdir}/50-joystick.conf" "${pkgdir}/usr/share/doc/${_pkgname}/example/xorg.conf.d/50-joystick.conf"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md

  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
