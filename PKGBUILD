# Maintainer: Oleksandr Zinkevych <echo enNvMDQwMzk5QGdtYWlsLmNvbQo= | base64 -d>

pkgname=lets-git
_pkgname=lets
pkgver=v0.0.33.r2.g186f3ea
pkgrel=3
pkgdesc="CLI task runner - a better alternative to make"
arch=('i686' 'x86_64')
url="https://github.com/lets-cli/lets"
license=('APACHE')
makedepends=('git' 'go' 'jq' 'curl')
conflicts=('lets-bin' 'lets-git')
provides=('lets')
source=('git+https://github.com/lets-cli/lets.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')
pkgver() {
    cd "$srcdir/$_pkgname"
    # Use the tag of the last commit
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    VER="$(curl --silent 'https://api.github.com/repos/lets-cli/lets/releases/latest' | jq -r .tag_name | sed 's/v//')"
    go build -ldflags="-X main.version=$VER" -o $_pkgname *.go
}

package() {
    cd "$srcdir/$_pkgname"
	install -Dm755 $_pkgname "$pkgdir/usr/local/bin/$_pkgname"
}
