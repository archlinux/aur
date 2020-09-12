# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-vmaf
pkgver=1.5.3
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (python implementation)'
arch=('x86_64')
url='https://github.com/netflix/vmaf/'
license=('BSD')
depends=(
    # official repositories:
        'cython' 'python' 'python-numpy' 'python-scipy' 'python-matplotlib'
        'python-pandas' 'python-scikit-learn' 'python-h5py'
    # AUR:
        'python-dill' 'python-scikit-image' 'python-sureal' 'python-pywavelets'
)
makedepends=('python-setuptools')
checkdepends=('libsvm' 'vmaf')
BUILDENV=('!check') # tests currently fails to run
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/vmaf-${pkgver}.tar.gz")
sha256sums=('440652ae417d88be083ffd9fa5967662172601e31c458a9743f6008d7150c900')

prepare() {
    # for running the tests
    mkdir -p "vmaf-${pkgver}/libvmaf/build"/{lib,tools}
    ln -sf /usr/bin/vmaf_feature "vmaf-${pkgver}/libvmaf/build/tools/vmaf_feature"
    ln -sf /usr/bin/vmaf_rc "vmaf-${pkgver}/libvmaf/build/tools/vmaf_rc"
    ln -sf /usr/bin/vmafossexec "vmaf-${pkgver}/libvmaf/build/tools/vmafossexec"
    ln -sf /usr/lib/libvmaf.so "vmaf-${pkgver}/libvmaf/build/lib/libvmaf.so"
}

build() {
    cd "vmaf-${pkgver}/python"
    python setup.py build
    python setup.py build_ext --inplace # for running the tests
}

check() {
    cd "vmaf-${pkgver}"
    ./unittest
}

package() {
    cd "vmaf-${pkgver}/python"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    
    local _file
    while read -r -d '' _file
    do
        install -D -m755 "$_file" -t "${pkgdir}/usr/bin"
    done < <(find vmaf/script -maxdepth 1 -mindepth 1 -type f -executable -print0)
    
    install -D -m644 "${srcdir}/vmaf-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
