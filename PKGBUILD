# Maintainer: BGME <i@bgme.me>

pkgname=sing-box-git
_pkgname=sing-box
pkgver=20220824.83de044
pkgrel=1
pkgdesc='The universal proxy platform.'
url='https://sing-box.sagernet.org/'
license=('GPL3')
arch=('x86_64')
makedepends=('git' 'go')
source=('git+https://github.com/SagerNet/sing-box.git'
        'sing-box.service'
        'sing-box@.service')
sha1sums=('SKIP'
          'fe7c573632f4be36736ffc44515cfd5c05c6d58f'
          '281243584d0ddf80da8d598308bb499a3f53f874')
sha256sums=('SKIP'
            'e7c955916eef738e08fab5610ebcfb4a0db822ff56dfcc426ded6600b03727de'
            '6ba1c281e10bf14beb54a181572114caa0623350bf2928fd2dcd668535b778aa')

provides=("${_pkgname}")

backup=('etc/sing-box/config.json')

pkgver() {
    cd "${srcdir}/sing-box"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "${srcdir}/sing-box"
    make build
}

package() {
    pushd "${srcdir}"
        install -Dm 0644 "sing-box.service" "${pkgdir}/usr/lib/systemd/system/sing-box.service"
        install -Dm 0644 "sing-box@.service" "${pkgdir}/usr/lib/systemd/system/sing-box@.service"
    popd

    pushd "${srcdir}/sing-box"
        install -Dm 0755 "sing-box" "${pkgdir}/usr/bin/sing-box"
        install -Dm 0644 "release/config/config.json" "${pkgdir}/etc/sing-box/config.json"
        install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/licenses/sing-box/LICENSE"
    popd
}