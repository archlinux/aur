# Maintainer: Brieuc Dubois <focus dot aur at bhasher dot com> 
pkgname=focus-server-git
pkgver=r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
pkgrel=1
pkgdesc="Focus is an open-source, Kanban-style project management tool, emphasizing simplicity and efficiency."
arch=('x86_64')
license=('MIT')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
url="https://git.bhasher.com/bhasher/focus"

source=(
    "$pkgname::git+https://git.bhasher.com/bhasher/focus.git"
    "LICENSE::https://git.bhasher.com/Bhasher/focus/raw/branch/master/LICENSE.md"
)
md5sums=(
    'SKIP'
    'SKIP'
)

depends=(
    'glibc'
)
makedepends=(
    'go'
    'git'
)

build() {
    cd "$srcdir/$pkgname/backend"
    CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o focus-server .
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/backend/focus-server" "${pkgdir}/usr/bin/focus-server"
    install -Dm644 "${srcdir}/${pkgname}/backend/focus-server.service" "${pkgdir}/usr/lib/systemd/system/focus-server.service"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

