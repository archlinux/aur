# Maintainer: taotieren <admin@taotieren.com>

pkgname=c6-git
pkgver=r482.25c6342
pkgrel=1
pkgdesc="c6 — TinyCC with language extensions"
arch=($CARCH)
url="https://github.com/c6lang/c6"
license=('LGPL-2.0-or-later')
provides=(${pkgname%-git} tcc)
conflicts=(${pkgname%-git} tcc)
depends=(
    'glibc'
)
makedepends=(
    'git'
)
options=('docs' 'staticlibs' '!lto')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/+/g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    pushd tcc >/dev/null 
    ./configure \
        --prefix=/usr \
        --docdir=/usr/share/doc/tcc \
        --disable-static
    popd >/dev/null

    make build
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    export LD_LIBRARY_PATH="${srcdir}/${pkgname%-git}/tcc${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" 
    # make -j1 test-all LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
    make test
}

package() {
    cd "${srcdir}/${pkgname%-git}/tcc"
    make DESTDIR="${pkgdir}" install
    install -vDm0644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf /usr/bin/c6 ${pkgdir}/usr/bin/tcc
}
