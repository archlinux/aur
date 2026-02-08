# Maintainer: raprism <ra.prism@gmail.com>

_reposite=codeberg.org
_repouser=gwh
_repoproj=x50ng
_pkgtagname=2.5.9999
_repourl=https://${_reposite}/${_repouser}/${_repoproj}
_repoarchive=${_pkgtagname}.tar.gz
_repourlarchive=${_repourl}/archive/${_repoarchive}
_sub1name=ui4x
_sub1url=https://${_reposite}/${_repouser}/${_sub1name}
_sub1archive=0f36b1e96c.tar.gz
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
sha256sums=('508158eece3c1cb0be3207e9bd7438293bccb0f2051076ad3620a782ab552698'
            '8f908d1c425474197d84f2722b5f76e8a128c87e0c78284261890868ba760171')

prepare() {
    #patch -d "${_repoproj}" -Np1 -i ../"${_patch1}"
    cd "${_repoproj}/src"
    _sub1dir=${_sub1name}
    [[ -z "$(ls -A \"${_sub1dir}\")" ]] && \
        ( rmdir ${_sub1dir} && ln -s ../../${_sub1name} . )
}

build() {
	cd "${_repoproj}"
	make distclean && make CFLAGS= INSTALL_PREFIX=/usr
}

package() {
	cd "${_repoproj}"
        make DESTDIR="${pkgdir}/" DOCDIR=/usr/share/doc/${pkgname} install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
