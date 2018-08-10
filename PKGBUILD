# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.13.0
pkgrel=1
pkgdesc="A hub-like tool for GitLab (tagged release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go' 'dep')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/zaquestion/lab/archive/v${pkgver}.tar.gz")
sha512sums=('8cd3598f8e132c42841748f6c8865a1f967a10e36b55a1d873a075b07eff8d20205432a6c44dd7f97dece0715da8f181b42bf60dc632568a735c7390443d3a92')
_gourl="github.com/zaquestion/${pkgname}"

prepare() {
    export GOPATH="${srcdir}/go"
    mkdir -p "$GOPATH"
    mkdir -p "$(dirname "$GOPATH/src/${_gourl}")"
    ln --no-target-directory -fs "${srcdir}/${pkgname}-${pkgver}" "$GOPATH/src/${_gourl}"
}

build () {
    export GOPATH="${srcdir}/go"
    cd "$GOPATH/src/${_gourl}"
    dep ensure
    go build -ldflags "-X \"main.version=${pkgver}\"" ${_gourl}
}

package() {
    cd "${pkgname%-bin}-${pkgver}"
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 lab $pkgdir/usr/bin/lab
}
