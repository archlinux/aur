# Maintainer: Aria Quinlan <hello@aria.coffee>
pkgname=auto-av1-folder-git
_pkgname=auto-av1
pkgver=r9.eb17b49
pkgrel=1
pkgdesc="Recursive AV1 re-encoder (ffmpeg -> SvtAv1EncApp) with resume/replace options"
arch=('x86_64')
url="https://tangled.org/aria.pds.witchcraft.systems/auto-av1"
license=('zlib')
depends=('ffmpeg' 'glibc')
optdepends=(
    'svt-av1: stock SVT-AV1 encoder (SvtAv1EncApp)'
    'svt-av1-essential: nekotrix SVT-AV1-Essential fork (recommended)'
)
makedepends=('git' 'python' 'nuitka' 'gcc' 'patchelf')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug' '!lto')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    python -m nuitka \
        --onefile \
        --lto=yes \
        --assume-yes-for-downloads \
        --jobs="$(nproc)" \
        --output-filename="$_pkgname" \
        --output-dir=build \
        --remove-output \
        auto-av1.py
}

package() {
    cd "$_pkgname"
    install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
