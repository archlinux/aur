# Maintainer: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap-dcmtkcompat
_majorver=0.2.2
_minorver=beta1
pkgver="${_majorver}_${_minorver}"
pkgrel=7
pkgdesc="Medical image viewer and DICOM client. Compatible with parallel installation of the package 'dcmtk'."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/aeskulap"
license=('GPL')
depends=('libglademm' 'gconfmm' 'hicolor-icon-theme')
provides=("aeskulap=${pkgver}")
conflicts=("aeskulap")
makedepends=('perl-xml-parser' 'patch')
options=('!libtool')
install='aeskulap.install'
source=(
    "http://ponce.cc/slackware/sources/repo/aeskulap-${_majorver}-${_minorver}.tar.gz"
    "aeskulap-gcc.patch"
    "aeskulap.install"
)
md5sums=(
    '33a0f8659909426c67bebc10bd61b1d0'
    'ed39ad48d76bf8238c45a7b6e9c31b2e'
    '82b79fa6e730e17d0898fdadf78daf70'
)

_instdir="/opt/aeskulap"

build() {

    _extractdir="${srcdir}/aeskulap-${_majorver}-${_minorver}"

    cd "${_extractdir}" || return 10

    patch -Np0 -i "${srcdir}/aeskulap-gcc.patch" || return 11

    CFLAGS="${CFLAGS} -fpermissive"
    CXXFLAGS="${CXXFLAGS} -fpermissive"
    export CFLAGS
    export CXXFLAGS

    ./configure \
        --prefix="${_instdir}" \
        --with-gconf-schema-file-dir=/usr/share/gconf/schemas || return 12

    make || return "$?"
}

package() {

    _extractdir="${srcdir}/aeskulap-${_majorver}-${_minorver}"

    cd "${_extractdir}" || return 20

    make DESTDIR="${pkgdir}" install || return "$?"

    if [ "${_instdir}"x != "/usr/bin"x ]; then
        mkdir --parents "${pkgdir}/usr/bin"
        cd "${pkgdir}/usr/bin" && {
            ln -s "${_instdir}"/bin/aeskulap .
        } || return 22
    fi
}
