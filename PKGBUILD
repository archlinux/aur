# Maintainer: taotieren <admin@taotieren.com>

pkgname=dsl2sigrok-git
pkgver=r12.e41831e
pkgrel=1
epoch=
pkgdesc="a converter from DSView .dsl to Sigrok/Pulseview .sr"
arch=($CARCH)
url="https://github.com/kittennbfive/dsl2sigrok"
license=('AGPL-3.0-or-later')
groups=()
depends=(
    glibc
    libzip
)
makedepends=(
    git
)
checkdepends=()
optdepends=(
    'dsview: GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
    'pulseview: A Qt based logic analyzer GUI for sigrok'
    'sigrok-cli: Command-line client for the sigrok software'
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()
pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}" 
    gcc -Wall -Wextra -Werror -O2 -o dsl2sigrok main.c zip_helper.c -lm -lzip
}

# check(){
# }

package() {
    cd "${srcdir}/${pkgname}"
    install -vDm755 dsl2sigrok -t ${pkgdir}/usr/bin/
    install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
