_name='papirus-icon-theme'
pkgname="${_name}-stripped-git"
pkgver=20211201.r3.g3bdf382
pkgrel=1
pkgdesc="Papirus icon theme, stripped to only base variations."
url="https://github.com/PapirusDevelopmentTeam/${_name}"
arch=('any')
license=('GPL3')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

pkgver() {
    cd "${srcdir}/repo"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"

    if [ ! -d "repo" ]; then
        git clone --bare --filter=tree:0 "${url}" "repo"
    fi

    cd "repo"

    git fetch -f origin master:master
}

package() {
    cd "${srcdir}/repo"

    export GIT_WORK_TREE=$(install -dm755 "${pkgdir}/usr/share/icons" && echo "$_")
    git sparse-checkout set "/Papirus" "/Papirus-Dark"
    git checkout

    export GIT_WORK_TREE=$(install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && echo "$_")
    git sparse-checkout set "/LICENSE"
    git checkout
}
