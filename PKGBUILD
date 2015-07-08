#
# Maintainer: isiachi <isiachi@rhyeworld.it>
#

pkgbase="spl-dkms-git"
pkgname=("spl-dkms-git" "spl-utils-dkms-git")
pkgver=0.6.4.2
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

package_spl-dkms-git() {
    pkgdesc="Solaris Porting Layer kernel modules."
    depends=("dkms" "spl-utils-dkms-git=${pkgver}-${pkgrel}")
    provides=("spl-git")
    conflicts=("spl-lts")
    install=spl.install
    
    install -d ${pkgdir}/usr/src
    cp -a ${srcdir}/spl ${pkgdir}/usr/src/spl-${_dirver}
    rm -rf ${pkgdir}/usr/src/spl-${_dirver}/.git
    rm -f ${pkgdir}/usr/src/spl-${_dirver}/.gitignore
    
}

package_spl-utils-dkms-git() {
    pkgdesc="Solaris Porting Layer kernel module support files."
    makedepends=("git")
    provides=("spl-utils-git")
    conflicts=("spl-utils-lts")

    cd "${srcdir}/spl"
    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}"/spl-utils.hostid "${pkgdir}"/etc/hostid
}
