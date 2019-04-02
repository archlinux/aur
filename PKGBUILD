# Maintainer: zer0def <zer0def on freenode>
pkgname=audisp-json-git
pkgver=2.2.4.r4.f8d754c
pkgrel=1
pkgdesc="Audisp plugin outputting auditd events as JSON."
url="https://github.com/gdestuynder/audisp-json"
arch=('any')
makedepends=('libtool')
depends=('audit' 'curl')
provides=('audisp-json')
conflicts=('audisp-json')
source=("${pkgname}::git+https://github.com/gdestuynder/audisp-json"
        'audisp-json.patch')
sha512sums=('SKIP'
            'bd09bdd5c4b138e3f51fd24e23c4a0d5066550c34bc2b6a91c7547c4d2fb24555a2b5b4adda712c3927dfd19b2acaa239d41f43ec4115ae9fc7ee31ad4fb94e8')

pkgver() {
    cd "${srcdir}/${pkgname}"
    GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
    printf '%s.r%s.%s' \
        "${GITTAG}" \
        "$(git rev-list --count ${GITTAG}..)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 < ${srcdir}/audisp-json.patch
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 "au-json.conf" "${pkgdir}/etc/audisp/plugins.d/au-json.conf"
    echo 'file_log = /var/log/audisp.json' > "${pkgdir}/etc/audisp/audisp-json.conf"
    install -Dm755 "audisp-json" "${pkgdir}/sbin/audisp-json"
}
