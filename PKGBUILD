# Maintainer: Nikhil Iyer <iyer.h.nikhil at gmail dot com>

_pkgname="nhost"
pkgname=$_pkgname-git # '-bzr', '-git', '-hg' or '-svn'
pkgrel=1
pkgver=1.34.9
pkgdesc="Used to set up a local development environment with Nhost. This environment will automatically track database migrations and Hasura metadata."
arch=('x86_64')
url="https://github.com/nhost/nhost"
license=("MIT")
depends=("docker" "curl" "docker-compose")
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
options=()
source=("${_pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git checkout main >/dev/null
  git tag --list 'cli@*' | grep -E '^cli@([0-9]+\.[0-9]+\.[0-9]+)$' | sed -E 's/^cli@([0-9]+\.[0-9]+\.[0-9]+)$/\1/g' | sort | tail -n 1
}

build() {
  cd "$srcdir/$_pkgname/cli"

  git checkout cli@$pkgver

  export OS=linux

  export CGO_ENABLED="1"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-s -w -X main.Version=${pkgver} -linkmode external" \
    -o "build/${_pkgname}" \
    .
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "cli"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
