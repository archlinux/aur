#
# Maintainer: Grey Christoforo <first name at last name dot net>
#

pkgbase="spl-dkms-rc"
pkgname=("spl-dkms-rc" "spl-utils-rc")
_pkgver=0.7.0-rc5
_pkgver_base=${_pkgver%-*}
pkgver=${_pkgver//-rc/.}
pkgrel=2
license=('GPL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${_pkgver}/spl-${_pkgver}.tar.gz"
        "spl-utils.hostid")
sha256sums=('a5870148a07ecea5f29a7ac0a02dc982f73cd514ea4b40f374baee01f239735e'
            'ad95131bc0b799c0b1af477fb14fcf26a6a9f76079e48bf090acb7e8367bfd0e')

build() {
    cd "${srcdir}/spl-${_pkgver_base}"
    ./autogen.sh

    _at_enable=""
    [ "${CARCH}" == "i686"  ] && _at_enable="--enable-atomic-spinlocks"

    ./configure --prefix=/usr \
                --libdir=/usr/lib \
                --sbindir=/usr/bin \
                --with-config=user \
                ${_at_enable}

    make
}

package_spl-dkms-rc() {
    pkgdesc="Solaris Porting Layer kernel modules -- release candidates"
    depends=("dkms" "spl-utils-rc=${pkgver}-${pkgrel}")
    provides=("spl")
    conflicts=("spl-git" "spl-lts" "spl-dkms")
    install=spl.install

    dkmsdir="${pkgdir}/usr/src/spl-${pkgver}"
    install -d "${dkmsdir}"
    cp -a "${srcdir}/spl-${_pkgver_base}/." ${dkmsdir}

    cd "${dkmsdir}"
    make clean distclean
    find . -name ".git*" -print0 | xargs -0 rm -fr --
    scripts/dkms.mkconf -v ${pkgver} -f dkms.conf -n spl
    chmod g-w,o-w -R .
}

package_spl-utils-rc() {
    pkgdesc="Solaris Porting Layer kernel module support files -- release candidates"
    conflicts=("spl-utils-git" "spl-utils-lts spl-utils")

    cd "${srcdir}/spl-${_pkgver_base}"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
