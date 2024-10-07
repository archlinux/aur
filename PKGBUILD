# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: nfnty

pkgname=docker-compose-git
pkgver=2.29.7.r19.g407d825
pkgrel=1
pkgdesc="Define and run complex applications using Docker"
arch=(x86_64)
url="https://github.com/docker/compose"
license=(Apache-2.0)
depends=(glibc)
makedepends=(git go)
provides=(docker-compose)
conflicts=(docker-compose)
source=("docker-compose::git+https://github.com/docker/compose.git")
sha512sums=('SKIP')

pkgver() {
  cd "docker-compose"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "docker-compose/cmd"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "docker-compose/cmd"
  install -D cmd "${pkgdir}/usr/bin/docker-compose"

  #install -D --mode=644 contrib/completion/bash/docker-compose "${pkgdir}/usr/share/bash-completion/completions/docker-compose"
}
