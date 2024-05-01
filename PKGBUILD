# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=iyuuplus
pkgname="${_pkgname}-git"
pkgver=20240501.114620
pkgrel=1
pkgdesc="IYUU Auto Reseed Plus"
arch=("any")
url="https://github.com/ledccn/iyuuplus-dev"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("composer" "mariadb" "php-gd" "php-sodium")
makedepends=("git")
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('SKIP'
            '583af3140d9ac207b8d0151063f0e8ee4f45ad0ba86be5b4fc9ec0428364e988'
            'e64af1d0d088fa30e864897a43597026ee95f5e2590e79ac4055786795c60622'
            '4c0928194248ce56deab7a1eeec78d4a3827d7e8fbceba142b46d4f9c8eed387')
options=(!strip !debug)

pkgver() {
    cd "${_pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_pkgname}"
    install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md              "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    rm -rf .dockerignore docker runtime windows.* gg.sh LICENSE README.md
    find . \( -iname ".git*" -o -iname "README.md" \) | sort | while read line; do rm -rf "$line"; done
    find . -type f -exec install -Dm644 {} "${pkgdir}/srv/${_pkgname}/"{} \;
    chmod 755 "${pkgdir}/srv/${_pkgname}/start.php"
}
