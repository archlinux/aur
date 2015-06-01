# Maintainer : Skydrome <skydrome@i2pmail.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>

pkgname=tahoe-lafs-i2p
pkgver=1.10.0.post26
_patchver=1.10.0-r0
pkgrel=1
pkgdesc="Secure, decentralized, and fault-tolerant filesystem over the I2P network"
url='http://tahoe-lafs.org'
license=('GPL')
arch=('any')
conflicts=('tahoe-lafs')
provides=('tahoe-lafs')
BUILDENV+=(!check)

depends=('python2-twisted'
         'python2-foolscap-i2p'
         'python2-mock'
         'python2-pyopenssl>=0.14'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-crypto'
         'python2-cryptography'
         'python2-zope-interface'
         'python2-setuptools<0.8'
         'python2-characteristic'
         'python2-service-identity'
         'python2-numpy'
         'pycryptopp'
         'pyutil'
         'python2-simplejson'
         'python2-cffi'
         'python2-enum34'
         'python2-pycparser'
         'python2-six'
         'libffi'
         'net-tools' # provides /sbin/ifconfig
         'nevow'
         'zbase32'
         'zfec')

optdepends=('grid-updates: helps keep you up to date with latest grid news')

source=("https://tahoe-lafs.org/source/tahoe-lafs/snapshots/allmydata-tahoe-${pkgver}.tar.bz2"
        #"setuptools_fix.diff"
        #'0001-multiple-introducer-support.patch'
        #'0002-proxy-support.patch'
        #'0003-allow-non-routable.patch'
        'exclude_buildtest_package.patch'
        "http://killyourtv.i2p.us/tahoe-lafs/patches/tahoe-lafs-i2p-${_patchver}.patch"
        'tahoe-repair-all.sh')

sha256sums=('542830908e6deb66767ef98271bcf067f9787c0013b764caae23c7649b4f3171'
            #'6d37e7003bb91c07963a71fde217b5e4f5b6eb638f6d602d82dae7a13bcaf959'
            '469aa0ace523b64449e7d2d52958119a84032c50b07828b3dffbb81dca5327bd'
            '425456a08477da50ef1511ea1b24cc6a529c4abaae345a3da89a31c025d74b80'
            '1525fd5c2ac2c93844f23160e70bb47040a9a8ee7dff8b6fff8ca48b374ac216')

prepare() {
    cd "${srcdir}/allmydata-tahoe-${pkgver}"
    #patch -Np0 -i ../setuptools_fix.diff
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
