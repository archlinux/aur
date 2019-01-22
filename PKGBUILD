# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Egor Kovetskiy <e.kovetskiy@office.ngs.ru>

pkgname=go-tools-git
pkgver=v0.0.0_20190121143147_24cd39ecf745
pkgrel=2
pkgdesc='Developer tools for the Go programming language'
arch=(x86_64)
url='https://godoc.org/golang.org/x/tools/'
license=(BSD)
depends=(glibc)
makedepends=('git'
             'go>=1.11')
conflicts=('go-tools'
           'go-tools-complete-git'
           'go-imports-git')
provides=('go-tools')
source=("${pkgname}::git+https://go.googlesource.com/tools"
        'godoc.service')
sha256sums=('SKIP'
            '0afd3dcbf1758b33f6810cc81fc7eb37095db48bc8055ddd6b714c46184a490e')

pkgver() {
  cd "${pkgname}"
  # Until they start versioning this repo, use the Go Modules special version
  # format.
  git show --abbrev-commit --abbrev=12 --date='format:%G%m%d%H%M%S' --pretty=format:v0.0.0_%cd_%h --no-patch HEAD
}


prepare() {
  export GO111MODULE=on
  rm -rf build/
  mkdir -p build/
  mkdir -p cache/

  cd "${pkgname}"
  rm -f go.mod
  go mod init golang.org/x/tools
}

build() {
  export GO111MODULE=on
  cd "${pkgname}"
  GOCACHE="${srcdir}/cache" GOBIN="${srcdir}/build" go install -v -a \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./cmd/...
}

check() {
  cd "${pkgname}"
  go test ./cmd/...
}

package() {
  install -Dm755 build/* -t "${pkgdir}"/usr/bin/
  install -Dm644 ${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm644 godoc.service -t ${pkgdir}/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
