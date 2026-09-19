# Maintainer: Joël Müller <mail@joelmueller.ch>

pkgname=dopeiptv-git
pkgver=1.2.11.r1.g5159386
pkgrel=1
pkgdesc='Linux IPTV player with Xtream Codes, M3U, EPG, timeshift, recording and multiview (git version)'
arch=('any')
url='https://github.com/slimture/dopeIPTV'
license=('GPL-3.0-or-later')

depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-mpv'
    'python-pychromecast'
    'mpv'
    'ffmpeg'
)

makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)

optdepends=(
    'vlc: external VLC playback'
)

provides=('dopeiptv')
conflicts=(
    'dopeiptv'
    'dopeiptv-bin'
)

source=(
    'dopeIPTV::git+https://github.com/slimture/dopeIPTV.git'
)

sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/dopeIPTV"

    git describe \
        --long \
        --tags \
        --abbrev=7 \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/dopeIPTV"

    python -m build \
        --wheel \
        --no-isolation
}

package() {
    cd "${srcdir}/dopeIPTV"

    python -m installer \
        --destdir="${pkgdir}" \
        dist/*.whl

    install -Dm644 dopeiptv.desktop \
        "${pkgdir}/usr/share/applications/dopeiptv.desktop"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
