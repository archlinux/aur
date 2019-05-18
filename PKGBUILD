# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

_srcname=TensorRT
_cudaver=10.1
_cudnnver=7.5
_graphsurgeonver=0.4.1
_uffver=0.6.3
_ubuntuver=18.04.2

pkgname=tensorrt
pkgver=5.1.5.0
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
sha256sums=('d247fd1270ea20bda896fdd8dff6ae320b981addfa071c3a1246b7c27023e011')

prepare() {
    cd "${_srcname}-${pkgver}/python"
    unzip -oqq "tensorrt-${pkgver}-cp37-none-linux_${CARCH}.whl"
    
    cd ../graphsurgeon
    unzip -oqq "graphsurgeon-${_graphsurgeonver}-py2.py3-none-any.whl"
    
    cd ../uff
    unzip -oqq "uff-${_uffver}-py2.py3-none-any.whl"
    
    cd ../doc
    pdftotext -layout TensorRT-License.pdf
}

package() {
    cd "${_srcname}-${pkgver}"
    
    local _pythonver
    _pythonver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    mkdir -p "${pkgdir}/usr/lib/python"{2.7,"${_pythonver}"}
    
    # binaries
    install -D -m755 bin/* -t "${pkgdir}/usr/bin"
    
    # headers
    install -D -m644 include/* -t "${pkgdir}/usr/include"
    
    # libraries
    cp -a lib/*.so*       "${pkgdir}/usr/lib"
    cp -a lib/*_static.a* "${pkgdir}/usr/lib"
    
    # python
    cp -a python/tensorrt "${pkgdir}/usr/lib/python${_pythonver}"
    
    # graphsurgeon
    cp -a graphsurgeon/graphsurgeon "${pkgdir}/usr/lib/python${_pythonver}"
    
    # uff
    cp -a uff/uff "${pkgdir}/usr/lib/python${_pythonver}"
    
    # documentation
    install -D -m644 doc/TensorRT-Developer-Guide.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a doc/{html,python} "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 doc/TensorRT-License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 doc/Acknowledgements.txt "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}
