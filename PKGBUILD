# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=spotifox
pkgver=1.0.2
pkgrel=2
pkgdesc='Yet another Spotify CLI client similar to go-musicfox.'
arch=('x86_64' 'aarch64')
url='https://github.com/go-musicfox/spotifox'
license=('MIT')
conflicts=("${pkgname}-bin" "${pkgname}-git")
makedepends=('go')
depends=('glibc'
         'alsa-lib')

source=("spotifox-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'spotifox_auth')

sha256sums=('2511f656d4247e8cd431a9ae13c1464f5ef3c5d8aafe256b2ba98ea569e9c747'
            '3a5186abc2863545b6ec9529e5e4d015882ffcc2374ef7304fca1ed7c587b5ae')

build() {
    cd "${pkgname}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH="${srcdir}"

    export AUTH_FILE="${AUTH_FILE:-"$HOME/.config/spotifox/spotifox_auth"}"

    go build -o ../spotifox -ldflags "-s -w \
        -X 'github.com/go-musicfox/spotifox/internal/types.AppVersion=v${pkgver}'   \
        -X 'github.com/go-musicfox/spotifox/internal/types.LastfmKey=$(awk 'NR==1{print $3}' $AUTH_FILE)'  \
        -X 'github.com/go-musicfox/spotifox/internal/types.LastfmSecret=$(awk 'NR==2{print $3}' $AUTH_FILE)' 
        -X 'github.com/go-musicfox/spotifox/internal/types.SpotifyClientId=$(awk 'NR==3{print $3}' $AUTH_FILE)'" cmd/spotifox.go
}

package() {
    cd "${srcdir}"
    install -Dm 755 spotifox "${pkgdir}/usr/bin/spotifox"
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/spotifox/LICENSE"
}
