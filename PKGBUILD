# Maintainer: zer0def <zer0def on freenode>
pkgname=audisp-json-git
pkgver=2.2.5.r1.ab9ed20
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
            'a030b546ed42f96ee13cdea6afb1a1f6bb625e03913a711b003c0dafdc52c0a86f42c19eb985df5dc2d98ded506ab7f8478319ab4d2b03eca51b913e94ee6477')

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
