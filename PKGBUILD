# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.12.0
pkgrel=2
pkgdesc="A hub-like tool for GitLab (tagged release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go' 'dep')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/zaquestion/lab/archive/v${pkgver}.tar.gz")
sha512sums=('e47a3255d3d98640a005e4da2f790db44816e8353861987af327a1a24d0801477a4889814b565f1870afb0508e607775caee7ad6b5d98e448d4d58d64c8d6d37')
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
