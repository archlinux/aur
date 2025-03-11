# Maintainer: Aurelien Cedeyn <aurelien.cedeyn@gmail.com>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname="clustershell"
pkgver=1.9.3
pkgrel=1
pkgdesc="Python framework for efficient cluster administration"
arch=(any)
url="http://cea-hpc.github.io/clustershell/"
license=('LGPL-2.1-or-later')
depends=('python')
makedepends=('python' 'python-setuptools')
optdepends=('openssh: Secure SHell client to connect to distant machines', 'vim: Vi Improved')
backup=(etc/clustershell/{clush.conf,groups.conf,groups.d/local.cfg})
changelog=ChangeLog
source=(https://github.com/cea-hpc/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('94c97e8de4d701ceb953772a4cfd88b60323dd5b50bfd9ad765e92fe543303f3')

build() {
    echo "Directory: ${srcdir}/${pkgname}-${pkgver}"
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}
package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install -O1 --skip-build --root="${pkgdir}"
    # config files
    install -d ${pkgdir}/etc/
    mv -v ${pkgdir}/usr/etc/clustershell ${pkgdir}/etc/

    # man pages
    install -d ${pkgdir}/usr/share/man/{man1,man5}
    install -p -m 0644 doc/man/man1/clubak.1 ${pkgdir}/usr/share/man/man1/
    install -p -m 0644 doc/man/man1/cluset.1 ${pkgdir}/usr/share/man/man1/
    install -p -m 0644 doc/man/man1/clush.1 ${pkgdir}/usr/share/man/man1/
    install -p -m 0644 doc/man/man1/nodeset.1 ${pkgdir}/usr/share/man/man1/
    install -p -m 0644 doc/man/man5/clush.conf.5 ${pkgdir}/usr/share/man/man5/
    install -p -m 0644 doc/man/man5/groups.conf.5 ${pkgdir}/usr/share/man/man5/
    install -D -m 0644 COPYING.LGPLv2.1 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local vimdatadir=/usr/share/vim/vimfiles
    cd ${srcdir}/${pkgbase}-${pkgver}
    # vim addons
    install -d ${pkgdir}/$vimdatadir/{ftdetect,syntax}
    install -p -m 0644 doc/extras/vim/ftdetect/clustershell.vim ${pkgdir}/${vimdatadir}/ftdetect/
    install -p -m 0644 doc/extras/vim/syntax/clushconf.vim ${pkgdir}/${vimdatadir}/syntax/
    install -p -m 0644 doc/extras/vim/syntax/groupsconf.vim ${pkgdir}/${vimdatadir}/syntax/
}
