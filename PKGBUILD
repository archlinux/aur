# Maintainer: Aurelien Cedeyn <aurelien.cedeyn@gmail.com>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=clustershell
pkgver=1.9.3
pkgrel=2
pkgdesc='Python framework for efficient cluster administration'
arch=(any)
url='https://clustershell.github.io/clustershell/'
license=('LGPL-2.1-or-later')
depends=('python')
makedepends=('python-setuptools')
optdepends=(
    'openssh: Secure SHell client to connect to distant machines'
    'vim: Vi Improved'
    'bash-completion'
)
backup=(etc/clustershell/{clush.conf,groups.conf,groups.d/local.cfg})
changelog=ChangeLog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cea-hpc/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('94c97e8de4d701ceb953772a4cfd88b60323dd5b50bfd9ad765e92fe543303f3')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}
package(){
    cd "${pkgname}-${pkgver}"
    python setup.py install -O1 --skip-build --root="${pkgdir}"

    # config files
    install -d "${pkgdir}/etc/"
    mv -v "${pkgdir}/usr/etc/clustershell" "${pkgdir}/etc/"
    rmdir "${pkgdir}/usr/etc"

    # man pages
    install -d "${pkgdir}/usr/share/man/"{man1,man5}
    install -p -m 0644 doc/man/man1/clubak.1      "${pkgdir}/usr/share/man/man1/"
    install -p -m 0644 doc/man/man1/cluset.1      "${pkgdir}/usr/share/man/man1/"
    install -p -m 0644 doc/man/man1/clush.1       "${pkgdir}/usr/share/man/man1/"
    install -p -m 0644 doc/man/man1/nodeset.1     "${pkgdir}/usr/share/man/man1/"
    install -p -m 0644 doc/man/man5/clush.conf.5  "${pkgdir}/usr/share/man/man5/"
    install -p -m 0644 doc/man/man5/groups.conf.5 "${pkgdir}/usr/share/man/man5/"

    # bash-completion
    install -d "${pkgdir}/usr/share/bash-completion/completions/"
    install -p -m 0644 bash_completion.d/cluset "${pkgdir}/usr/share/bash-completion/completions/"
    install -p -m 0644 bash_completion.d/clush  "${pkgdir}/usr/share/bash-completion/completions/"

    # vim addons
    local vimdatadir=/usr/share/vim/vimfiles
    install -d "${pkgdir}/${vimdatadir}/"{ftdetect,syntax}
    install -p -m 0644 doc/extras/vim/ftdetect/clustershell.vim "${pkgdir}/${vimdatadir}/ftdetect/"
    install -p -m 0644 doc/extras/vim/syntax/clushconf.vim      "${pkgdir}/${vimdatadir}/syntax/"
    install -p -m 0644 doc/extras/vim/syntax/groupsconf.vim     "${pkgdir}/${vimdatadir}/syntax/"
}
