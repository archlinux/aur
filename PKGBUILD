# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
_basename=rcon-cli
pkgname=${_basename}-git
pkgver=r98.94ea14f
pkgrel=1
pkgdesc="RCON client for executing queries on game server. "
arch=('x86_64')
url="https://github.com/gorcon/rcon-cli"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_basename}")
conflicts=("${_basename}")
replaces=()
backup=()
options=()
source=('git+https://github.com/gorcon/rcon-cli.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${_basename}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_basename}"
  mkdir -p dist
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd "$srcdir/${_basename}"
  go build -v -o dist ./cmd/gorcon/main.go
}

package() {
  cd "$srcdir/${_basename}"
  install -Dm755 dist/main "$pkgdir"/usr/bin/rcon
}
