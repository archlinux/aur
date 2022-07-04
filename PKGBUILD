# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=dojo
pkgver=0.11.0
pkgrel=4
pkgdesc="A tool to keep environment as code. Dojo helps to compile code and run other operations in Docker containers. Containerize your development and operations environment."
arch=('x86_64')
url="https://github.com/kudulab/dojo"
depends=('bash' 
         'docker' 
         'docker-compose'
)
conflicts=('dojo-bin')
provides=('dojo')
license=('Apache-2')
makedepends=('go>=1.17' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kudulab/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('928c42721fb8542034509ad91f49c467a7d34da462a3a3cf98feced45463e8e7')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.VERSION=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'"
}

 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
