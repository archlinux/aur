# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=2.0.0
pkgrel=1
pkgdesc="Completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing."
arch=('x86' 'x86_64')
url="https://store.continuum.io/cshop/anaconda/"
license=("custom")
makedepends=('patch')
source=("http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-${pkgver}-Linux-x86_64.sh"
        "installer_sh_x86.patch"
        "installer_sh_x86_64.patch"
        "conda_install.patch")
options=(!strip)
sha256sums=('3aa27ddf4a0ba5046ba52b97da99e20eb0614273d905bd73e016852451908917'
            'a4242826556d8455338fe8a70632fe649b780b733adb453494b674ef1e96a112'
            '592f67f506e9c5c266b43e0c6a4630ec641ba7d682ad239707b808bb616a3bd0'
            '92161cc7c504ebfd52f6246ca4b8c253d90f68dd16317163aec414db78e3adfc')
_pythonver='2.7.6-2'

_pkgarch=`uname -m`
if [ "$CARCH" == "i686" ]; then
    _pkgarch="x86"
    sha256sums[0]='efb9d3987134d484d88a9d915437b1bd568d065b4fefbd538e0281694bd90888'
    source[0]="http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-${pkgver}-Linux-${_pkgarch}.sh"
fi

prepare() {
    cd ${srcdir}
    patch --follow-symlinks -p1 < installer_sh_${_pkgarch}.patch
}

package() {
    chmod +x $srcdir/Anaconda-${pkgver}-Linux-${_pkgarch}.sh
    prefix=${pkgdir}/opt/${pkgname}
    ${srcdir}/Anaconda-${pkgver}-Linux-${_pkgarch}.sh -b -p $prefix 2>/dev/null
    cd $prefix
    patch -p1 < $srcdir/conda_install.patch
    CONDA_INSTALL="$prefix/pkgs/conda-3.5.2-py27_0/lib/python2.7/site-packages/conda/install.py"
    $prefix/pkgs/python-${_pythonver}/bin/python -E $CONDA_INSTALL --prefix=$prefix --instdir=/opt/${pkgname} --pkgs-dir=$prefix/pkgs --link-all || exit 1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
