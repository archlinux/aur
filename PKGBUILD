# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mykhailo Aleksieiev <nekohepott@larpdhq.org>
pkgname=gogofetch-git
pkgver=r35.553cbc9
pkgrel=1
pkgdesc="Fetch written in Go with image support"
arch=('x86_64')
url="git+https://codeberg.org/nekohepott/goGoFetch.git"
license=('MIT')
depends=('glibc' 'chafa')
makedepends=('git' 'go')
checkdepends=()
optdepends=()
provides=("gogofetch")
conflicts=("gogofetch")
source=("git+https://codeberg.org/nekohepott/goGoFetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "goGoFetch"
  # Считает общее количество коммитов и добавляет хеш последнего
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "goGoFetch"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "goGoFetch"
	go build -o "gogofetch" .
}

package() {
    cd "$srcdir/goGoFetch"

    install -Dm755 "gogofetch" "$pkgdir/usr/bin/gogofetch"

    install -d "$pkgdir/usr/share/gogofetch/assets"

    cp -v assets/*.png "$pkgdir/usr/share/gogofetch/assets/"

    chmod 755 "$pkgdir/usr/share/gogofetch/assets"
    chmod 644 "$pkgdir/usr/share/gogofetch/assets/"*.png
}
