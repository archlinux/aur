# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# shellcheck disable=2034,2154,2164
pkgname=gibo
pkgver=3.0.16
pkgrel=2
pkgdesc='Command-line tool to help you easily access .gitignore boilerplates'
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/simonwhitaker/gibo"
license=('Unlicense')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.install")
b2sums=('a48090a2371b0d4132e8e2edc1bd6bcadcdd35b90838c7258fa4f56a9c2c89be727de751122a218d701456106bc80f6841da20e3b4ad46528e22a44c7cfd3a12'
        'a8516b43198e9353eaf0fe49d50cb50ea2ac096b0366deabd33795b2c6d52ede6264d5615acdf78117550dbd2dc13999bca66fc9d1b10a090e7cee344c487f97')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build
}

export GGO_ENABLED="1"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

build() {
    cd "$pkgname-$pkgver"
    _flags=(
        -X=github.com/simonwhitaker/gibo/cmd.version=${pkgver}
        -linkmode=external
    )
    go build -o "./build" -ldflags="-s -w ${_flags[*]}" ./...
    "build/gibo" completion bash >build/gibo-completion.bash
    "build/gibo" completion zsh >build/gibo-completion.zsh
    "build/gibo" completion fish >build/gibo.fish
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "build/gibo" "$pkgdir/usr/bin/gibo"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # bash
    mkdir -p "$pkgdir/usr/share/bash-completion"
    install -Dm644 build/gibo-completion.bash "$pkgdir/usr/share/bash-completion/completions/gibo"

    # zsh
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 build/gibo-completion.zsh "$pkgdir/usr/share/zsh/site-functions/_gibo"

    # fish
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 build/gibo.fish "$pkgdir/usr/share/fish/vendor_completions.d/gibo.fish"
}
