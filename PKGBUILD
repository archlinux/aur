# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=1.9.1
pkgrel=1
_pkgarch=`uname -m`
pkgdesc="Completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing."
url="https://store.continuum.io/cshop/anaconda/"
license=("custom")
arch=('i686' 'x86_64')
source=("http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-${pkgver}-Linux-x86_64.sh"
        "installer_sh_x86_64.patch"
        "installer_sh_x86.patch"
        "conda_install.patch")
options=(!strip)
md5sums=('9d973e9ac715ce3241c3785704565971'
         'ef057ee3cfe743247ded78779724a371'
         '56d8efdaf010862a34cb3d3c36e9f78c'
         'd11da4f9cf90c82c7a37a02531de3797')
pythonver='2.7.6-1'

if [ "$CARCH" == "i686" ]; then
    _pkgarch="x86"
    pythonver='2.7.6-0'
    md5sums[0]='f1505963a1c7d2bfe7a73c079b22762d'
    source[0]="http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-${pkgver}-Linux-${_pkgarch}.sh"
fi

prepare() {
    patch --follow-symlinks -p1 < installer_sh_${_pkgarch}.patch
}

package() {
    chmod +x $srcdir/Anaconda-${pkgver}-Linux-${_pkgarch}.sh
    cd ${srcdir}
    prefix=${pkgdir}/opt/${pkgname}
    ${srcdir}/Anaconda-${pkgver}-Linux-${_pkgarch}.sh -b -p $prefix 2>/dev/null
    cd $prefix
    patch -p1 < $srcdir/conda_install.patch
    CONDA_INSTALL="$prefix/pkgs/conda-3.0.6-py27_0/lib/python2.7/site-packages/conda/install.py"
    $prefix/pkgs/python-${pythonver}/bin/python -E $CONDA_INSTALL --prefix=$prefix --instdir=/opt/${pkgname} --pkgs-dir=$prefix/pkgs --link-all || exit 1
}
