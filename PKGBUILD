# Maintainer: David Birks <david@tellus.space>

pkgname=jx
pkgver=2.0.141
pkgrel=1
pkgdesc='Command line tool for working with Jenkins X'
arch=('x86_64')
url='https://github.com/jenkins-x/jx'
license=('Apache')
depends=('go>=1.11.4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jenkins-x/jx/archive/v$pkgver.tar.gz")
sha256sums=('65791bd1b206c85f0b40ab26d4393b0b0acc47ab4d74e922db131727215148af')

build() {
    # Trim $PWD in build
    export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
    export GOPATH="${srcdir}"

    mkdir -p github.com/jenkins-x
    mv $pkgname-$pkgver github.com/jenkins-x/jx
    cd github.com/jenkins-x/jx
    VERSION=${pkgver} make build
}

package() {
    install -Dm 755 "${srcdir}/github.com/jenkins-x/jx/build/jx" "${pkgdir}/usr/bin/jx"

    # Populate bash and zsh completions
    install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
    "${pkgdir}/usr/bin/jx" completion bash > "${pkgdir}/usr/share/bash-completion/completions/jx"
    "${pkgdir}/usr/bin/jx" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_jx"
}
