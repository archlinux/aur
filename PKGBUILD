# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=tinyfecvpn-git
pkgver=r76.7e2c06a
pkgrel=2
pkgdesc="A Lightweight VPN with Build-in Forward Error Correction Support"
arch=('x86_64')
url="https://github.com/wangyu-/tinyfecVPN"
license=('MIT')
provides=("tinyfecvpn")
conflicts=("tinyfecvpn")
makedepends=('git' 'make' 'gcc')
source=("${pkgname}::git://github.com/wangyu-/tinyfecvpn.git"
        "conf.json"
        "runtinyfecvpn"
        "tinyfecvpn.install"
        "tinyvpn.service")
noextract=()
sha256sums=('SKIP'
            "86a54964f05ab480251b3906c9618d3818a0f2b3d6ec8a0ec62c125a108439e8"
	    "be76c06962fdf06a7d8c7ced6eadd703207aaba5d3761d9c9dc55322ff451534"
            "645393e08311063a81e91ab7972768c5059f29f601ac5b7858242066f29928f2"
	    "f7a46223bd04ed6e5552aee14079c6ae9165796da41d38b7e98af7914583d4ef")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init
}

build() {
    cd "${srcdir}/${pkgname}"
    make nolimit 
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 tinyvpn "${pkgdir}/usr/bin/tinyvpn"
    cd "${srcdir}"
    install -D -m 644 tinyvpn.service "${pkgdir}/usr/lib/systemd/system/tinyvpn.service"
    install -D -m 644 conf.json "${pkgdir}/usr/share/doc/tinyfecvpn/conf.json"
    install -D -m 644 conf.json "${pkgdir}/etc/tinyfecvpn/conf.json"
    install -D -m 755 runtinyfecvpn "${pkgdir}/usr/bin/runtinyfecvpn"
}
