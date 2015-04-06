# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=2.2.0
pkgrel=1
pkgdesc="Completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing."
arch=('x86' 'x86_64')
url="https://store.continuum.io/cshop/anaconda/"
license=("custom")
makedepends=('patch')
source=("https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-${pkgver}-Linux-x86_64.sh"
        "installer_sh_x86.patch"
        "installer_sh_x86_64.patch"
        "conda_install.patch")
options=(!strip libtool)
sha256sums=('ca2582cb2188073b0f348ad42207211a2b85c10b244265b5b27bab04481b88a2'
            '9ff37569fe20dffe2bdde42c41e276a1920498c8f2d4f284b38e856ca3e113d2'
            '9429cf175f9306faf3b89768c97df484eb5aa38f7e95041de599d641a3425087'
            '4e2f50b5fe0fef34336bf7c9f73d73291710dbc8a10a116bfd771b72316bc7fa')
_pythonver='2.7.9-2'
_condaver='3.10.0'

_pkgarch=`uname -m`
if [ "$CARCH" == "i686" ]; then
    _pkgarch="x86"
    sha256sums[0]='6437d5b08a19c3501f2f5dc3ae1ae16f91adf6bed0f067ef0806a9911b1bef15'
    source[0]="https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-${pkgver}-Linux-x86.sh"
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
