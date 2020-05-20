# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault
pkgver=0.12.6
pkgrel=2
pkgdesc="Encrypt/Decrypt using SSH keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssh-vault/ssh-vault/archive/${pkgver}.tar.gz")
sha256sums=('f8823fd1c859e48d8b46b0425e6be8160b14350cdb877e00a3ed7cd753ed669d')

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