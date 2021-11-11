# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=falco-git
pkgname=(falco-git falco-dkms-git)
pkgver=0.30.0.r0.gbb811332
pkgrel=1
pkgdesc="Cloud native runtime security. Build from source (unstable)."
arch=(x86_64)
url="https://falco.org/"
license=(Apache)
makedepends=(cmake git c-ares jq grpc yaml-cpp)
checkdepends=()
optdepends=()
backup=()
options=()
source=("git+https://github.com/falcosecurity/falco.git")
sha256sums=('SKIP')

# Kris Nóva PGP Key
#validpgpkeys=('F5F9B56417B7F2CAC1DEC2E372BB115B4DDD8252')

pkgver() {
  cd "falco"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "falco"
  [[ -d build ]] || mkdir build
}

build() {
  cd "falco/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package_falco-git() {
    install -d "${pkgdir}/etc/falco"
    cp -rv falco-${pkgver}-${arch}/etc/falco/* "${pkgdir}/etc/falco"

    install -d "${pkgdir}/usr/share/falco"
    cp -rv falco-${pkgver}/usr/share/falco/* "${pkgdir}"/usr/share/falco

  make DESTDIR="${pkgdir}" install
}

package_falco-dkms-git() {
  depends=(dkms linux-headers)
    install -d "${pkgdir}/usr/src/falco-${pkgver}"
    cp -rv falco-${pkgver}-${arch}/usr/src/falco-${_commit}/* "${pkgdir}/usr/src/falco-${pkgver}"
}
