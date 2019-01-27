# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

_pkgbase=discordrp-mpris
# _name=${_pkgbase#python-}
pkgname="${_pkgbase}-git"
pkgver=0.2.1.r2.g94a3685
pkgrel=1
pkgdesc="Discord Rich Presence based on mpris2 media players"
arch=(any)
url="https://github.com/FichteFoll/discordrp-mpris"
license=('MIT')
depends=('python' 'python-setuptools' 'python-pytoml' 'python-dbussy-git')
makedepends=('git')
optdepends=('cmus: C* Music Player (native mpris support)'
            'mpdris2-py3-git: mpris plugin for mpd'
            'mpv-mpris: mpris plugin for mpv'
            'vlc: VLC Media Player (native mpris support)')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("git+https://github.com/FichteFoll/discordrp-mpris.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 systemd/discordrp-mpris.service "${pkgdir}/usr/lib/systemd/user/discordrp-mpris.service"
}
