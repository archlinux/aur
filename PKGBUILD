# Maintainer: Amin Vakil <info at aminvakil dot com>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>

_pkgname=trivy
pkgname=trivy-git
pkgver=r461.e517bef
pkgrel=1
pkgdesc="A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI"
arch=("x86_64" "i686")
url="https://github.com/aquasecurity/trivy"
license=("Apache")
depends=("device-mapper")
optdepends=("rpm: RHEL/CentOS based image support")
makedepends=("go" "btrfs-progs" "git")
provides=('trivy')
conflicts=('trivy')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/cmd/trivy"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOEXPERIMENT="jsonv2"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 cmd/trivy/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
