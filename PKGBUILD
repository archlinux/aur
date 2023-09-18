# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Jens Jäschke <arch [at] jensjaeschke [dot] de>

pkgname=kopia
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.14.1
pkgrel=1
arch=('x86_64')
url='https://kopia.io'
license=('APACHE')
makedepends=('go')
checkdepends=('openssh' 'inetutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kopia/kopia/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87a5b14a34a1ab0ee03d82c5aefc6934f348b67c1c59723ad39bf05ae54b3416')

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-linkmode=external -X github.com/kopia/kopia/repo.BuildVersion=$pkgver-$pkgrel -X github.com/kopia/kopia/repo.BuildInfo=unofficial -X github.com/kopia/kopia/repo.BuildGitHubRepo=ARCH_USER_REPOSITORY"
}

check() {
    make -C $pkgname-$pkgver test
}

package() {
    install -Dm755 "$pkgname-$pkgver/kopia" "$pkgdir/usr/bin/kopia"
}
