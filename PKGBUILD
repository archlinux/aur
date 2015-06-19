pkgname=('shotcut-git')
srcname='shotcut'
pkgdesc='Video editor'
pkgver='r1'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://github.com/mltframework/shotcut'
license=('GPL3')

depends=(
    'qt5-base'
    'qt5-declarative'
    'qt5-graphicaleffects'
    'qt5-multimedia'
    'qt5-quickcontrols'
    'qt5-webkit'
    'qt5-x11extras'
    'mlt'
    'ffmpeg'
    'libx264'
    'libvpx'
    'lame'
    'frei0r-plugins'
    'ladspa'
)
makedepends=('git')
provides=('shotcut')
conflicts=('shotcut')

source=(
    "${srcname}::git+https://github.com/mltframework/shotcut.git"
    'shotcut.desktop'
    'cutelogger.patch'
)
sha512sums=(
    'SKIP'
    '38aefcdfb092a53aac7d7989ea55f6e2d8ab581c7976291b476974aebf853169c40607301ef64612a62d5de30ae7a13de54cb9a91827568b216cb2b30b0501cf'
    'fe18194558fca8096643528d239f91d0f7c948e58c8297e0338d6905e4df3732dd915eecc8bd25a62b1fba9731f21fcabc8f4ec32e45c46b74b061f549fb1c6a'
)

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

prepare() {
    cd "${srcdir}/${srcname}"

    git apply "${srcdir}/cutelogger.patch"

    qmake PREFIX='/usr/'
}

build() {
    cd "${srcdir}/${srcname}"

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make INSTALL_ROOT="${pkgdir}" install

    install -D --mode=644 "${srcdir}/shotcut.desktop" "${pkgdir}/usr/share/applications/shotcut.desktop"
}
