# Maintainer: ZhangHua<zhanghuadedn at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=rclone-aliyundrive-git
pkgver=1.59.0.r93.gd3d843a11
pkgrel=1
pkgdesc="Rclone with aliyundrive support."
arch=("x86_64")
url="https://rclone.org/"
license=("MIT")
depends=("glibc")
optdepends=('fuse2: for rclone mount')
makedepends=('python' 'pandoc' 'go' 'git' 'fuse2' 'git')
provides=("rclone")
conflicts=("rclone")
source=(
    "git+https://github.com/rclone/rclone.git"
    "aliyundrive-backend.patch"
    # Take and rebase from https://github.com/K265/rclone/tree/aliyundrive-backend
)
sha256sums=('SKIP'
            '680f8f2cd08718fbd87dbf0bc069a423e4a336d7688c2d0ed8a15740e89ad4a4')
options=(!lto)

prepare(){
    cd "${srcdir}/rclone"
    git apply "${srcdir}/aliyundrive-backend.patch"
    make tidy
}
pkgver(){
    cd "${srcdir}/rclone"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/rclone"
    export GOFLAGS="-buildmode=pie -trimpath"
    export CGO_LDFLAGS="${LD_FLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    make rclone
    ./rclone genautocomplete bash rclone.bash_completion
    ./rclone genautocomplete zsh rclone.zsh_completion
}
check(){
    cd "${srcdir}/rclone"
    make test
}
package(){
    cd "${srcdir}/rclone"
    install -Dm755 rclone "${pkgdir}/usr/bin/rclone"
    install -Dm644 rclone.bash_completion "${pkgdir}/usr/share/bash-completion/completions/rclone"
    install -Dm644 rclone.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_rclone"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 rclone.1 "${pkgdir}/usr/share/man/man1/rclone.1"
    install -Dm644 MANUAL.html "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.html"
    install -Dm644 MANUAL.txt "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.txt"
}
