# Maintainer: coffee <catheadcoffee@gmail.com>
pkgname=markitdown-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Utility tool for converting various files to Markdown (uv-based venv, all extras included)"
arch=('any')
url="https://github.com/microsoft/markitdown"
license=('MIT')
depends=('python>=3.10')
makedepends=('python-uv' 'curl')
conflicts=('python-markitdown')
source=("markitdown-0.1.8-py3-none-any.whl::https://files.pythonhosted.org/packages/33/de/0b23cd8d8955221a39438ba8e4cf583e4f510fc79c6891fff88fb3e61198/markitdown-0.1.8-py3-none-any.whl")
sha256sums=('de7375a50578a39bcbbf13b48c67d99033d988e0ae8ad25af46ed432dbe4cbab')

package() {
    _optdir="${pkgdir}/opt/${pkgname}"
    _venv="${_optdir}/venv"

    install -dm755 "${_optdir}"

    # 1. Create isolated venv
    uv venv --python python3 "${_venv}"

    # 2. Install wheel with all extras:
    #    base:   beautifulsoup4, requests, markdownify, magika, charset-normalizer, defusedxml
    #    [all]:  pdf, docx, pptx, xlsx, xls, outlook, audio-transcription,
    #            youtube-transcription, az-doc-intel, az-content-understanding
    uv pip install --python "${_venv}/bin/python" \
        "${srcdir}/markitdown-${pkgver}-py3-none-any.whl[all]"

    # 3. Fix build-path shebangs in entry points
    find "${_venv}/bin" -type f -executable \
        -exec sed -i "1s|^#!${_venv}|#!/opt/${pkgname}/venv|" {} +

    # 4. Cleanup
    rm -rf "${_venv}/.cache"
    find "${_venv}" -name 'direct_url.json' -exec rm -f {} +

    # 5. Symlink entry point to /usr/bin/
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/venv/bin/markitdown" "${pkgdir}/usr/bin/markitdown"

    # 6. License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
MIT License

Copyright (c) Microsoft Corporation.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
LICENSE
}
