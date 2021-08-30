# Maintainer: Atif Chowdhury <iftakhar.awal@gmail.com>
pkgname=eww-wayland-git
_pkgname=eww
pkgver=70285e0_2021.08.27
pkgrel=1
epoch=
pkgdesc="ElKowar's wacky widgets (Wayland Only)"
arch=('any')
url="https://github.com/elkowar/eww"
license=('MIT')
groups=()
depends=("gtk3")
makedepends=("rustup" "git")
checkdepends=()
optdepends=()
provides=("eww")
conflicts=("eww")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/elkowar/eww")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
    cd ${_pkgname}
    _commit=$(git rev-parse HEAD | cut -c1-7)
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s\n" "${_commit}" "${_date}" | sed 's/-/./g'
}

build() {
    cd "$_pkgname"
    rustup toolchain install nightly
    cargo +nightly build --release --no-default-features --features=wayland
}

package() {
    cd "$_pkgname"

    install -Dm755 target/release/eww "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/xdg/${_pkgname}"
    cp -r examples/eww-bar "${pkgdir}/etc/xdg/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    echo "\
_____________________________________________________________________
|                                                                   |
| The example config can be found in /etc/xdg/eww                   |
|                                                                   |
| For better experience, please write your own config.              |
| WIKI: https://elkowar.github.io/eww/configuration.html            |
|                                                                   |
|___________________________________________________________________|"
}
