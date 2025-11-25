# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima
pkgver=2.0.2
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
conflicts=('lima-bin')
provides=('lima')
license=('Apache')
makedepends=('go>=1.18' 'git' 'gzip' 'tar' 'gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lima-vm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('51e0461c719c67c87310a1df4c55afe83f8379c246cd66c1c38773785f7994c8')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make native
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
  install -Dm644 _output/share/lima/lima-guestagent.Linux-x86_64.gz \
	${pkgdir}/usr/share/lima/${pkgname}-guestagent.Linux-x86_64.gz
  cp -rv templates/* ${pkgdir}/usr/share/${pkgname}/templates/
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp -rv docs/* ${pkgdir}/usr/share/doc/${pkgname}/
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
