# Maintainer: engineering <engineering@egdaemon.com>
pkgname=egd
pkgver=0.0.1781203994000
pkgrel=1
pkgdesc='egd ci/cd/batch processing tooling'
url='https://github.com/egdaemon/eg'
arch=('x86_64')
license=('AGPL')
provides=('egd')
conflicts=('egd')
depends=(
  'podman'
  'aardvark-dns'
  'duckdb'
)
makedepends=(
  'go'
  'btrfs-progs'
)

source=("${pkgname}::git+https://github.com/egdaemon/eg.git")
sha1sums=('SKIP')

build() {
  echo "BUILD: eg ${pkgver} -- src(${srcdir}) build(${BUILDDIR})"
  echo "PWD  : ${PWD}"
  echo "USER : $(whoami)"

  install -d -m 755 ${srcdir}/${pkgname}/.dist/linux/ ${srcdir}/.dist
  cp -r ${srcdir}/${pkgname}/.dist/linux/* ${srcdir}/.dist
  cat ${srcdir}/${pkgname}/.dist/linux/usr/share/eg/Containerfile | EG_VERSION=${pkgver} envsubst '$EG_VERSION' | tee ${srcdir}/.dist/usr/share/eg/Containerfile
  GOBIN="${srcdir}/.dist/usr/bin" go install -C ${pkgname} ./cmd/eg
  # tree ${srcdir}/.dist/
}

package() {
  echo "PACKAGE INITIATED ${pkgdir} ${PWD} ${bindir}"
  cp -r ${srcdir}/.dist/* ${pkgdir}
  # tree ${pkgdir}
}
