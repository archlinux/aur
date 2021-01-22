# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-git
pkgver=0.7.0.r3.727503e
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
depends=('gtk3' 'cairo' 'libxcb' 'pango')
makedepends=('cargo')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    local tag=$(git tag --sort=v:refname | grep '^v[0-9]' | tail -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$(echo $tag | cut -b2-).r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
    cd "${pkgname}"
    cargo build --release
    pkg/release.sh
}

package() {
    cd "${pkgname}/build/out"

    install -Dm755 kime-xim -t "${pkgdir}/usr/bin"
    install -Dm755 im-kime.so -t "${pkgdir}/usr/lib/gtk-3.0/3.0.0/immodules"
    install -Dm755 libkime_engine.so -t "${pkgdir}/usr/lib"
    install -Dm644 kime_engine.h -t "${pkgdir}/usr/include/kime"

    install -Dm644 config.yaml -t "${pkgdir}/etc/kime"
}

