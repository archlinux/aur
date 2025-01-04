# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

_pkgbase=discordrp-mpris
pkgname="${_pkgbase}-git"
pkgver=0.3.3.r0.g911aa5a
pkgrel=2
pkgdesc="Discord Rich Presence based on mpris2 media players"
arch=(any)
url=https://github.com/FichteFoll/discordrp-mpris
license=(MIT)
depends=(python python-pytoml python-dbussy-git)
makedepends=(python-build python-installer python-wheel python-setuptools git)
optdepends=('cmus: C* Music Player (native mpris support)'
            'mpdris2: mpris plugin for mpd'
            'mpd-mpris: mpris plugin for mpd'
            'mpv-mpris: mpris plugin for mpv'
            'vlc: VLC Media Player (native mpris support)')
provides=($_pkgbase)
conflicts=($_pkgbase)
source=("${_pkgbase}::git+https://github.com/FichteFoll/discordrp-mpris.git")
sha256sums=(SKIP)

pkgver() {
    cd $_pkgbase
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd $_pkgbase
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgbase
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 systemd/discordrp-mpris.service "${pkgdir}/usr/lib/systemd/user/discordrp-mpris.service"
}
