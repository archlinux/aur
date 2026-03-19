# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="termux-elf-cleaner"
pkgver=3.0.1
pkgrel=3
pkgdesc="Utility to remove unused ELF sections causing warnings"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/termux/${pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'cmake>=3.25'
  'git'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}?signed"
)
sha256sums=('182e1988326907c62b9b5d765d9303882e15fea5eaa940157f8e4c83c8f9ba5a')
validpgpkeys=(
  '2C7F29AE97891F6419A9E2CDB0076E490B71616B' # Henrik Grimler <grimler@termux.org>
)

build() {
  local cmake_arguments=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
  )
 
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_arguments[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local ctest_exclude_regex="dynamic-section-*"
  local ctest_arguments=(
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" "${ctest_arguments[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  
  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
