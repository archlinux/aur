# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: AllayMC <https://github.com/AllayMC>

pkgname=allay-launcher-git
_pkgname=allay
pkgver=1.1.0
pkgrel=1
pkgdesc="The launcher for Allay that aims to be small, fast and ready out of the box⚡"
arch=('x86_64' 'aarch64')
url="https://github.com/AllayMC/AllayLauncher"
license=('LGPL3')
conflicts=(allay-launcher)
optdepends=('jre-openjdk: for Java enviroment')
makedepends=(
    git
    xmake
    zig
    gcc
    gzip
    tar
    cmake
    curl
    nim
)

source=(
    "git+${url}.git"
    "allay.1"
)
sha256sums=(
    'SKIP'
    'ef7d618595d5f9eced792956646bf504dcd4f17e1ae9588f0234863d39ad5eb0'
)

prepare() {
    cd AllayLauncher
    if [[ -z "$(git config --get user.name)" ]]; then
        git config user.name local && git config user.email '<>' && git config commit.gpgsign false
    fi
}

build() {
    cd AllayLauncher
    xmake repo -u
    if [ ${arch} == x86_64 ]; then
        xmake f -a amd64 -m release -p linux -v -y
    else
        xmake f -a arm64-v8a -m release -p linux -v -y
    fi
    xmake -v -y
}

package() {
    install -Dm 644 ${_pkgname}.1 ${pkgdir}/usr/share/man/man1/${_pkgname}.1
    cd AllayLauncher
    if [ ${arch} == x86_64 ]; then
        install -Dm 755 build/linux/amd64/release/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    else
        install -Dm 755 build/linux/arm64-v8a/release/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    fi
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
