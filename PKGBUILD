# Maintainer: raprism <ra.prism@gmail.com>

_reposite=codeberg.org
_repouser=gwh
_repoproj=x50ng
_pkgtagname=2.6.1
_repourl=https://${_reposite}/${_repouser}/${_repoproj}
_repoarchive=${_pkgtagname}.tar.gz
_repourlarchive=${_repourl}/archive/${_repoarchive}
_sub1name=ui4x
_sub1url=https://${_reposite}/${_repouser}/${_sub1name}
_sub1archive=c91ba871ba.tar.gz
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
sha256sums=('7f7cb6e4d81887fe0d29e1525286d9f9e40be2af1bcea4cd7321ea007bd38200'
            'd795fbce60f916c7e36742a2c9f011490c219c17998854b456419562d78c8e34')

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
