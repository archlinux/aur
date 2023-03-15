# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault
pkgver=0.12.10
pkgrel=1
pkgdesc="Encrypt/Decrypt using SSH keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssh-vault/ssh-vault/archive/${pkgver}.tar.gz")
sha256sums=('8dd05033aed9a00cb30ab2b454b5709987799e187f298b5817c8f2c8e37ecaf6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go get -d -v ./cmd/...
  go build -o build ./cmd/...
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/ssh-vault "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
