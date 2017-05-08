# Maintainer: Vincent Ambo <tazjin@gmail.com>
pkgname=kontemplate-git
pkgver=master_1e3ecad
pkgrel=1
pkgdesc="Simple Kubernetes resource templating"
arch=('x86_64')
url="https://github.com/tazjin/kontemplate"
license=('MIT')
makedepends=('go')
optdepends=('pass: Template secrets into resources')
source=('kontemplate-git::git+https://github.com/tazjin/kontemplate.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo -n "master_$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  echo "Fetching Go dependencies..."
  go get -v ./...
}

build() {
  cd "$srcdir/$pkgname"
  local GIT_HASH="$(git rev-parse --short HEAD)"

  go build -tags netgo \
     -ldflags "-X main.gitHash=${GIT_HASH} -w -s" \
     -o 'kontemplate'
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 0755 'kontemplate' "${pkgdir}/usr/bin/kontemplate"
}
