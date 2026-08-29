# Maintainer: bkuri <aur+nzbget-git@bkuri.com>
# Contributor: selfdenial <selfdenial@pm.me>
# Contributor: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Jan Holthuis <holthuis.jan@googlemail.com>

pkgbase=nzbget-git
pkgdesc="Download from Usenet using .nzb files (testing release)"
pkgname=nzbget-git
pkgrel=1
pkgver=27.0.r2782.25dcf185

arch=('x86_64')
install=nzbget.install
license=('GPL-2.0-only')
options=('debug' '!lto')
url="https://github.com/nzbgetcom/nzbget"

conflicts=('nzbget' 'nzbget-systemd')
provides=('nzbget' 'nzbget-systemd')

depends=(
  'libxml2'
  'openssl'
)

makedepends=(
  'boost'
  'cmake>=3.13'
  'git'
)

optdepends=(
  'p7zip: for unpacking archives'
  'python: for running scripts'
  'unrar: for unpacking archives'
)

source=(
  "${pkgbase}::git+https://github.com/nzbgetcom/nzbget.git#branch=develop"
  "nzbget.service"
)

sha256sums=('SKIP'
            'e92d2d09e56930475c9f28641a3326a17aa187834e1bd6328a65b6ed7cc25e99')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  
  # Ensure we have the latest git data
  git fetch --all --prune
  
  local _pkgver=$(grep -oP 'set\(VERSION "\K[^"]+' CMakeLists.txt)
  local _rev=$(git rev-list --count HEAD)
  local _hash=$(git rev-parse --short=8 HEAD)
  
  printf "%s.r%s.%s" "${_pkgver}" "${_rev}" "${_hash}"
}

prepare() {
  cd "${srcdir}/${pkgbase}"
  mkdir -p build
  
  # Ensure clean build environment
  export HOME="${srcdir}"
  export XDG_CACHE_HOME="${srcdir}/.cache"
  export XDG_DATA_HOME="${srcdir}/data"
  export XDG_CONFIG_HOME="${srcdir}/config"
}

build() {
  cd "${srcdir}/${pkgbase}/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_POLICY_DEFAULT_CMP0167=NEW \
    -DDEBUG_SYMBOLS=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=ON

  cmake --build . -j$(nproc)
}

check() {
  cd "${srcdir}/${pkgbase}/build"
  ctest --output-on-failure -j$(nproc)
}

package_nzbget-git() {
  cd "${srcdir}/${pkgbase}/build"
  DESTDIR="$pkgdir" cmake --install .
  
  # Install systemd service
  install -Dm644 "${srcdir}/nzbget.service" "${pkgdir}/usr/lib/systemd/system/nzbget.service"
  
  # Create required directories
  install -dm755 "${pkgdir}"/var/lib/nzbget
  install -dm755 "${pkgdir}"/usr/share/nzbget
  
  # Install documentation and config
  cd "${srcdir}/${pkgbase}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 nzbget.conf "${pkgdir}/usr/share/nzbget/nzbget.conf"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Cleanup build artifacts
  find "${pkgdir}" -type d -name ".git" -exec rm -rf {} +
  find "${pkgdir}" -type f -name ".gitignore" -delete

  rm -rf "${pkgdir}/usr/src"
  rm -rf "${pkgdir}/home"
  
}

