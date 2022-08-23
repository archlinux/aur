# Maintainer: BGME <i@bgme.me>

pkgname=sing-box-git
_pkgname=sing-box
pkgver=20220823.1413c50
pkgrel=1
pkgdesc='The universal proxy platform.'
url='https://sing-box.sagernet.org/'
license=('GPL3')
arch=('x86_64')
makedepends=('git' 'go')
source=('git+https://github.com/SagerNet/sing-box.git'
        'sing-box.service'
        'sing-box@.service')
sha256sums=('SKIP'
            '2440db8da1e5751353bb2b28f0c70a1d84d7ade8054bab104356eddd293f701e'
            '914fa540686916ce6ad315f58baa9a9d29532e529fe25bbef13d3ead30edae87')

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