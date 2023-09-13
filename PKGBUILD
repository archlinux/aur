# Maintainer: M Hickford <mirth.hickford@gmail.com>
# Maintainer: Brainos <brainos233@gmail.com>
_pkgbase=git-credential-azure
pkgname=git-credential-azure-git
pkgver=0.2.3.r0.g5d59ce5
pkgrel=1
pkgdesc='Git credential helper that authenticates to Azure Repos (dev.azure.com) (Git version)'
arch=('any')
url="https://github.com/hickford/git-credential-azure"
license=('APACHE')
makedepends=('git' 'go')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/hickford/git-credential-azure.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgbase/"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/.alpha//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare(){
  cd "${srcdir}/$_pkgbase/"
  mkdir -p build/
}

build() {
  cd "${srcdir}/$_pkgbase/"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "${srcdir}/$_pkgbase/"
  go test ./...
}

package() {
  cd "${srcdir}/$_pkgbase/"
  install -Dm755 build/$_pkgbase "$pkgdir"/usr/bin/$_pkgbase
  install -Dm0644 git-credential-azure.1 -t "$pkgdir"/usr/share/man/man1/
}
