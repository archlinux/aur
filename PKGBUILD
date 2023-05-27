# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=vt-cli-git
_pkgname=${pkgname%-git}
pkgver=0.13.0.r3.g97023b3
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url=https://virustotal.github.io/vt-cli/
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${pkgname}::git+https://github.com/VirusTotal/vt-cli")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/VirusTotal/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/VirusTotal/vt-cli"
}

build() {
    cd "${srcdir}/go/src/github.com/VirusTotal/vt-cli"

    mkdir -p build
    export GOPATH="${srcdir}/go"

    _version="github.com/VirusTotal/vt-cli/cmd.Version=${pkgver}"
    go build -buildmode=pie -trimpath -modcacherw -ldflags \
        "-s -w -linkmode=external -X ${_version}" \
        -o ./build/vt ./vt

    ./build/vt completion bash >vt.bash
    ./build/vt completion zsh >vt.zsh
}

check() {
  cd "${srcdir}/go/src/github.com/VirusTotal/vt-cli"

  # yaml_test.go broken. fails upstream as well
  go test -ldflags "-linkmode=external" -short ./utils/...
}

package() {
  cd "${srcdir}/go/src/github.com/VirusTotal/vt-cli"

  install -Dm755 "build/vt" -t "${pkgdir}/usr/bin"
  install -Dm644 "vt.bash" "${pkgdir}/usr/share/bash-completion/completions/vt"
  install -Dm644 "vt.zsh" "${pkgdir}/usr/share/zsh/site-functions/_vt"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*
}
