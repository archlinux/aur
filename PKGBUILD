# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

pkgname=git-gitlab
pkgver=r86.2c65c9369900391717373e1e0263753740ca7fa2
pkgrel=1
pkgdesc="gitlab command line interface (patched fork)"
arch=('x86_64')
url="https://github.com/diegostamigni/$pkgname"
license=('MIT')
depends=('libgit2')
makedepends=('go')
source=("$pkgname-${pkgver#r*.}.zip::$url/archive/${pkgver#r*.}.zip")
sha256sums=('f1afad863c4af9ff23c4f7346975ab1b9e9e0d396b63f5f8c62b0ac8bc185969')

prepare() {
    export GOPATH="$srcdir"
    go get gopkg.in/libgit2/git2go.v27
    go get github.com/plouc/go-gitlab-client
    go get github.com/codegangsta/cli
}

build() {
    cd "$pkgname-${pkgver#r*.}"
    export GOPATH="$srcdir"
    go build \
        -trimpath \
        -buildmode=pie \
        -ldflags "-extldflags ${LDFLAGS}" \
        .
}

package() {
    cd "$pkgname-${pkgver#r*.}"
    install -Dm755 "$pkgname-${pkgver#r*.}" "$pkgdir/usr/bin/git-lab"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
