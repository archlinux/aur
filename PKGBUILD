# Maintainer: fuero <fuerob@gmail.com>
pkgname=ls-lint
# renovate: datasource=github-releases depName=loeffel-io/ls-lint
pkgver=2.1.0
pkgrel=1
pkgdesc='directory and filename linter'
arch=('x86_64')
_repo_prefix='github.com/loeffel-io'
_repo_name="${pkgname%-git}"
url="https://${_repo_prefix}/${_repo_name}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17d694a4d2b69f890d674278eec3858eb659f13572e8ccbabd969865d7faae61')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
conflicts=("${_repo_name}-git")
provides=("${_repo_name}")

clean() {
  echo rm -rf ${srcdir}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -x -v \
    -ldflags "-extldflags '${LDFLAGS}' -X main.commit=$(git rev-parse --short HEAD) -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)" \
    -o "${_repo_name}.bin" \
    ./cmd/ls_lint  
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 "${_repo_name}.bin" "${pkgdir}/usr/bin/${_repo_name}"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
