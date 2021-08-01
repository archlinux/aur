# Maintainer: Jörg Horchler <joerg@horchler.xyz>

pkgname=gotask-taskfile
_binname=gtask
pkgver=3.7.0
pkgrel=1
pkgdesc="A task runner / simpler Make alternative written in Go. Installs as gtask to allow coexistance with taskwarrior."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://taskfile.dev/"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}::git://github.com/go-task/task#tag=v${pkgver}")
md5sums=('SKIP')

build() {

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  cd "$pkgname-$pkgver"
  _modname=$(awk '$1 == "module" {print $2}' go.mod)
  _mainpath=$(awk '$1 == "main:" {print $2}' .goreleaser.yml)
  _gobinname=$(awk '$1 == "binary:" {print $2}' .goreleaser.yml)
  export _gobinname

  mkdir -p build/
  cd build

  echo "// +build: main" > main.go
  echo "package main" >> main.go
  echo "" >> main.go
  echo "import _ \"${_modname}/${_mainpath}\"" >> main.go

  echo "module ${_gobinname}" > go.mod
  echo "" >> go.mod
  echo "require ${_modname} v${pkgver}" >> go.mod

  go mod tidy
  go build -v -o ${_gobinname} -ldflags="-w -s -linkmode=external" ${_modname}/${_mainpath}
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/${_gobinname} "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
