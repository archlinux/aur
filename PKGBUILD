# Maintainer: raprism <ra.prism@gmail.com>

_reposite=codeberg.org
_repouser=gwh
_repoproj=x50ng
_pkgtagname=2.5.999
_repourl=https://${_reposite}/${_repouser}/${_repoproj}
_repoarchive=${_pkgtagname}.tar.gz
_repourlarchive=${_repourl}/archive/${_repoarchive}
_sub1name=ui4x
_sub1url=https://${_reposite}/${_repouser}/${_sub1name}
_sub1archive=0a3384f0af.tar.gz
_sub1urlarchive=${_sub1url}/archive/${_sub1archive}
_patch1=Makefile.patch

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
        "${_patch1}")
sha256sums=('b398d80ad04b236f07fcab8cded9a772c819e11f586cd588d5a68e7eee93e4f8'
            'b729977ee170c2f29f23d202a7ed9328f7ced2b91fcf1e9eb825691e67b34dd5'
            '824cd0c6e9c72a2c190cf9270239ff2331e9f3192fe1fab4e41d87cd2fcedeb3')

prepare() {
    patch -d "${_repoproj}" -Np1 -i ../"${_patch1}"
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
