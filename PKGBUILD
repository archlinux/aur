# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>

pkgname=lip-git
pkgver=0.24.0
pkgrel=2
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=(lip)
makedepends=(
    go
    git
)

source=(
    "git+${url}.git"
    "lip.1"
)
sha512sums=(
    'SKIP'
    '6626f73bd768cc10ae98fdab3cc4e75ba739ee658d486c75ab29de8a889be30ad24d68bb92f6f0eac56ab0710e53729d255946399c6ac843460150642a585e32'
)

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
    install -Dm 644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
    cd lip
    install -Dm 755 bin/lip ${pkgdir}/usr/bin/lip
    install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/lip/LICENSE
}
