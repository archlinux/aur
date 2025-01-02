# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>

pkgname=lip-git
pkgver=0.24.0
pkgrel=1
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=(lip)
makedepends=(
    go
    git
)
source=("git+${url}.git")
sha512sums=('SKIP')

prepare() {
    cd lip
    if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
    fi
}

build() {
    cd lip
    export GOOS=linux
    if [ ${arch} == aarch64 ];then
        export GOARCH=arm64
    else
        export GOARCH=amd64
    fi
    go build -ldflags "-s -w" -o bin/ github.com/lippkg/lip/cmd/lip
}

package() {
    cd lip
    install -Dm 755 bin/lip ${pkgdir}/usr/bin/lip
    install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/lip/LICENSE
}
