# Maintainer: raprism <ra.prism@gmail.com>

_reposite=codeberg.org
_repouser=gwh
_repoproj=x50ng
_pkgtagname=2.7.1
_repourl=https://${_reposite}/${_repouser}/${_repoproj}
_repoarchive=${_pkgtagname}.tar.gz
_repourlarchive=${_repourl}/archive/${_repoarchive}
_sub1name=ui4x
_sub1tagname=1.1.1
_sub1url=https://${_reposite}/${_repouser}/${_sub1name}
_sub1archive=${_sub1tagname}.tar.gz
_sub1urlarchive=${_sub1url}/archive/${_sub1archive}
#_patch1=Makefile.patch

pkgname=${_repoproj}
pkgver=${_pkgtagname}
pkgrel=1
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
sha256sums=('dae5c2f66479ff7d12aede06f0a03f6f7c53732b3fa67dbbbcfb081d35c040c3'
            '2e1522a5e498c10313dfa3ef53d2f51e63a66fe8ac5723b2d49b6c0244296f94')

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
