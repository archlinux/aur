# Maintainer: raprism <ra.prism@gmail.com>

_reposite=codeberg.org
_repouser=gwh
_repoproj=x50ng
_pkgtagname=2.7.0
_repourl=https://${_reposite}/${_repouser}/${_repoproj}
_repoarchive=${_pkgtagname}.tar.gz
_repourlarchive=${_repourl}/archive/${_repoarchive}
_sub1name=ui4x
_sub1url=https://${_reposite}/${_repouser}/${_sub1name}
_sub1archive=5933080.tar.gz
_sub1urlarchive=${_sub1url}/archive/${_sub1archive}
#_patch1=Makefile.patch

pkgname=${_repoproj}
pkgver=${_pkgtagname}
pkgrel=2
pkgdesc='HP 50g hardware level emulator'
arch=('any')
url=${_repourl}
license=('GPL2')
depends=('gtk4' 'lua' 'ncurses' 'sdl3')
makedepends=('scdoc')
options=('!lto' '!debug')
install="${pkgname}.install"
source=("${_repourlarchive}"
        "${_sub1urlarchive}"
        #"${_patch1}"
        )
sha256sums=('b30657efcffbbfed61c0538adc733aa0252fa2282057e4a3b2f747a85efc9e44'
            'ef9966198c2ba4bde5323a743b3fc242adccfcce33a6f53874c84da26241e861')

prepare() {
    #patch -d "${_repoproj}" -Np1 -i ../"${_patch1}"
    cd "${_repoproj}/src"
    _sub1dir=${_sub1name}
    [[ -d ${_sub1dir} ]] && [[ -z "$(ls -A ${_sub1dir})" ]] && rmdir ${_sub1dir}
    ln -sf ../../${_sub1name} .
}

build() {
	cd "${_repoproj}"
	make distclean && make CFLAGS= PREFIX=/usr
}

package() {
	cd "${_repoproj}"
        make DESTDIR="${pkgdir}/" DOCDIR=/usr/share/doc/${pkgname} install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
