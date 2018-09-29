# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

_srcname=TensorRT
_cudaver=10.0
_cudnnver=7.3
_graphsurgeonver=0.2.2
_uffver=0.5.1
_ubuntuver=18.04.1

pkgname=tensorrt
pkgver=5.0.0.10
pkgrel=1
pkgdesc='A platform for high-performance deep learning inference (needs registration at upstream URL and manual download)'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('custom')
depends=('cuda' 'cudnn' 'python')
optdepends=('python2: for tensorflow python2 modules (python2 only)'
            'python-tensorflow: for graphsurgeon and uff python3 modules (python3 only)')
makedepends=('poppler' 'unzip')
options=('!strip')
source=("file://${_srcname}-${pkgver}.Ubuntu-${_ubuntuver}.${CARCH}-gnu.cuda-${_cudaver}.cudnn${_cudnnver}.tar.gz")
sha256sums=('f48c0d8147c60beef82dbc2e6f4d19366906303b8395dfae72cf848dd351ff9d')

prepare() {
    cd "${_srcname}-${pkgver}/python"
    unzip -oqq "tensorrt-${pkgver}-py2.py3-none-any.whl"
    
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
    _pythonver="$(python --version | awk '{ print $2 }' | grep -o '^[0-9]*\.[0-9]*')"
    
    mkdir -p "${pkgdir}/usr/lib/python"{2.7,"${_pythonver}"}
    
    # binaries
    install -D -m755 bin/* -t "${pkgdir}/usr/bin"
    
    # headers
    install -D -m644 include/* -t "${pkgdir}/usr/include"
    
    # libraries
    cp -a lib/*.so*       "${pkgdir}/usr/lib"
    cp -a lib/*_static.a* "${pkgdir}/usr/lib"
    
    # python 2
    cp -a python/tensorrt "${pkgdir}/usr/lib/python2.7"
    
    # python 3
    ### broken until ubuntu supports python 3.7
    #cp -a python/tensorrt "${pkgdir}/usr/lib/python${_pythonver}"
    
    # graphsurgeon
    ### python3 only because there is no python2-tensorflow package
    #cp -a graphsurgeon/graphsurgeon "${pkgdir}/usr/lib/python2.7"
    cp -a graphsurgeon/graphsurgeon "${pkgdir}/usr/lib/python${_pythonver}"
    
    # uff
    ### python3 only because there is no python2-tensorflow package
    #cp -a uff/uff "${pkgdir}/usr/lib/python2.7"
    cp -a uff/uff "${pkgdir}/usr/lib/python${_pythonver}"
    
    # documentation
    install -D -m644 doc/TensorRT-Developer-Guide.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a doc/{common,graphics,html,python} "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 doc/TensorRT-License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 doc/Acknowledgements.txt "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}
