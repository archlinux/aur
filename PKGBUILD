# Maintainer : Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

# I might create packages for earlier versions and REST interface later
# It would seem that their git repo is not updated outside of actual releases,
# so no rappiddisk-dkms-git package

_pkgbase=rapiddisk
pkgname=${_pkgbase}-dkms
_vermajor=4
_verminor=0
_verrevision=2
pkgver=${_vermajor}.${_verminor}.${_verrevision}
pkgrel=1
pkgdesc="A collection of open source and enhanced Linux RAM drive and caching modules"
arch=('i686' 'x86_64')
url="http://www.rapiddisk.org/"
license=('GPL2')
depends=('dkms'
         'zlib'
         'cryptsetup')
install=${pkgname}.install
_gitrepo=${_pkgbase}-${_vermajor}.x
_gitcommit=8284699a529e6a72ee0fbef90457d3819a1e2cb7
source=("git+http://git.rapiddisk.org/${_gitrepo}.git#commit=${_gitcommit}"
        'Makefile.dkms.in'
        'dkms.conf.in')
md5sums=('SKIP'
         '8c2d495a0da7939300c8e981cc6186e4'
         'e09ac0d71fe2f49666c5121f0d0eb194')
backup=("etc/${_pkgbase}/${_pkgbase}.sh.pacemaker"
        "etc/${_pkgbase}/${_pkgbase}.sh.rgmanager")

build() {
    cd ${srcdir}/${_gitrepo}

    # create dkms.conf
    sed -e "s/@PKGBASE@/$_pkgbase/; s/@PKGVER@/$pkgver/" < ${srcdir}/dkms.conf.in > module/dkms.conf

    # create dkms Makefile
    sed -e "s/@PKGBASE@/$_pkgbase/; s/@PKGVER@/$pkgver/" < ${srcdir}/Makefile.dkms.in > module/Makefile

    # build package
    pushd src; make DESTDIR=${pkgdir}; popd

    # gzip manpages
    gzip -c doc/${_pkgbase}.1 > doc/${_pkgbase}.1.gz

}

package() {

    cd ${srcdir}/${_gitrepo}

    # standard installation
    pushd src; make DESTDIR=${pkgdir} install; popd
    pushd conf; make DESTDIR=${pkgdir} install; popd
    pushd module; make DESTDIR=${pkgdir} install; popd

    # Arch's /sbin is a symbolic link to /usr/bin
    mv ${pkgdir}/sbin ${pkgdir}/usr/bin

    # copy documentation
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" \
        doc/${_pkgbase}.1.gz
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/" \
        README \
        module/${_pkgbase}.txt

}
