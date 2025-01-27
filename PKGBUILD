# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: arshlinux
pkgname=flood-git
_pkgname=flood
pkgver=4.9.0.r2.g0931304
pkgrel=1
pkgdesc='A modern web UI for various torrent clients with a Node.js backend and React frontend.'
url='https://github.com/jesec/flood'
license=('GPL-3.0-only')
arch=('any')
depends=('nodejs')
makedepends=('git' 'pnpm')
optdepends=('mediainfo')
backup=('etc/conf.d/flood')
provides=('nodejs-flood')
conflicts=('nodejs-flood')
source=("${_pkgname}::git+https://github.com/jesec/flood"
        'flood.service'
        'flood.sysusers'
        'flood.tmpfiles'
        'flood.sh'
        'flood.conf.d')
install=flood.install
sha256sums=('SKIP'
            '882ae5fb69bf157783d7f2bc14104e174f6f10abe3ccea71404f88aa1cc7680a'
            '351d9475fb25c43285f56b123d4415cd4a4bc5bebbc0c6cbe8be046031eb6900'
            'dee6aef8405bd527424c7ce44c3150fdd3aaaa2c8fcb9f9a57fb5d06e2b4402c'
            'd632f408d2ef9c61fe6a34d5480a96b5439b1bfdc2db9c45aaed7670b711bbb0'
            'be0107f09eb7e7e913b435e15e0020de483dbd133ad7ea17546b90fe43656e17')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    pnpm i --cache "${srcdir}/npm-cache" --frozen-lockfile
    pnpm run build
}

package() {
    install -dm755 "${pkgdir}/usr/lib/flood"
    install -D -m 644 "${srcdir}/${_pkgname}/package.json" "${pkgdir}/usr/lib/flood/"
    install -D -m 644 "${srcdir}/${_pkgname}/pnpm-lock.yaml" "${pkgdir}/usr/lib/flood/"

    cd "${pkgdir}/usr/lib/flood/"
    pnpm i --prod --cache "${srcdir}/npm-cache" --ignore-scripts --frozen-lockfile

    cp -r "${srcdir}/${_pkgname}/dist"/* "${pkgdir}/usr/lib/flood/"

    install -D -m 755 "${srcdir}/flood.sh" "${pkgdir}/usr/bin/flood"

    find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    install -Dm644 "${srcdir}/flood.service" "${pkgdir}/usr/lib/systemd/system/flood.service"
    install -Dm644 "${srcdir}/flood.sysusers" "${pkgdir}/usr/lib/sysusers.d/flood.conf"
    install -Dm644 "${srcdir}/flood.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/flood.conf"
    install -Dm644 "${srcdir}/flood.conf.d" "$pkgdir/etc/conf.d/flood"

    # This doesn't save us much but oh well
    # Thanks Nicola (https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/atom)
    find "${pkgdir}"/usr/lib/flood/node_modules \
        -name "*.a" -exec rm '{}' \; \
        -or -name "*.bat" -exec rm '{}' \; \
        -or -name "*.c" -exec rm '{}' \; \
        -or -name "*.cpp" -exec rm '{}' \; \
        -or -name "*.node" -exec chmod a-x '{}' \; \
        -or -name "benchmark" -prune -exec rm -r '{}' \; \
        -or -name "doc" -prune -exec rm -r '{}' \; \
        -or -name "html" -prune -exec rm -r '{}' \; \
        -or -name "man" -prune -exec rm -r '{}' \; \
        -or -name "scripts" -prune -exec rm -r '{}' \; \
        -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
        -or -path "*/task-lists/src" -prune -exec rm -r '{}' \;
}
