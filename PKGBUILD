# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=emilien-jegou
_gitname=oyui
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="Modern TUI merge tool and interactive diff editor for Jujutsu (jj) and Git"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_gitname}")

makedepends=('patchelf')
depends=('glibc' 'libgcc')

options=(!strip)

source=("THEMES-${pkgver}.md::${_ghurlraw}/docs/themes.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('cd62106acad7264dd4e59fbcc676a4de5df6d09be8b5f2d0ed8bb5c8a33d9050')
sha256sums_x86_64=('f2709e62ea65eea6c425d50d254ded267cd0a7d6d42d34a7704bf2982c739570')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

prepare() {
	cd "${srcdir}/" || exit

	_appdir="${_gitname}-${_gitversion}-${_CARCH}"

	patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${_appdir}/${_appname}"
}

package() {
	cd "${srcdir}/" || exit

	_appdir="${_gitname}-${_gitversion}-${_CARCH}"

	install -Dm755 "${_appdir}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "THEMES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/THEMES.md"
}
