# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=go-tools-complete-git
pkgver=v0.0.0_20181214171254_3c39ce7b6105
pkgrel=3
pkgdesc='Developer tools for the Go programming language'
arch=(x86_64)
url='https://godoc.org/golang.org/x/tools/cmd'
license=(BSD)
depends=(glibc)
makedepends=(git go)
conflicts=('go-tools'
           'go-tools-git'
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
  git show --abbrev-commit --abbrev=12 --pretty=format:v0.0.0_%cd_%h --no-patch HEAD
}

prepare() {
  rm -rf build/
  mkdir -p build/
  mkdir -p cache/

  cd "${pkgname}"
  rm -f go.mod
  go mod init golang.org/x/tools
}

build() {
  cd "${pkgname}"
  GOCACHE="${srcdir}/cache" GOBIN="${srcdir}/build" go install -v -a \
    -gcflags "all=-trimpath=${srcdir}" \
    -asmflags "all=-trimpath=${srcdir}" \
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
