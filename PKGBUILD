# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-git
pkgver=0.9.1.r82.d4570b2
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
optdepends=('libappindicator-gtk3: indicator support'
            'gtk2: gtk2 support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support'
            'libxcb: xim support'
            'cairo: xim support')
makedepends=('cargo' 'clang' 'llvm' 'cmake' 'ninja' 'cairo' 'libxcb' 'pango' 'gtk2' 'gtk3' 'gtk4' 'qt5-base' 'qt6-base')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    local tag=$(git tag --sort=v:refname | grep '^v[0-9]\+.[0-9]\+.[0-9]\+$' | tail -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$(echo $tag | cut -b2-).r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
    cd "${pkgname}"
    cargo xtask build --mode Release XIM WAYLAND GTK2 GTK3 GTK4 QT5 QT6
}

package() {
    cd "${pkgname}"
    cargo xtask install "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

