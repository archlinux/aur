# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=iyuuplus
pkgname="${_pkgname}-git"
pkgver=20241015.220947
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
            'e20db7d3e6cdaa5f3b345bde4bd63cde2458b23516c80cfebcf0a32ec19d921c'
            'e64af1d0d088fa30e864897a43597026ee95f5e2590e79ac4055786795c60622'
            '4c0928194248ce56deab7a1eeec78d4a3827d7e8fbceba142b46d4f9c8eed387')
options=(!strip !debug)

prepare() {
    cd "${_pkgname}"
    sed -i 's|<button .\+git_pull.\+通过git拉取最新代码.\+</button>||' plugin/admin/app/view/index/dashboard.html
    sed -i "s|current_git_commit()|\"$(git rev-parse --short HEAD)\"|" plugin/admin/app/controller/IndexController.php
    local tag_latest="$(git tag --sort=committerdate | tail -1 | sed 's|v||')"
    if [[ $(vercmp "$tag_latest" "$(cat .version)") -eq 1 ]]; then
        echo "$tag_latest" > .version
    fi
}

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

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/srv/${_pkgname}/start.php"     "${pkgdir}/usr/bin/${_pkgname}"
}
