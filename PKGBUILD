# Maintainer: a821 < at mail dot de >
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sshesame-git
pkgver=0.0.39.r0.g0627956
pkgrel=1
pkgdesc="A fake SSH server that lets everyone in and logs their activity"
arch=('x86_64')
url='https://github.com/jaksi/sshesame'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("sshesame::git+https://github.com/jaksi/sshesame")
provides=('sshesame')
conflicts=('sshesame')
sha256sums=('SKIP')

pkgver() {
  cd "sshesame"
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  mkdir -p "sshesame/build"
}

build() {
  cd "sshesame"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "sshesame"
  install -Dm755 build/sshesame "${pkgdir}/usr/bin/sshesame"
  install -Dm644 -t "${pkgdir}/usr/share/doc/sshesame" README.md sshesame.yaml openssh.yaml
}
