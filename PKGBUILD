##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

_outputname=ProxyBridge

# shellcheck disable=SC2034
pkgname=proxybridge
# shellcheck disable=SC2034
pkgdesc="Proxifier Alternative to redirect any TCP and UDP traffic to HTTP/Socks5 proxy (Unofficial PKGBUILD)"
# shellcheck disable=SC2034
pkgver=4.1.0
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
makedepends=('clang' 'bpf')
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
url="https://github.com/InterceptSuite/ProxyBridge"
# shellcheck disable=SC2034
backup=('etc/proxybridge')

# shellcheck disable=SC2034
source=("${url}/archive/v${pkgver}_Linux.zip")
# shellcheck disable=SC2034
sha256sums=('90e7e08af44ba96c1a1f5ea938c3ff3e84fef0daec5b44d205ed2ff3b67beffc')

prepare() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_outputname}-${pkgver}_Linux" || {
    msg "Failed to cd into ${srcdir}/${_outputname}-${pkgver}_Linux"
    return 1
  }

  cd "Linux" || {
    msg "Failed to cd into Linux srcdir"
    return 1
  }

  # Fix the build pipeline complaint:
  #
  # binary audit: 2 check(s) failed
  # Audit failed: the binaries are not portable/hardened enough to ship.
  sed -i -E '/CFLAGS="-O2 -fPIC /{/-fcf-protection/!s|CFLAGS="-O2 -fPIC |CFLAGS="-O2 -fPIC -fcf-protection=full -fstack-protector-strong -fstack-clash-protection |}' "./src/Makefile"
  if grep -E 'CFLAGS="-O2 -fPIC ' "./src/Makefile" | grep -qv -- '-fcf-protection'; then
    msg "Failed to add hardening flags to the bundled libbpf/libelf/zlib builds"
    return 1
  fi
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_outputname}-${pkgver}_Linux" || {
    msg "Failed to cd into ${srcdir}/${_outputname}-${pkgver}_Linux"
    return 1
  }

  # Install license file to documentation location
  # do this BEFORE we cd into Linux :)
  # shellcheck disable=SC2154
  install -D --mode=644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

  cd "Linux" || {
    msg "Failed to cd into Linux srcdir"
    return 1
  }

  # Set the cache instead of using ${HOME}/.cache
  export LIBBPF_CACHE="${srcdir}/libbpf-cache"

  # Run build
  ./build.sh || {
    msg "Failed to build"
    return 1
  }

  # Script
  # shellcheck disable=SC2154
  install -D --mode=755 "output/${_outputname}" "${pkgdir}/usr/bin/${_outputname}"

  # symlink to an easier cli name
  ln -s "${_outputname}" "${pkgdir}/usr/bin/${pkgname}"

  # GUI
  # shellcheck disable=SC2154
  install -D --mode=755 "output/${_outputname}GUI" "${pkgdir}/usr/bin/${_outputname}GUI"

  # symlink to an easier cli name
  ln -s "${_outputname}GUI" "${pkgdir}/usr/bin/${pkgname}-gui"

  # Libfile
  install -D --mode=755 "output/lib${pkgname}.so" "${pkgdir}/usr/lib/lib${pkgname}.so"

  # Create configuration directory (empty by default)
  mkdir -p "${pkgdir}/etc"
  mkdir --mode=700 "${pkgdir}/etc/${pkgname}"

  # Save Linux README to documentation
  install -D --mode=644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
