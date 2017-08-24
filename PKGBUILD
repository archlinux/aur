# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=drone-cli-git
pkgver=20170812
pkgrel=1
pkgdesc='Drone CLI'
arch=('any')
url='http://docs.drone.io/cli-installation/'
license=('Apache')
makedepends=('go')
source=("git+https://github.com/drone/drone-cli.git")
sha256sums=('SKIP')
provides=('drone-cli')
conflicts=('drone-cli')

_gitname='drone-cli'

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  export GOPATH="${srcdir}/${_gitname}"
  cd "${_gitname}"
  mkdir -p vendor/github.com/drone/drone-cli
  ln -fsT "${srcdir}/${_gitname}/drone/main.go" \
    main.go
  ln -fsT "${srcdir}/${_gitname}/drone" \
    vendor/github.com/drone/drone-cli/drone
  ln -fsT vendor src
  go build -ldflags "-X main.version=${pkgver}" -o drone-cli
}

package() {
  cd "${_gitname}"
  # binary
  install -D -m755 drone-cli "${pkgdir}/usr/bin/drone"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
