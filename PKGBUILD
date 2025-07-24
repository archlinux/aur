
pkgname=openseeface-git
pkgver=1.20.4.r57.gdee5bb7
pkgrel=1
pkgdesc='OpenSeeFace - Robust realtime face and facial landmark tracking on CPU with Unity integration. (Includes facetracker)'
url="https://github.com/emilianavt/OpenSeeFace"
license=('BSD-2')
arch=('x86_64')
depends=('python-poetry' 'python-numpy' 'python-flatbuffers' 'python-onnxruntime'
         'python-opencv' 'python-pillow' 'python-protobuf')
makedepends=('git' 'python-pip' 'python-wheel' 'python-setuptools')
optdepends=('python-opencv-cuda: for CUDA optimizations'
            'onnxruntime-opt: for AVX2 CPU optimizations'
            'onnxruntime-opt-rocm: for ROCm and AVX2 CPU optimizations'
            'onnxruntime-rocm: for ROCm')
source=("git+https://github.com/emilianavt/OpenSeeFace.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/OpenSeeFace"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/OpenSeeFace"
    sed -i '/^python =/d' pyproject.toml
    mkdir -p openseeface
    touch openseeface/__init__.py
    cp *.py openseeface/
    cp -R models openseeface/
    sed -i 's|from input_reader|from .input_reader|' openseeface/facetracker.py
    sed -i 's|from tracker|from .tracker|' openseeface/facetracker.py
    sed -i 's|import escapi|from .escapi import *|' openseeface/input_reader.py
    sed -i 's|import dshowcapture|from .dshowcapture import *|' openseeface/input_reader.py
    sed -i 's|from similaritytransform|from .similaritytransform|' openseeface/tracker.py
    sed -i 's|from retinaface|from .retinaface|' openseeface/tracker.py
    sed -i 's|from remedian|from .remedian|' openseeface/tracker.py
}

build() {
    cd "${srcdir}/OpenSeeFace"
    poetry build
    mkdir -p "${srcdir}/bin"
    echo "#!/usr/bin/env python" > "${srcdir}/bin/facetracker"
    echo "import openseeface.facetracker" >> "${srcdir}/bin/facetracker"
    chmod +x "${srcdir}/bin/facetracker"
}

package() {
    WHEEL_PACKAGE=$(find "${srcdir}"/$1 -name "*.whl")
    pip install --root-user-action ignore --ignore-installed --upgrade --root "${pkgdir}"/ $WHEEL_PACKAGE --no-dependencies
    cp -R "${srcdir}/bin" "${pkgdir}/usr/"
}

