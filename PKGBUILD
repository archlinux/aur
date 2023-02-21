# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: async_andrew (https://aur.archlinux.org/account/async_andrew)

_pkgname=tray-control
pkgname="${_pkgname}-git"
pkgdesc="Simple CLI tool to show items in systray and activate them. Build on top of DBus."
url="https://github.com/andrewerf/tray-control"
epoch=1
pkgver=r10.20221118.08a0ff9
pkgrel=1
license=(
  'GPL3'
)
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
depends=(
  'fmt'
  'sdbus-cpp'
  'systemd-libs'
)
makedepends=(
  'cmake'
  'git'
  'icu'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
replaces=(
  "${_pkgname}<=r1.ad6af59" # There was a package 'tray-control' which was wrongly named this way, but should have been named 'tray-control-git'. This package here is the direct replacement, that fixes this issue.
)
source=(
  "${_pkgname}::git+${url}.git"
  'git+https://github.com/Neargye/magic_enum.git'
  'git+https://github.com/jarro2783/cxxopts.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver(){
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

prepare(){
  cd "${srcdir}/${_pkgname}"

  mkdir -p build

  git submodule init
  git config submodule.magic_enum.url 3rdparty/magic_enum
  git config submodule.cxxopts.url 3rdparty/cxxopts
  git submodule update --init

  git log > "${srcdir}/git.log"
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCXXOPTS_BUILD_EXAMPLES=ON \
    -DCXXOPTS_BUILD_TESTS=ON \
    -DCXXOPTS_USE_UNICODE_HELP=ON \
    ..

  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  DESTDIR="${pkgdir}"/ cmake --install .

  cd "${srcdir}/${_pkgname}"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
