##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_gitname=proxybridge
# shellcheck disable=SC2034
pkgname=proxybridge-git
# shellcheck disable=SC2034
pkgdesc="Proxifier Alternative to redirect any TCP and UDP traffic to HTTP/Socks5 proxy (Unofficial PKGBUILD)"
# shellcheck disable=SC2034
pkgver=r290.51d9b17
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('libnetfilter_queue' 'libnfnetlink' 'gtk3' 'pkg-config')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('proxybridge')
# shellcheck disable=SC2034
conflicts=('proxybridge')
# shellcheck disable=SC2034
license=('MIT')
url="https://github.com/InterceptSuite/ProxyBridge.git"
# shellcheck disable=SC2034
backup=('etc/proxybridge')

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}#branch=master")
# shellcheck disable=SC2034
sha256sums=('SKIP')

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
    msg "Failed to cd into ${srcdir}/${_gitname}"
    return 1
  }

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
    msg "Failed to cd into ${srcdir}/${_gitname}"
    return 1
  }

  cd "Linux" || {
    msg "Failed to cd into Linux srcdir"
    return 1
  }

  # Run build
  ./build.sh || {
    msg "Failed to build"
    return 1
  }

  # Script
  # shellcheck disable=SC2154
  install -D --mode=755 output/ProxyBridge "${pkgdir}/usr/bin/ProxyBridge"

  # symlink to an easier cli name
  ln -s ProxyBridge "${pkgdir}/usr/bin/proxybridge"

  # GUI
  # shellcheck disable=SC2154
  install -D --mode=755 output/ProxyBridgeGUI "${pkgdir}/usr/bin/ProxyBridgeGUI"

  # symlink to an easier cli name
  ln -s ProxyBridgeGUI "${pkgdir}/usr/bin/proxybridge-gui"

  # Libfile
  install -D --mode=755 output/libproxybridge.so "${pkgdir}/usr/lib/libproxybridge.so"

  # Create configuration directory (empty by default)
  mkdir -p "${pkgdir}/etc"
  mkdir --mode=755 "${pkgdir}/etc/proxybridge"
}
