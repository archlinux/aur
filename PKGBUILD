# Maintainer: Nikhil Iyer <iyer.h.nikhil at gmail dot com>

_pkgname="nhost"
pkgname=$_pkgname-git # '-bzr', '-git', '-hg' or '-svn'
pkgrel=1
pkgver=1.29.5.r0.f225ffa0
pkgdesc="Used to set up a local development environment with Nhost. This environment will automatically track database migrations and Hasura metadata."
arch=('x86_64')
url="https://github.com/nhost/cli"
license=("MIT")
depends=("docker" "curl")
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
options=()
source=("${_pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
  go build -o build/nhost .
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 build/nhost "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
