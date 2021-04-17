# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-ctc-segmentation-git
pkgver=1.6.1.r39
pkgrel=1
pkgdesc='Determine and align utterance segments within audio files using CTC'
arch=('any')
url='https://github.com/lumaku/ctc-segmentation'
license=('Apache License 2.0')
depends=('python>=3.7' 'python-numpy' 'cython')
optdepends=('sox: listen to audio segments')
makedepends=('git' 'cython' 'python-setuptools')
provides=('python-ctc-segmentation')
conflicts=("python-ctc-segmentation" "${pkgname}")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s.r%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)"
}


build() {
    cd "${pkgname}"
    cythonize -3 ctc_segmentation/ctc_segmentation_dyn.pyx
    python setup.py build
    # echo " --> Warnings of a deprected numpy API can be safely ignored."
}


package() {
    cd "${pkgname}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


check() {
    cd "${pkgname}"
    python -c "import tests.test_ctc_segmentation as test; test.test_ctc_segmentation()"
	python -c "import tests.test_ctc_segmentation as test; test.test_determine_utterance_segments()"
	python -c "import tests.test_ctc_segmentation as test; test.test_prepare_text()"
}
