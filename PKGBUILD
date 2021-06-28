# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Andreas Gerlach <andigerlach76@gmail.com>
pkgname=ijavascript
pkgver=5.2.0
pkgrel=4
pkgdesc="IJavascript is a JavaScript kernel for the Jupyter notebook"
arch=(any)
url="https://github.com/n-riesco/ijavascript"
license=('BSD-3-Clause')
depends=('nodejs' 'jupyter')
optdepends=('jupyterlab: JupyterLab support'
            'jupyter-notebook: Jupyter Notebook support')
makedepends=('npm' 'patchelf')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz
        kernel.json)
sha256sums=('f2b2799f3af99ec33e8f4386087462744b55270fa127dda7bc3b6649a2a591c0'
            '8b81b89b41548b732733bc65bf3919a346ad9c037bb668ce94369971fb96e4c8')

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
