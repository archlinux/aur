pkgname=papirus-icon-theme-stripped-git
pkgver=20221201.r0.g98a2dc9
pkgrel=1
pkgdesc="Papirus icon theme, stripped to only base (default + dark) variations."
_name="${pkgname%-*-*}"
url="https://github.com/PapirusDevelopmentTeam/${_name}"
arch=('any')
license=('GPL3')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

pkgver() {
    cd "repo"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    if [ ! -d "repo" ]; then
        git clone --bare --filter=tree:0 --single-branch "${url}" "repo"
    fi

    cd "repo"
    git fetch -f
    git reset --soft FETCH_HEAD
}

package() {
    local icons="${pkgdir}/usr/share/icons"
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${icons}" "${licenses}"

    cd "repo"
    (
        export GIT_WORK_TREE="${icons}"
        git sparse-checkout set --no-cone "/Papirus" "/Papirus-Dark"
        git checkout -f
    )
    (
        export GIT_WORK_TREE="${licenses}"
        git sparse-checkout set --no-cone "/LICENSE"
        git checkout -f
    )
}
