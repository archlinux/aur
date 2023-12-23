# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=(league-rpc-linux-git)
_srcname=${pkgname%-git}
pkgver=0.0.8.r0.2759805
pkgrel=1
pkgdesc="League of Legends Discord Rich Presence for Linux (WINE / Lutris)"
arch=('x86_64')
url="https://github.com/Its-Haze/league-rpc-linux"
license=('GPL3')
makedepends=('git' 'python-pypresence' 'python-psutil' 'python-requests' 'pyinstaller')
provides=('league-rpc-linux')
conflicts=('league-rpc-linux')
source=("$_srcname"::'git+https://github.com/Its-Haze/league-rpc-linux.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
	cd "${srcdir}/${_srcname}"
    pyinstaller --onefile --name $_srcname league_rpc_linux/__main__.py --clean
}

package() {
	install -Dm755 "${srcdir}/${_srcname}/dist/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}