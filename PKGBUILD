# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: liupold <rohhnch@protonmail.ch>

pkgname=pidswallow-dev-git
pkgrel=7
pkgver=2.0.d # dev
pkgdesc="A script to swallow your terminal automatically"
arch=(x86_64)
url="https://github.com/Liupold/pidswallow/tree/dev"
license=('APACHE')
depends=(xdotool)
makedepends=(git)
checkdepends=(shellcheck)
provides=(pidswallow)
conflicts=(pidswallow)

source=("$pkgname::git+https://github.com/Liupold/pidswallow")
sha256sums=("SKIP")

pkgver() {
        cd "$pkgname" || return 1
        {
                git checkout dev
                git stash
                git pull
        } >/dev/null 2>&1

        printf "2.0.d.r%s.%s" \
                "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

check() {
        cd "$pkgname" || return 1
        git checkout dev > /dev/null 2>&1
        shellcheck "./pidswallow"
}

package() {
        cd "$pkgname" || return 1
        install -Dm755 "./pidswallow" "$pkgdir/usr/bin/pidswallow"
        install -Dm644 "./man/pidswallow.1" "$pkgdir/usr/local/man/man1/pidswallow.1"
        install -Dm644 "./README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
