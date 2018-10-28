#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgbase="spl-dkms"
pkgname=("spl-dkms" "spl-utils")
pkgver=0.7.9
pkgrel=1
license=('GPL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/spl.git#tag=spl-${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/spl"
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

package_spl-dkms() {
    pkgdesc="Solaris Porting Layer kernel modules."
    depends=("dkms" "spl-utils=${pkgver}-${pkgrel}")
    provides=("spl")
    conflicts=("spl-git" "spl-lts")

    dkmsdir="${pkgdir}/usr/src/spl-${pkgver}"
    install -d "${dkmsdir}"
    cp -a ${srcdir}/spl/. ${dkmsdir}

    cd "${dkmsdir}"
    make clean distclean
    find . -name ".git*" -print0 | xargs -0 rm -fr --
    scripts/dkms.mkconf -v ${pkgver} -f dkms.conf -n spl
    chmod g-w,o-w -R .
}

package_spl-utils() {
    pkgdesc="Solaris Porting Layer kernel module support files."
    conflicts=("spl-utils-git" "spl-utils-lts")

    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install
}
