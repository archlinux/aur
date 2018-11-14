# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <$pkgbuild at maximbaz dot com>

_pkgauthor=GoogleContainerTools
pkgname=skaffold
pkgver=0.18.0
pkgrel=2
pkgdesc='A command line tool that facilitates continuous development for Kubernetes applications'
arch=('x86_64')
url="https://github.com/$_pkgauthor/$pkgname"
license=('Apache')
depends=('docker' 'kubectl-bin')
makedepends=('go-pie')
optdepends=('google-cloud-sdk: To use GKE'
            'minikube: To use Minikube')
source=("$pkgname-$pkgver::https://github.com/$_pkgauthor/$pkgname/archive/v$pkgver.tar.gz"
        'build_flags.patch')
sha256sums=('3ec621485d2ebeac3366346271527326c3c97115784597bff457ccce162be008'
            '03be8856eec2169b72fae7369ce11c32a66cd49638e4e68bae7f63b0d5519a6a')

prepare() {
    mkdir -p "gopath/src/github.com/$_pkgauthor"
    ln -rTsf "$pkgname-$pkgver" "gopath/src/github.com/$_pkgauthor/$pkgname"

    cd "$pkgname-$pkgver"
    patch -Np1 -i ../build_flags.patch
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "gopath/src/github.com/$_pkgauthor/$pkgname"
    VERSION="v$pkgver" make install
}

package() {
    install -Dm755 "gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
