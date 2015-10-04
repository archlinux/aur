#
# Maintainer: isiachi <isiachi@rhyeworld.it>
#

pkgbase="spl-dkms"
pkgname=("spl-dkms" "spl-utils")
pkgver=0.6.5.2
pkgrel=1
license=('GPL')
makedepends=("git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("git+https://github.com/zfsonlinux/spl.git"
        "spl-utils.hostid")
md5sums=('SKIP'
         'a54f0041a9e15b050f25c463f1db7449')
#install=spl.install

_dirver="${pkgver}"
_gittag="spl-${pkgver}"

prepare() {
    cd "${srcdir}/spl"

    git checkout ${_gittag}
}

build() {
    cd "${srcdir}/spl"
    ./autogen.sh
    scripts/dkms.mkconf -v ${_dirver} -f dkms.conf -n spl
    
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
    replaces=("spl-dkms-git")
    install=spl.install
    
    install -d ${pkgdir}/usr/src
    cp -a ${srcdir}/spl ${pkgdir}/usr/src/spl-${_dirver}
    rm -rf ${pkgdir}/usr/src/spl-${_dirver}/.git
    rm -f ${pkgdir}/usr/src/spl-${_dirver}/.gitignore
    
}

package_spl-utils() {
    pkgdesc="Solaris Porting Layer kernel module support files."
    makedepends=("git")
    conflicts=("spl-utils-git" "spl-utils-lts")
    replaces=("spl-utils-dkms-git")

    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
