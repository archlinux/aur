# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Götz
# Contributor: Jni <jni.viens at protonmail dot com>

pkgname=bitrise
pkgver=3.0.0
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=(x86_64)
url="https://github.com/bitrise-io/bitrise"
license=(MIT)
depends=(glibc)
makedepends=(go)
optdepends=('envman: manage Environment Variable collections'
            'stepman: manage decentralized StepLib Step (script) collections')
checkdepends=(envman git)
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        bitrise.bash
        bitrise.zsh
        bitrise.fish)
sha256sums=('16d9183e0c65e626eac52f5960ae18130cb3d5de068800dd79e553b5808219c9'
            'b367b75b82c0fda6c55521b137b767e430f052ed75acb184f1b9bad228b92a39'
            '2e90903f4581ed8894b263ebd0d58811169466ad8ec557b77c272dd3d6c07326'
            'fe394b90914152d73a78096dccaef08d2dc0cd9e1e3745c518ee6507c6611da3')

prepare() {
    export GOMODCACHE="${srcdir}/go-mod-cache"

    cd "$pkgname-$pkgver"
    go mod download -modcacherw

    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOCACHE="${srcdir}/go-cache"
    export GOMODCACHE="${srcdir}/go-mod-cache"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o "build/${pkgname}" .
}

check() {
    cd "$pkgname-$pkgver"
    BITRISE_ANALYTICS_DISABLED=true go test -p 1 ./... -skip 'TestParseAndValidatePluginFromYML|TestMoveFileDifferentDevices'
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/${pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "$srcdir/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "$srcdir/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
