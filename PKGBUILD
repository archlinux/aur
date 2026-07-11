# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname='es3crypt-oss'
pkgname="${_pkgname}-git"
pkgver=1.0+31.r33.20230211.bdacbfe
pkgrel=1
pkgdesc='Easy Save 3 save file decryption/encryption library with CLI.'
arch=(
  'x86_64'
  'i686'
  'aarch64'
  'armv8h'
)
url="https://gitlab.com/niansa/es3crypt-oss"
license=('GPL-3.0-or-later')
depends=(
  'crypto++'
  'glibc'
  'libgcc_s.so'
  'libstdc++.so'
)
makedepends=(
  'cmake'
  'git'
  'libgcc'
  'libstdc++'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

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
  cd "${srcdir}"

  # As of 2026-07-11, -DES3CRYPT_BUILD_WEB=ON fails to build; see https://gitlab.com/niansa/es3crypt-oss/-/work_items/2.
  # -DES3CRYPT_WEB_LAYOUT="${srcdir}/${_pkgname}/layouts/Phasmophobia.cppi" \
  cmake -S "${_pkgname}" -B build \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DES3CRYPT_BUILD_CLI=ON \
    -DES3CRYPT_BUILD_WEB=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
    -Wno-dev

  cmake --build build
}

package() {
  cd "${srcdir}/build"

  #DESTDIR="${pkgdir}" cmake --install build # There is no 'install' target, have to install manually.
  install -Dvm755 -t "${pkgdir}/usr/bin" es3crypt-cli
  install -Dvm755 -t "${pkgdir}/usr/lib" libes3crypt.so

  cd "${srcdir}/${_pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/include" es3crypt.hpp
  #install -Dvm644 -t "${pkgdir}/usr/include" layout.hpp # Only install this if we build web

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
