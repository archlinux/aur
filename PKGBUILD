# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=rnalysis
_name=RNAlysis
pkgver=3.3.0
pkgrel=1
pkgdesc='Python-based software for analyzing RNA sequencing data. https://doi.org/10.1101/2022.11.25.517851'
_pkgdesc='Python-based software with GUI for analyzing RNA sequencing data'
arch=(any)
url=https://github.com/GuyTeichman/RNAlysis
license=(MIT)
depends=(
         'python'
         'cython'
         'python-numpy' 
         'python-pandas'
         'python-scipy'
         'python-matplotlib'
         'python-requests'
         'python-scikit-learn'
         'python-seaborn'
         'python-statsmodels'
         'python-joblib'
         'python-tqdm'
         'python-appdirs'
         'python-yaml'
         'python-typing_extensions'
         'python-pyqt5'
         'python-qdarkstyle'
         'r'
         'graphviz'
         'python-graphviz'
         'python-numba'
         'python-hdbscan'
         'python-matplotlib-venn'
         'kallisto'
         'python-scikit-learn-extra'
         'python-grid-strategy'
         'python-upsetplot'
         'python-xlmhg'
         'python-plotly'
         'python-pairwisedist'
         'cutadapt'
        )

makedepends=(
             'python-pip'
             'gendesk'
             'python-pytest'
             'python-setuptools'
             'python-setuptools-scm'
             'python-pytest-xvfb'
             'python-pytest-qt'
             'python-sphinx'
             'python-wheel'
            )
source=(${_name}-${pkgver}.tar.gz::'https://github.com/GuyTeichman/RNAlysis/archive/refs/tags/V$pkgver.tar.gz'
        'RNAlysis.svg')

sha256sums=('19c5676ad1b1cb128f87298f008e9057bd555544de2acc7c48aec48efd3737c0'
            '4c2fbbcaeb012c14e12b4aa2d8c9c9b2f50107b3255c2f448aa8577e96fc754c')

prepare() {
    cp RNAlysis.svg "$_name-$pkgver"/
    cd "$_name-$pkgver"
    gendesk --exec='/usr/bin/rnalysis-gui' --pkgname "$_name" --pkgdesc "$_pkgdesc" -n --icon=RNAlysis --categories=Science
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check(){

    export QT_DEBUG_PLUGINS=1
    cd "$_name-$pkgver"
    python setup.py pytest | tee check.log
}

package() {

    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -Rf "$pkgdir"/usr/lib/python3.10/site-packages/tests
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 RNAlysis.desktop -t "$pkgdir"/usr/share/applications/
    install -Dm644 RNAlysis.svg -t "$pkgdir"/usr/share/pixmaps/
}

