# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

_srcname=TensorRT
_cudaver=9.2
_cudnnver=7.1
_graphsurgeonver=0.2.0
_uffver=0.4.0
_ubuntuver=16.04.4
_ubpy3ver=35

pkgname=tensorrt
pkgver=4.0.1.6
pkgrel=1
pkgdesc='A high-performance deep learning inference optimizer and runtime for deep learning applications (needs registration at upstream URL and manual download)'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('custom')
depends=('cudnn' 'python2' 'python')
makedepends=('poppler' 'unzip')
options=('!strip')
source=("file://${_srcname}-${pkgver}.Ubuntu-${_ubuntuver}.${CARCH}-gnu.cuda-${_cudaver}.cudnn${_cudnnver}.tar.gz")
sha256sums=('fc5fd2ba86225ed62e60870cc24896107770a59829363fcb49229c82bb1f4fb5')

prepare() {
    cd "${_srcname}-${pkgver}/python"
    
    mkdir -p python{2,3}
    
    cd python2
    unzip -qq "../${pkgname}-${pkgver}-cp27-cp27mu-linux_${CARCH}.whl"
    
    cd ../python3
    unzip -qq "../${pkgname}-${pkgver}-cp${_ubpy3ver}-cp${_ubpy3ver}m-linux_${CARCH}.whl"
    
    cd ../../graphsurgeon
    unzip -qq "graphsurgeon-${_graphsurgeonver}-py2.py3-none-any.whl"
    
    cd ../uff
    unzip -qq "uff-${_uffver}-py2.py3-none-any.whl"
    
    cd ../doc
    pdftotext -layout TensorRT-License.pdf
}

package() {
    cd "${_srcname}-${pkgver}"
    
    local _pythonver="$(python --version | sed 's/^Python[[:space:]]//' | grep -o '^[0-9]*\.[0-9]*')"
    
    mkdir -p "${pkgdir}/usr/lib/python"{2.7,"${_pythonver}"}
    
    # binaries
    install -D -m755 bin/* -t "${pkgdir}/usr/bin"
    
    # headers
    install -D -m644 include/* -t "${pkgdir}/usr/include"
    
    # libraries
    cp -af lib/* "${pkgdir}/usr/lib"
    
    # python 2
    cp -af python/python2/tensorrt "${pkgdir}/usr/lib/python2.7"
    
    # python 3
    cp -af python/python3/tensorrt "${pkgdir}/usr/lib/python${_pythonver}"
    
    # graphsurgeon
    cp -af graphsurgeon/graphsurgeon "${pkgdir}/usr/lib/python2.7"
    cp -af graphsurgeon/graphsurgeon "${pkgdir}/usr/lib/python${_pythonver}"
    
    # uff
    cp -af uff/uff "${pkgdir}/usr/lib/python2.7"
    cp -af uff/uff "${pkgdir}/usr/lib/python${_pythonver}"
    
    # documentation
    install -D -m644 doc/TensorRT-Developer-Guide.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -af doc/{common,graphics,html} "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 doc/TensorRT-License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 doc/Acknowledgements.txt "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}
