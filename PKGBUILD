# Maintainer: taotieren <admin@taotieren.com>

pkgname=qsaharaserver-git
pkgver=2015.r0.g4a5b814
pkgrel=9
pkgdesc="QSaharaServer Source Code "
arch=($CARCH)
url="https://github.com/Muhmmad-Almuhmmah/QSaharaServer"
license=('LicenseRef-Custom')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=('glibc')
makedepends=('git')
options=()
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^QSaharaServer//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    sed -i 's|-D|-fcommon -D|g' Makefile
    sed -i 's|sizeof(cwd)|sizeof(cwd)-1|g' kickstart.c
    sed -i 's|#LIBS|LIBS|g' Makefile
    make
}

package() {
    install -Dm0755 "${srcdir}/${pkgname%-git}/kickstart" "${pkgdir}/usr/bin/${pkgname%-git}"
    head -n 32 "${srcdir}/${pkgname%-git}/kickstart.c" >"${srcdir}/${pkgname%-git}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
