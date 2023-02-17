# Maintainer: ZhangHua<zhanghuadedn at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=rclone-aliyundrive-git
pkgver=1.59.0.beta.6199.08f5f7d56
pkgrel=1
pkgdesc="Rclone with aliyundrive support."
arch=("x86_64")
url="https://rclone.org/"
license=("MIT")
depends=("glibc")
optdepends=('fuse2: for rclone mount')
makedepends=('python' 'pandoc' 'go' 'git' 'fuse2')
provides=("rclone")
conflicts=("rclone")
source=(
    "git+https://github.com/K265/rclone.git#branch=aliyundrive-backend"
)
sha256sums=('SKIP')
options=(!lto)

pkgver(){
    cd "${srcdir}/rclone"
    make version | sed 's/v//;s/.makepkg$//;s/-/./g'
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
