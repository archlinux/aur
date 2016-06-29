# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=4.1.0
pkgrel=1
pkgdesc="Completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing."
arch=('x86' 'x86_64')
url="https://store.continuum.io/cshop/anaconda/"
license=("custom")
makedepends=('patch')
source=("http://repo.continuum.io/archive/Anaconda2-${pkgver}-Linux-x86_64.sh"
        "installer_sh_x86.patch"
        "installer_sh_x86_64.patch"
        "conda_install.patch")
options=(!strip libtool)
sha256sums=('3b7e504ca0132fb555d1f10e174cae07007f1bc6898cad0f7d416a68aca01f45'
            '6c1a3f35713203d3d059c02d7497d1dfa72777596f1e3eb3376d2e2e355b9dc9'
            'a93f87542b38ae94730d414dcad4db3812e7f9c2143d35a3fdb8aa3cf0372ab8'
            '967fa4aad81f68305aaf46397b3fa7c8bbe6c6fc95e021b721babeb1b9d44d03')
_pythonver='2.7.11-5'
_condaver='4.1.4'

_pkgarch=`uname -m`
if [ "$CARCH" == "x86" ]; then
    _pkgarch="x86"
    sha256sums[0]='54c06cd1b11cb687db6ba3613df443c057f769cdb87693e11674d956d8e5d081'
    source[0]="http://repo.continuum.io/archive/Anaconda2-${pkgver}-Linux-x86.sh"
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
