# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=2.1.0
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
sha256sums=('191fbf290747614929d0bdd576e330c944b22a67585d1c185e0d2b3a3e65e1c0'
            'daa57ca4a3d8dd7529955c7a464de7c7697d20fcec8ed3311fad0ee50c2e8c42'
            'cd48b4fe409af96ee7e4cfb37385b3c798ded69dfbe918e66f7280995ed7f94d'
            '6f2ad360b712addab3aaaabee4cb8616a5512b736b418ef506e02d15c0177372')
_pythonver='2.7.8-1'
_condaver='3.7.0'

_pkgarch=`uname -m`
if [ "$CARCH" == "i686" ]; then
    _pkgarch="x86"
    sha256sums[0]='fd70c08719e6b5caae45b7c8402c6975a8cbc0e3e2a9c4c977554d1784f28b72'
    source[0]="http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-${pkgver}-Linux-${_pkgarch}.sh"
fi

prepare() {
    cd ${srcdir}
    patch --follow-symlinks -p1 < installer_sh_${_pkgarch}.patch
}

package() {
    prefix=${pkgdir}/opt/${pkgname}
    bash ${srcdir}/Anaconda-${pkgver}-Linux-${_pkgarch}.sh -b -p $prefix 2>/dev/null
    cd $prefix
    patch -p1 < $srcdir/conda_install.patch
    CONDA_INSTALL="$prefix/pkgs/conda-${_condaver}-py27_0/lib/python2.7/site-packages/conda/install.py"
    $prefix/pkgs/python-${_pythonver}/bin/python -E $CONDA_INSTALL --prefix=$prefix --instdir=/opt/${pkgname} --pkgs-dir=$prefix/pkgs --link-all || exit 1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
