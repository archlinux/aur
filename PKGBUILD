# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=anaconda2
pkgver=2.4.0
pkgrel=2
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
sha256sums=('49d19834da06b1b82b6fa85bc647d2e78fa5957d0cbae3ccd6c695a541befa6b'
            '2807b1f1ff261b9b9cf77ab68123f7c9ee0c261a0d36cb9ed851dee5ee8d19ff'
            'f8e9bd8b719e6cada2b835e7477dd336632efe86782c0933570c79ef8a103525'
            '0d96fe52ef08e04106122e195ef57e3f38de2a5f9896c36faa6f05b30e88382b')
_pythonver='2.7.10-2'
_condaver='3.18.3'

_pkgarch=`uname -m`
if [ "$CARCH" == "x86" ]; then
    _pkgarch="x86"
    sha256sums[0]='478a8fdde3a6e4040a68c57d7bdd6fab1a4f7f6e813948d46dad54867014c124'
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
    $prefix/pkgs/python-${_pythonver}/bin/python -E $CONDA_INSTALL --prefix=$prefix --instdir=/opt/${pkgname} --pkgs-dir=$prefix/pkgs --link-all || exit 1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
