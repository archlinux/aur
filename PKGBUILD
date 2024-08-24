# Maintainer: Guillaume Boehm <guillaumeboehm@hotmail.fr>
_gitname='changeloggenerator'
_projectname="ChangelogGenerator"
pkgname="gitlab-${_gitname}-git"
pkgver=r1.d149df0
pkgrel=1
pkgdesc="ChangelogGenerator is a powerful and intuitive tool designed to streamline the process of generating changelogs for GitLab projects."
arch=('any')
url="https://gitlab.com/nicolasloxol/${_gitname}"
license=('GPLv3')
depends=('qt6-base')
makedepends=('git' 'cmake' 'ninja' 'qt6-tools')
source=("${_gitname}::git+${url}.git")
provides=("${_projectname}")
conflicts=("${_projectname}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_gitname}"
    git submodule update --init --recursive

    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j4 --config Release
}

package() {
    cd "$srcdir/${_gitname}"
    install -Dm644 ./LICENSE.txt "$pkgdir/usr/share/licenses/${_projectname}/LICENSE"
    install -Dm755 ./build/ChangelogGenerator "$pkgdir/usr/bin/${_projectname}"
}
