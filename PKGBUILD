# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Andreas Gerlach <andigerlach76@gmail.com>
pkgname=ijavascript
pkgver=5.2.1
pkgrel=3
pkgdesc="JavaScript kernel for Jupyter"
arch=(any)
url="https://github.com/n-riesco/ijavascript"
license=('BSD-3-Clause')
depends=('jupyter-notebook' 'nodejs')
optdepends=('jupyterlab: JupyterLab support')
makedepends=('npm' 'patchelf')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz
        kernel.json)
sha256sums=('01e52b0706fc12b62a099adddd773b71dfd8b329155489eadb50322ce1d3386c'
            '91635eaf9956544d30b59f4c0503583510c132640553df73a1fcfe31fc858171')

_npmdir="/usr/lib/node_modules/ijavascript"
_kerneldir="/usr/share/jupyter/kernels/javascript"

package() {
  npm install -g --omit=dev --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" "${pkgname}-${pkgver}.tgz"

  # Add the required library `unwind` to *ZeroMQ*, as `binding.gyp` doesn't link it
  patchelf --add-needed libunwind.so "${pkgdir}${_npmdir}/node_modules/zeromq/build/Release/zmq.node"

  # Can't run `ijsinstall --install=global` as we have permission errors. Do things manually.
  install -dm755 "${pkgdir}${_kerneldir}"
  install -Dm644 "kernel.json" "${pkgdir}${_kerneldir}/kernel.json"
  install -Dm644 "${pkgdir}${_npmdir}/images/nodejs/js-green-32x32.png" "${pkgdir}${_kerneldir}/logo-32x32.png"
  install -Dm644 "${pkgdir}${_npmdir}/images/nodejs/js-green-64x64.png" "${pkgdir}${_kerneldir}/logo-64x64.png"
}
