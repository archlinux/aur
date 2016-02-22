# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=2.5.0
pkgrel=1
pkgdesc="Completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing."
arch=('x86' 'x86_64')
url="https://store.continuum.io/cshop/anaconda/"
license=("custom")
makedepends=('patch')
source=("https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-${pkgver}-Linux-x86_64.sh"
        "installer_sh_x86.patch"
        "installer_sh_x86_64.patch"
        "conda_install.patch")
options=(!strip libtool)
sha256sums=('e10abf459cde4a838bd6fc5ca03023c3401b81ad470627acde5a298d56715321'
            '5cd27f17ac85831632a9992f68d88bf8955522f5d6351696a636100c2b1c5fa1'
            'f75c754a1893aeb2c999e0a278faec0dadb03fc0a99500f2ce15390b9dce04cd'
            '9d7f6fe1106a1c2c0727c0cca3c34861ef59de1f25a0702df9489595032d940e')
_pythonver='2.7.11-0'
_condaver='3.19.1'

_pkgarch=`uname -m`
if [ "$CARCH" == "x86" ]; then
    _pkgarch="x86"
    sha256sums[0]='4911047df51c46661f551d6022aee21a7e5d31df051d3433b8ff3ea3c2e771bb'
    source[0]="https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-${pkgver}-Linux-x86.sh"
fi

prepare() {
    cd ${srcdir}
    patch --follow-symlinks -p1 < installer_sh_${_pkgarch}.patch
}

package() {
    prefix=${pkgdir}/opt/${pkgname}
    bash ${srcdir}/Anaconda2-${pkgver}-Linux-${_pkgarch}.sh -b -p $prefix 2>/dev/null
    [ "$BREAK_EARLY" = 1 ] && exit 1
    cd $prefix
    patch -p1 < $srcdir/conda_install.patch
    CONDA_INSTALL="$prefix/pkgs/conda-${_condaver}-py27_0/lib/python2.7/site-packages/conda/install.py"
    $prefix/pkgs/python-${_pythonver}/bin/python -E -s $CONDA_INSTALL --prefix=$prefix --instdir=/opt/${pkgname} --file=conda-meta/.ilan || exit 1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
