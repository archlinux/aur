#Maintainer:	AImixAE <aimixae@outlook.com>
#Contributor:	Giteeajake <giteeajake@qq.com>

pkgname=gcc-kawaii-plugin-zh
pkgver=0.3.0.r0.g3ea53dc
pkgrel=1
pkgdesc='a gcc plugin and make your GCC	kawaii :)'
arch=('any')
url="https://github.com/Bill-Haku/kawaii-gcc"
license=('GPL-3.0-or-later')
depends=('gcc' 'gettext' 'noto-fonts-cjk')
optdepends=('wqy-zenhei: fonts support'
    'wqy-microhei: fonts support')
source=("${pkgname}::git+${url}")
install="${pkgname}.install"
sha256sums=(SKIP)

version() {
    cd "${srcdir}/${pkgname}"

    git describe --tags --long |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    make
}

check() {
    if [[ ! -f ${srcdir}/${pkgname}/build/zh-kawaii.mo ]]; then
        exit 1
    fi
}

package() {
    # clean no need
    rm -rf ${srcdir}${pkgname}/build/ja-kawaii.mo
    rm -rf ${srcdir}${pkgname}/build/zh-origin.mo

    #backup
    install -d "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES"

    if [[ -f /usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo ]]; then
        install -Dm644 /usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo \
            "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo.bak"
    fi

    install -Dm644 "$srcdir/$pkgname/build/zh-kawaii.mo" \
        "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo"
}
