# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=dojo
pkgver=0.13.3
pkgrel=1
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
sha256sums=('fc2c5a43ad8f1110dc94298e27f68fb3c9d55e3977635b6a09a27b62088c74a0')

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
