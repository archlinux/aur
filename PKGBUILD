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
provides=("nhost")
conflicts=("nhost")
replaces=()
options=()
source=("${_pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  export OS=linux
  export VERSION=$(echo $pkgver | sed -E -e 's/^([0-9]+\.[0-9]+\.[0-9]+).*/\1/')
  echo $VERSION

  export LDFLAGS="-s -w -X main.Version=v${VERSION}"

  export CGO_ENABLED="0"
  go build -buildmode=pie -trimpath -ldflags="${LDFLAGS}" -mod=vendor -modcacherw -o build/nhost .
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 build/nhost "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
