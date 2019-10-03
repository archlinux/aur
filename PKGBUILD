# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

_srcname=TensorRT
_cudaver=10.1
_cudnnver=7.6
_graphsurgeonver=0.4.1
_uffver=0.6.5
_ubuntuver=18.04

pkgname=tensorrt
pkgver=6.0.1.5
pkgrel=1
pkgdesc='A platform for high-performance deep learning inference (needs registration at upstream URL and manual download)'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('custom')
depends=('cuda' 'cudnn')
optdepends=('python-numpy: for tensorflow, graphsurgeon and uff python modules'
            'python-tensorflow: for graphsurgeon and uff python modules'
            'python-protobuf: for uff python module')
makedepends=('poppler' 'unzip')
options=('!strip')
source=("file://${_srcname}-${pkgver}.Ubuntu-${_ubuntuver}.${CARCH}-gnu.cuda-${_cudaver}.cudnn${_cudnnver}.tar.gz")
sha256sums=('e20b7bd051cdd448c5690a30ba01e83b0a0855edc4012107c0af01fde5b4037a')

prepare() {
    cd "${_srcname}-${pkgver}/python"
    unzip -oqq "tensorrt-${pkgver}-cp37-none-linux_${CARCH}.whl"
    
    cd ../graphsurgeon
    unzip -oqq "graphsurgeon-${_graphsurgeonver}-py2.py3-none-any.whl"
    
    cd ../uff
    unzip -oqq "uff-${_uffver}-py2.py3-none-any.whl"
    
    cd ../doc/pdf
    pdftotext -layout TensorRT-SLA.pdf
}

package() {
    cd "${_srcname}-${pkgver}"
    
    local _pythonver
    _pythonver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    mkdir -p "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    
    # binaries
    install -D -m755 bin/* -t "${pkgdir}/usr/bin"
    
    # headers
    install -D -m644 include/* -t "${pkgdir}/usr/include"
    
    # libraries
    cp -a lib/*.so*       "${pkgdir}/usr/lib"
    cp -a lib/*_static.a* "${pkgdir}/usr/lib"
    
    # python
    cp -a python/tensorrt "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    
    # graphsurgeon
    cp -a graphsurgeon/graphsurgeon "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    
    # uff
    cp -a uff/uff "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    
    # documentation
    install -D -m644 doc/pdf/TensorRT-Developer-Guide.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a doc/{cpp,python} "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 doc/pdf/TensorRT-SLA.txt  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 doc/Acknowledgements.txt "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}
