# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=writeas-cli
pkgname=${_pkgname}-git
pkgver=v1.2_2_ge05f5bd94323
pkgrel=3
pkgdesc="Write.as command line interface"
arch=('x86_64')
url='https://write.as/apps/cli'
license=('GPL3')
depends=('glibc')
makedepends=('go')
conflicts=('writeas-cli')
provides=('writeas-cli')
source=("git+https://github.com/writeas/writeas-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
	cd ${_pkgname}
	rm -f go.mod
	go mod init github.com/writeas/writeas-cli
}

build() {
	cd ${_pkgname}
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		./cmd/writeas/
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}/writeas" "${pkgdir}/usr/bin/writeas"
}
