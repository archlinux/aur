# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima
pkgver=0.20.1
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
conflicts=('lima-bin')
provides=('lima')
license=('Apache')
makedepends=('go>=1.18' 'git' 'gzip' 'tar' 'gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lima-vm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3e8b16572a23d69ad16ef72f15b1697c35b5eacaf6c1f0943b6ebfb8bfaf1fd7')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make minimal
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 _output/bin/limactl "${pkgdir}"/usr/bin/limactl
  
  install -Dm755 cmd/apptainer.lima "${pkgdir}"/usr/bin/apptainer.lima
  install -Dm755 cmd/docker.lima "${pkgdir}"/usr/bin/docker.lima
  install -Dm755 cmd/kubectl.lima "${pkgdir}"/usr/bin/kubectl.lima
  install -Dm755 cmd/nerdctl.lima "${pkgdir}"/usr/bin/nerdctl.lima
  install -Dm755 cmd/podman.lima "${pkgdir}"/usr/bin/podman.lima
  
  install -Dm755 cmd/lima "${pkgdir}"/usr/bin/lima

  mkdir -p ${pkgdir}/usr/share/${pkgname}/templates/
  install -Dm644 _output/share/lima/lima-guestagent.Linux-$(uname -m | sed -e s/arm64/aarch64/) \
	${pkgdir}/usr/share/lima/${pkgname}-guestagent.Linux-$(uname -m | sed -e s/arm64/aarch64/)
  cp -rv examples/* ${pkgdir}/usr/share/${pkgname}/templates/
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
