# Maintainer: wszqkzqk <wszqkzqk@qq.com>
pkgname=oh-my-posh
pkgver=18.6.2
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('go' 'gcc')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fa3c3d4e5466a926d0ff9e304a462096161d244f222f34453f2a00c6b6a734ed')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver/src"
    go build -ldflags="-linkmode=external -X github.com/jandedobbeleer/oh-my-posh/src/build.Version=$pkgver -X github.com/jandedobbeleer/oh-my-posh/src/build.Date=$(date +%F)" -o "$pkgname"
    "./${pkgname}" completion bash > "${pkgname}.sh"
    "./${pkgname}" completion fish > "${pkgname}.fish"
    "./${pkgname}" completion zsh > "_${pkgname}"
}

package() {
    cd "$pkgname-$pkgver/src"
    install -Dm 755 ./"${pkgname}" "${pkgdir}/usr/bin/oh-my-posh"
    install -Dm 644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/oh-my-posh/themes"
    install -m 644 ../themes/* -t "${pkgdir}/usr/share/oh-my-posh/themes"

    install -Dm 644 "${pkgname}.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm 644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
    install -Dm 644 "_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
