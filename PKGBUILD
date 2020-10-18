# Maintainer: jojii <jojii@gmx.net>
pkgname=earbuds-git
_pkgname=earbuds
_gitname=LiveBudsCli
pkgver=v0.1.5.r0.gd9486c9
pkgrel=1
pkgdesc="Control your galaxy buds live via cli"
url="https://github.com/JojiiOfficial/LiveBudsCli"
license=("GPL3")
source=("git+$url")
md5sums=('SKIP')
arch=("x86_64")
conflicts=("earbuds")
provides=("earbuds")
makedepends=("cargo" "git" "bluez" "bluez-libs" "gcc-libs" "glibc")

pkgver() {
    cd $_gitname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_gitname
    cargo build --release
}

package() {
    cd $_gitname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    ./target/release/${_pkgname} --generate=zsh > _${_pkgname}
    install -Dm 644 _earbuds "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

    ./target/release/${_pkgname} --generate=bash > ${_pkgname}.fish
    install -Dm 644 ${_pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
