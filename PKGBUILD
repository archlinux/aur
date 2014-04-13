# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=1.9.2
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
md5sums=('863ee49f52bda17810ab1b94a52f8c95'
         'e1977ddd9ad7a1b6a4a49be173f594dc'
         '07bab61d808af1ff79e65e924c588df9'
         '09e0f347aa2f1c7cf10125f836340949')
_pythonver='2.7.6-1'

if [ "$CARCH" == "i686" ]; then
    _pkgarch="x86"
    _pythonver='2.7.6-0'
    md5sums[0]='c8f72746dd5dc68f014d5fccd1f060e8'
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
    CONDA_INSTALL="$prefix/pkgs/conda-3.4.1-py27_0/lib/python2.7/site-packages/conda/install.py"
    $prefix/pkgs/python-${_pythonver}/bin/python -E $CONDA_INSTALL --prefix=$prefix --instdir=/opt/${pkgname} --pkgs-dir=$prefix/pkgs --link-all || exit 1
}
