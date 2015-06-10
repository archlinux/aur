# Maintainer : Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>

pkgname=tahoe-lafs-i2p
pkgver=1.10.0.post26
_patchver=1.10.0-r0
pkgrel=2
pkgdesc="Secure, decentralized, and fault-tolerant filesystem over the I2P network"
url='http://tahoe-lafs.org'
license=('GPL')
arch=('any')
conflicts=('tahoe-lafs')
provides=('tahoe-lafs')
BUILDENV+=(!check)

depends=('openssl>=1.0.2'
         'python2-twisted>=13.0.0'
         'python2-mock>=1.0.1'
         'python2-pyopenssl>=0.14'
         'python2-pyasn1>=0.1.4'
         'python2-pyasn1-modules>=0.0.5'
         'python2-zope-interface>=4.0.5'
         'python2-characteristic>=14.3.0'
         'python2-service-identity>=14.0.0'
         'python2-cryptography'
         'pyutil>=1.9.4'
         'python2-simplejson>=3.1.3'
         'nevow>=0.11.1'
         'zbase32>=1.1.5'
         'zfec>=1.4.24'
         'pycryptopp>=0.6.0'
         'python2-cffi'
         'python2-enum34'
         'python2-pycparser'
         'python2-six'
         'libffi'
         'python2-foolscap-i2p'
         'net-tools' # provides /sbin/ifconfig
         'python2-setuptools'
         )

optdepends=('grid-updates: helps keep you up to date with latest grid news'
            'python2-numpy: reliability test')

source=("https://tahoe-lafs.org/source/tahoe-lafs/tarballs/allmydata-tahoe-${pkgver}.tar.bz2"
        "setuptools_fix.patch"
        #'0001-multiple-introducer-support.patch'
        #'0002-proxy-support.patch'
        #'0003-allow-non-routable.patch'
        'exclude_buildtest_package.patch'
        "http://killyourtv.i2p.me/tahoe-lafs/patches/tahoe-lafs-i2p-${_patchver}.patch"
        'tahoe-repair-all.sh')

sha256sums=('542830908e6deb66767ef98271bcf067f9787c0013b764caae23c7649b4f3171'
            'b410d6276466f9feb270ae3e27bc7bc1901effc5132a089ff88a98b7efe6895e'
            '469aa0ace523b64449e7d2d52958119a84032c50b07828b3dffbb81dca5327bd'
            '425456a08477da50ef1511ea1b24cc6a529c4abaae345a3da89a31c025d74b80'
            '1525fd5c2ac2c93844f23160e70bb47040a9a8ee7dff8b6fff8ca48b374ac216')

prepare() {
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    patch -Np1 -i ../setuptools_fix.patch
    if [[ ! -r "${srcdir}/tahoe-lafs-i2p-${_patchver}.patch" ]]; then
        for p in $(ls ${srcdir}/*.patch); do
            patch -Np1 -i $p
        done
    else
        patch -Np1 -i "${srcdir}/tahoe-lafs-i2p-${_patchver}.patch"
    fi
}

build(){
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    python2 setup.py build
}

check() {
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    msg "This may take a while"
    python2 bin/tahoe debug trial $MAKEFLAGS
}

package(){
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm755 "$srcdir/tahoe-repair-all.sh" "${pkgdir}/usr/bin/tahoe-repair-all"
}
