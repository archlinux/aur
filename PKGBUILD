# Maintainer: ml <ml@visu.li
pkgname=vt-cli
pkgver=0.8.0
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('48de52aaafa5790e36d6522086c49c73bac3aff9a814164aa1b0c5f6487f1669')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o build/vt -ldflags "-X github.com/VirusTotal/vt-cli/cmd.Version=${pkgver}" ./vt
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755  build/vt -t "${pkgdir}/usr/bin"
  build/vt completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/vt"
  build/vt completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_vt"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*
}
