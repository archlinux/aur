# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

pkgname=gitlab-glab-git
_reponame=glab
pkgver=1.15.0.r30.g9371da9
pkgrel=2
epoch=
pkgdesc="An open source GitLab CLI tool written in Go"
arch=(x86_64)
url="https://github.com/profclems/glab"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(go)
checkdepends=()
optdepends=()
provides=(gitlab-glab)
conflicts=(gitlab-glab)
replaces=()
backup=()
options=()
install=
changelog=
source=(git+$url.git)
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver() {
    cd glab
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_reponame}"
  mkdir -p build/
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "${_reponame}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  _builddate=$(date -u +%m/%d/%Y)
  go build -o build -trimpath -buildmode=pie -ldflags "-extldflags \"${LDFLAGS}\" -X main.version=v${pkgver} -X main.build=${_builddate} -X main.usageMode=prod -s -w" -modcacherw ./cmd/glab/main.go
}

package() {
  cd "${_reponame}"
  install -Dm755 build/main "$pkgdir"/usr/bin/glab
  install -Dm644 $srcdir/${_reponame}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  	# Shell completions
	build/main completion -s bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/glab"
	build/main completion -s zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_glab"
	build/main completion -s fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/glab.fish"
}
