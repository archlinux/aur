# Maintainer: Johnny Nielsen <j_e_n_pub at yahoo dot dk>
pkgname='archupgrade'
pkgver=1.0.9
pkgrel=1
pkgdesc="Automatic Arch Linux Upgrade"
arch=('any')
url="https://github.com/Johnny1000/${pkgname}.git"
license=('custom')
depends=('python>=3.5' 'pacman' 'sudo')
#gettext is required for msgfmt to generate .mo files from .po files.
makedepends=('gettext')
install=$pkgname.install
source=("https://github.com/Johnny1000/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0a5297c1e8fb1142a9c6596cac3356ee')

package() {
    srcdir=${srcdir}/${pkgname}-${pkgver}
    #Copy source directories to package directory.
    cp -pR ${srcdir}/{etc,usr} ${pkgdir}
    #Make sure that ${pkgdir}/etc/sudoers.d/ is mode 750
    chmod 750 ${pkgdir}/etc/sudoers.d/
    #Make sure that ${pkgdir}/etc/sudoers.d/archupgrade is mode 440
    chmod 440 ${pkgdir}/etc/sudoers.d/archupgrade
    #Generate localisation files in the package directory.
    _L10NDIR=$(dirname $(find ${srcdir} -name ${pkgname}.pot))
    for _POFILE in ${_L10NDIR}/*.po; do
        _LANGUAGE=$(basename ${_POFILE} .po)
        mkdir -p ${pkgdir}/usr/share/locale/${_LANGUAGE}/LC_MESSAGES/
        msgfmt -o ${pkgdir}/usr/share/locale/${_LANGUAGE}/LC_MESSAGES/${pkgname}.mo ${_L10NDIR}/${_LANGUAGE}.po
    done
    #makepkg automatically gzip's man pages and info pages.
    #Copy license file to package directory.
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    cp -p ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}
