_name='papirus-icon-theme'
pkgname="${_name}-stripped-git"
pkgver=20211101.r129.g16988262
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
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"

    if [ ! -d "repo" ]; then
        git clone --filter=tree:0 --sparse --no-checkout "${url}" "repo"
    fi

    cd "repo"

    git pull
    git sparse-checkout set "/Papirus" "/Papirus-Dark" "/LICENSE"
    git checkout "master"
}

package() {
    cd "${srcdir}/repo"

    install -dm755 "${pkgdir}/usr/share/icons" && cp -rt "$_" "Papirus" "Papirus-Dark"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
