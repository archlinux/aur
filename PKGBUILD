# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('shotcut')
_srcname='shotcut'
pkgdesc='Video editor'
pkgver='18.07'
_commit='2500d4a7ae707516fef7bcd35445e7db4dfc19a3'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.shotcut.org/'
license=('GPL3')

depends=(
    'qt5-base'
    'qt5-declarative'
    'qt5-graphicaleffects'
    'qt5-multimedia'
    'qt5-quickcontrols'
    'qt5-webkit'
    'qt5-websockets'
    'qt5-x11extras'
    'mlt'
    'movit'
    'ffmpeg'
    'libx264'
    'libvpx'
    'lame'
    'frei0r-plugins'
    'ladspa'
)
makedepends=('git' 'qt5-tools')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=(
    "${_srcname}::git+https://github.com/mltframework/shotcut.git#commit=${_commit}"
    'shotcut.desktop'
    'melt.patch'
)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    cd "${srcdir}/${_srcname}"

    git apply "${srcdir}/melt.patch"
}

build() {
    cd "${srcdir}/${_srcname}"

    qmake PREFIX='/usr' \
        QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
        QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make INSTALL_ROOT="${pkgdir}" install

    install -D --mode=644 "${srcdir}/shotcut.desktop" "${pkgdir}/usr/share/applications/shotcut.desktop"
}
