# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=(league-rpc-linux-git)
_srcname=${pkgname%-git}
pkgver=1.0.3.r0.g98dca74
pkgrel=1
pkgdesc="League of Legends Discord Rich Presence for Linux (WINE / Lutris)"
arch=('x86_64')
url="https://github.com/Its-Haze/league-rpc-linux"
license=('GPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
depends=('python-pypresence' 'python-psutil' 'python-requests' 'python-nest-asyncio' 'python-lcu-driver')
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
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_srcname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir "${pkgdir}/usr/bin"
    echo -e "#!/bin/sh\nexec python -m league_rpc_linux \$@" > "${pkgdir}/usr/bin/league_rpc_linux"
    chmod +x "${pkgdir}/usr/bin/league_rpc_linux"
}