# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=2.0.1
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
sha256sums=('074204fa26872b4a946123071d15b8390c0e5441352c6b65b2abd32511bff240'
            '01185e9dcf20506c0dd615a947fae85d8e3bed83426f5a6dec15b99a7ef0122f'
            'b3dffa8adaba6cad0375209819b9dcd166271bdac4a66425e73e74cc968cd210'
            '7b5a6654068a52e0b622d078d1d8bd8b614c6fa2f4bea9c26e7f1eb61f9150bb')
_pythonver='2.7.7-0'
_condaver='3.5.5'

_pkgarch=`uname -m`
if [ "$CARCH" == "i686" ]; then
    _pkgarch="x86"
    sha256sums[0]='e8ffc63f31673b5ce41a95796a1f729ddcf4c7db19d6dbe29bedaeaaf8478505'
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
    CONDA_INSTALL="$prefix/pkgs/conda-${_condaver}-py27_0/lib/python2.7/site-packages/conda/install.py"
    $prefix/pkgs/python-${_pythonver}/bin/python -E $CONDA_INSTALL --prefix=$prefix --instdir=/opt/${pkgname} --pkgs-dir=$prefix/pkgs --link-all || exit 1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
