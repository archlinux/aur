#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgbase="spl-dkms"
pkgname=("spl-dkms" "spl-utils")
pkgver=0.6.5.6
pkgrel=1
license=('GPL')
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("https://github.com/zfsonlinux/zfs/releases/download/zfs-${pkgver}/spl-${pkgver}.tar.gz"
        "spl-utils.hostid")
sha256sums=('167595fe76eb5497c3a1ffe396b6300155d0cbe46d06824a710099ca1ae1b8bd'
            'ad95131bc0b799c0b1af477fb14fcf26a6a9f76079e48bf090acb7e8367bfd0e')

build() {
    cd "${srcdir}/spl-${pkgver}"
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
    install=spl.install

    dkmsdir="${pkgdir}/usr/src/spl-${pkgver}"
    install -d "${dkmsdir}"

    cd "${srcdir}"
    tar -xzf "spl-${pkgver}.tar.gz" -C "${dkmsdir}" --strip-components 1

    cd "${dkmsdir}"
    scripts/dkms.mkconf -v ${pkgver} -f dkms.conf -n spl
    chmod g-w,o-w -R .
}

package_spl-utils() {
    pkgdesc="Solaris Porting Layer kernel module support files."
    conflicts=("spl-utils-git" "spl-utils-lts")

    cd "${srcdir}/spl-${pkgver}"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
