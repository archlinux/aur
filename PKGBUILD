# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-git
pkgver=2.3.0.r0.03e8565
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
optdepends=('gtk2: gtk2 support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support')
makedepends=('cargo' 'clang' 'llvm' 'cmake' 'cairo' 'libxcb' 'dbus')
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
    # Clean build cache
    rm -rf build || true
    scripts/build.sh -ar
}

package() {
    cd "${pkgname}"
    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

