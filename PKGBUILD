# Maintainer:  dreieck
# Contributor: Torge Matthies
# Contributor: Filipe Laíns (FFY00)

_pkgname='libratbag'
_pkgvariantsuffix='-nosystemd'
_vcssuffix='-git'
pkgname="${_pkgname}${_pkgvariantsuffix}${_vcssuffix}"
pkgver=0.17+284.r2463.20230717.a4eb09ea
pkgrel=2
pkgdesc='A DBus daemon to configure gaming mice. Compiled without systemd dependencies. Latest git version.'
arch=(
  'i686'
  'x86_64'
)
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=(
  'glib2'
  'libelogind'
  'libevdev'
  'libudev.so'
  'libunistring'
  'json-glib'
  'python'
  'python-evdev'
  'python-gobject'
)
optdepends=(
  'linux>=5.2: Linux>=5.2 is required for Logitech wireless devices.'
)
makedepends=(
  'meson'
  'swig'
  'git'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=(
  'check'
  'valgrind'
  'python-gobject'
  'python-lxml'
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}${_vcssuffix}=${pkgver}"
  "${_pkgname}${_pkgvariantsuffix}=${pkgver}"
  "ratbagd=${pkgver}"
  "ratbagd${_vcssuffix}=${pkgver}"
  "ratbagd${_pkgvariantsuffix}=${pkgver}"
  "liblur=${pkgver}"
  "liblur${_vcssuffix}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "ratbagd"
  "liblur"
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  sed -i 's|sphinx-build3|sphinx-build|' doc/meson.build
}



pkgver() {
  cd "${srcdir}/${_pkgname}"

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
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
  cd build

  local check
  if (( CHECKFUNC )); then
    check=true
  else
    check=false
  fi

  arch-meson .. \
    -Dsystemd=false \
    -Dlogind-provider=elogind \
    -Ddbus-group=input \
    -Ddocumentation=true \
    -Dtests="$check"

  ninja
}

check() {
  cd "${srcdir}/${_pkgname}"

  cd build

  meson test --no-rebuild
}

package() {
  cd "${srcdir}/${_pkgname}"

  cd build

  DESTDIR="${pkgdir}" ninja install

  # Install documentation
  install -dvm755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership doc/html "$pkgdir"/usr/share/doc/$pkgname

  cd "${srcdir}/${_pkgname}"

  for _docfile in git.log README.md TODO; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_docfile}"
  done
  for _licensfile in COPYING; do
    install -Dvm644 "${_licensfile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensfile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_licensfile}"
  done
}

