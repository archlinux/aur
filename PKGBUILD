# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Dr-Noob <peibolms at gmail dot com>

_gitname=gpufetch
_pkgname="${_gitname}-nocuda"
pkgname="${_pkgname}-git"
pkgver=0.25+9.r122.20231020.57caadf
pkgrel=2
pkgdesc="Simple yet fancy GPU architecture fetching tool. Intel backend only."
arch=(
  'x86_64'
  'i686'
)
provides=(
  "${_gitname}=${pkgver}"
  "${_pkgname}=${pkgver}"
  "${_gitname}-git=${pkgver}"
)
conflicts=(
  "${_gitname}"
  "${_pkgname}"
  "${_gitname}-git"
)
url="https://github.com/Dr-Noob/gpufetch"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'pciutils'
)
makedepends=(
  'binutils'
  'cmake'
  'gcc'
  'gifsicle'
  'git'
  'gzip'
  'make'
  'zopflipng-parallel'
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

pkgver () {
  cd "${srcdir}/${_gitname}"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

  local _gif
  printf '%s\n' "  > Size-optimising image files ..."
  zopflipng-parallel -m -- "${_gitname}"/pictures/*.png
  for _gif in "${_gitname}"/pictures/*.gif; do
    gifsicle -O3 "${_gif}" -o "${_gif}.optimised.gif"
    mv -f "${_gif}.optimised.gif" "${_gif}"
  done
  if [ -e "${_gitname}/gpufetch.1.gz" ]; then
    gunzip "${_gitname}/gpufetch.1.gz"
  fi
  gzip -9 "${_gitname}/gpufetch.1"

  _cmake_config_option=()

  cmake -S "${_gitname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_COLOR_MAKEFILE=ON \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_VERBOSE_MAKEFILE=OFF \
    -DCMAKE_SKIP_INSTALL_RPATH=OFF \
    -DCMAKE_SKIP_RPATH=OFF \
    -Wno-dev \
    "${_cmake_config_options[@]}"

  make -C build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" make -C build install

  cd "${_gitname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_gitname}"           git.log README.md CONTRIBUTING.md
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_gitname}/pictures"  pictures/*

  install -Dvm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dvm644 "gpufetch.1.gz"  "${pkgdir}/usr/share/man/man1/gpufetch.1.gz"
}
