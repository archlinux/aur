# Maintainer: ml <ml@visu.li
pkgname=vt-cli
pkgver=0.7.0+15+g13f5bfe
_commit=13f5bfed2cff747fdba131cda499df878f9a2b2d
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('78deba6484ea688843dc45bd4d2e9c4e95d79eb82337def751891bf5473b9100')

prepare() {
  cd "${pkgname}-${_commit}"
  go mod download
}

build() {
  cd "${pkgname}-${_commit}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o build/vt -ldflags "-X github.com/VirusTotal/vt-cli/cmd.Version=${pkgver}" ./vt
}

check() {
  cd "${pkgname}-${_commit}"
  go test ./...
}

package() {
  cd "${pkgname}-${_commit}"
  install -Dm755  build/vt -t "${pkgdir}/usr/bin"
  build/vt completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/vt"
  build/vt completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_vt"
}
