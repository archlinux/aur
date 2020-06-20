# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sshesame-git
pkgver=r23.b74f93f
pkgrel=2
pkgdesc="A fake SSH server that lets everyone in and logs their activity"
arch=('x86_64')
url='https://github.com/jaksi/sshesame'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("sshesame::git+https://github.com/jaksi/sshesame")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/sshesame"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/sshesame"
  mkdir -p build/
}

build() {
  cd "${srcdir}/sshesame"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/sshesame"
  install -Dm755 build/sshesame "${pkgdir}/usr/bin/sshesame"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}