# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima
pkgver=0.15.1
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
conflicts=('lima-bin')
provides=('rover')
license=('MIT')
makedepends=('go>=1.17' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lima-vm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1e8790257810b704462a03736ef4bb8a2a3a873b21cceba86afcd6b2b1a8482b')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd/limactl/
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 cmd/"${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
  install -Dm755 cmd/docker.lima "${pkgdir}"/usr/bin/docker.lima
  install -Dm755 cmd/nerdctl.lima "${pkgdir}"/usr/bin/nerdctl.lima
  install -Dm755 cmd/podman.lima "${pkgdir}"/usr/bin/podman.lima
  
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/limactl
  mkdir -p ${pkgdir}/usr/share/${pkgname}/examples/
  cp -rv examples/* ${pkgdir}/usr/share/${pkgname}/examples/
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
