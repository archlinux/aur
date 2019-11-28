# Maintainer: n0vember <n0vember at half-9 dot net>
_pkgname=envconsul
pkgname=${_pkgname}-git
_pkgver=0.9.1
pkgver=v${_pkgver}
pkgrel=3
pkgdesc="Launch a subprocess with environment variables using data from @hashicorp Consul and Vault."
arch=('any')
url="https://github.com/hashicorp/envconsul.git"
license=('MPL2')
depends=()
makedepends=('go' 'git')
source=("https://github.com/hashicorp/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
  umask 022
  chmod -R u+w .
  mkdir -p ${_pkgname}-${_pkgver}/gopath
  export GOPATH="${srcdir}/${_pkgname}-${_pkgver}/gopath"
  export PATH="$PATH:$GOPATH/bin"
}

build() {
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  cd ${_pkgname}-${_pkgver}
  make dev
  unset GOFLAGS
}

package() {
  install -Dm755 ${_pkgname}-${_pkgver}/gopath/bin/envconsul "$pkgdir"/usr/bin/envconsul
  install -m644 -D ${_pkgname}-${_pkgver}/LICENSE "$pkgdir/usr/share/licenses/envconsul/LICENSE"
}
