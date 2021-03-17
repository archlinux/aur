# Maintainer: Mahor1221 <mahorforuzesh at protonmail dot com>
_pkgname=nethogs-parser
pkgname=${_pkgname}-git
pkgver=r28.b465721
pkgrel=1
pkgdesc="A parser to summarize the nethogs trace mode output + nethogs.service that outputs logs in /var/lib/nethogs"
arch=('x86_64')
url="https://github.com/boopathi/nethogs-parser.git"
license=('MIT')
depends=("nethogs")
makedepends=("git" "go")
provides=("${_pkgname}" "nethogst")
conflicts=("${_pkgname}" "nethogst")
source=(
    "git+${url}"
    "nethogst.sh"
    "nethogs.service"
)
md5sums=('SKIP'
         '43e0fd92f60bf28c4213569006d9e20a'
         '6c240522737c0ed56cba6703c865f81c')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    go build -o ${_pkgname} hogs.go
}

package() {
    mkdir -p /var/lib/nethogs
    install -Dm755 "nethogst.sh" "${pkgdir}/usr/bin/nethogst"
    install -Dm777 "nethogs.service" "${pkgdir}/etc/systemd/system/nethogs.service"
    
    cd "${_pkgname}"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/"
}