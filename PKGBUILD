# Maintainer: Angelo Riganis <ariganis-oss at keemail dot me>
# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor: Xinzhao Xu <z2d@jifangcheng.com>

pkgname=lux-dl-git
pkgver=0.24.1.r25.dd00f6d
pkgrel=1
pkgdesc="Fast and simple video download library and CLI tool written in Go"
arch=('x86_64' 'i686')
url="https://github.com/iawia002/lux"
license=('MIT')
depends=('ffmpeg')
makedepends=('go' 'git')
provides=('lux-dl')
conflicts=('lux-dl' 'lux-dl-bin' 'lux-go' 'annie' 'lux')
_commit=dd00f6d258d80b6684a0b9402d7124e5c18ef42f
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed -r 's/^v//;s/-([0-9]+)-g/\.r\1./;s/-/./g'
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external -X \"github.com/iawia002/lux/app.version=$pkgver\""
}

package() {
    cd "${pkgname}"
    install -Dm755 lux -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
