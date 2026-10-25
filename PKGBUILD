# Maintainer: Amish <contact at via dot aur>
# Maintainer: Morbius <archlinux@seichter.de>
# shellcheck shell=bash disable=2034,2154
pkgname=python-fangfrisch
_pkgname=${pkgname#python-}
pkgver=1.9.3
pkgrel=2
pkgdesc="Freshclam like utility that allows downloading unofficial virus definition files"
arch=('any')
license=("GPL-3.0-or-later")
url="https://rseichter.github.io/${_pkgname}/"
conflicts=('clamav-unofficial-sigs')
provides=('clamav-unofficial-sigs')
depends=('clamav' 'python-requests' 'python-sqlalchemy' 'sqlite')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rseichter/${_pkgname}/archive/${pkgver}.tar.gz"
        "${_pkgname}.conf"
        "${_pkgname}.service"
        "${_pkgname}.timer"
        "${_pkgname}.tmpfiles"
        "${_pkgname}-has-news.sh")
sha512sums=('cc7ac3a9a3510260f1b1eb759e40934147e1b5f2b28ec566cdf565c8f2fb7a7d7ac0c9a13de8b65d5c02e94893b1043dd4b02872386dd507a77d716b5a5870d2'
            'f269a25224ebc60bb0e63831ebd9aa8707af1bf48aaf680d7381d5c8674623b67cb86e5a9264e26fafacfd34d12dfa931d5cd949e6e9dd272646dbaa408a96ef'
            '1988863027be295df0f7138773dd6ff994eada9db5cd8bb3eeec4f9e5481f2bb39936953d16cd7ac2c3aa0a324d1ef83f7c2bbdbbf1272747190a22b285c8da2'
            '5f84e0009ae2f72387c1883e3cf35c1d62568863b37326de870d2320fd122a92f38d91ef3bdd9cf959e30571ed51ce1c092da589a19a2da16617ccebca58dd53'
            '9a875fc1ceeb29f5cc798123db845922ddb1b3c77dd03753f9daf39a2c3019d075ac86c82630386476ef828ebc67876842b8d3be22b90aba5b082540bfd024fd'
            'e0c57c8012035388434e1b8882582ace0fcfaf24fa21287760b9ac5fc0b9e022e8272d1d0bab491cce33fc32634cf5ad75b525041511e1029cc5f172cac925f8')
backup=("etc/${_pkgname}/${_pkgname}.conf")
install="${_pkgname}.install"

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    local tmp="${_pkgname}-${pkgver}/unittest.tmp"
    rm -rf "${tmp}" > /dev/null
    mkdir -p "${tmp}"
    # shellcheck disable=SC2064
    trap "rm -rf ${tmp}" EXIT
    sed -i -e "s,/tmp/${_pkgname}/unittest,${tmp},g" tests/*.*
    sqlite3 "${tmp}"/db.sqlite <tests/tests.sql
    PYTHONPATH=.:src python -m unittest discover -v tests/
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
    install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${_pkgname}".{service,timer}
    install -Dm0644 -t "${pkgdir}/etc/${_pkgname}" "${srcdir}/${_pkgname}.conf"
    install -Dm0750 -t "${pkgdir}/etc/${_pkgname}" "${srcdir}/${_pkgname}-has-news.sh"
}
