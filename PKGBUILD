# Maintainer: Zile995 <stefan.zivkovic995@gmail.com>

pkgname=zswap-cli-git
_pkgname="${pkgname%-git}"
pkgver=0.9.1.r14.g224fdea
pkgrel=2
pkgdesc="Command-line tool to control ZSwap Linux kernel module"
arch=('x86_64')
url="https://github.com/xvitaly/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('boost' 'fmt' 'sdbus-cpp' 'systemd')
makedepends=('cmake' 'gcc' 'git' 'ninja' 'pandoc')
optdepends=('semver: Semantic versioning for C++')
backup=('etc/zswap-cli/zswap-cli.conf')
source=("${_pkgname}::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  sed -i \
    's/CMAKE_INSTALL_SBINDIR/CMAKE_INSTALL_BINDIR/g' \
    "${srcdir}/${_pkgname}/CMakeLists.txt"

  cmake \
    -G Ninja \
    -B "${_pkgname}/build" \
    -S "${_pkgname}" \
    -DBUILD_MANPAGE:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_BUILD_TYPE:STRING='RelWithDebInfo' \
    -Wno-dev

  cmake --build "${_pkgname}/build"
}

package() {
  DESTDIR="${pkgdir}/" cmake --install "${_pkgname}/build"

  # license
  install -D -m644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
