# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: E5ten (https://aur.archlinux.org/account/E5ten)

_pkgname='tinyalsa'
pkgname="${_pkgname}-git"
pkgver=2.0.0+45.r582.20220803.4fbaeef
pkgrel=3
pkgdesc='A small library to interface with ALSA in the Linux kernel.'
arch=('x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('custom')
depends=('glibc')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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
  CFLAGS+=' -Wno-error=sign-compare'
  export CFLAGS
  cmake -S "${srcdir}/${_pkgname}" -B "${srcdir}/build" \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DTINYALSA_BUILD_EXAMPLES=ON \
    -DTINYALSA_BUILD_UTILS=ON \
    -DTINYALSA_USES_PLUGINS=ON
  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  for _docfile in "${srcdir}/${_pkgname}"/{OWNERS,README.md}; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  install -D -v -m644 "${srcdir}/${_pkgname}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
