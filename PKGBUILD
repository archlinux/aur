# Maintainer: Dringsim <dringsim@qq.com>
# (ijavascript package:)
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: Andreas Gerlach <andigerlach76@gmail.com>
pkgname=itypescript
pkgver=0.4.0
pkgrel=1
pkgdesc="TypeScript kernel for Jupyter"
arch=(any)
url="https://github.com/winnekes/itypescript"
license=('BSD-3-Clause')
depends=('jupyter-notebook' 'nodejs' 'typescript')
optdepends=('jupyterlab: JupyterLab support')
makedepends=('npm' 'patchelf')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz
        kernel.json)
sha256sums=('84629D31F9F2648BEAE4EFBA3F732819456CC1365726F443B1B1A431C91906CD'
            '081C33AEC972986092508746776314A2D712DFD70FD1C6EBD09E134140E1C184')

_npmdir="/usr/lib/node_modules/itypescript"
_kerneldir="/usr/share/jupyter/kernels/typescript"

package() {
  npm install -g --omit=dev --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" "${pkgname}-${pkgver}.tgz"

  # Add the required library `unwind` to *ZeroMQ*, as `binding.gyp` doesn't link it
  patchelf --add-needed libunwind.so "${pkgdir}${_npmdir}/node_modules/zeromq/build/Release/zmq.node"

  # Prune the unnecessary "typescript" package
  rm -r "${pkgdir}${_npmdir}/node_modules/typescript"

  # Can't run `its --install=global` as we have permission errors. Do things manually.
  install -dm755 "${pkgdir}${_kerneldir}"
  install -Dm644 "kernel.json" "${pkgdir}${_kerneldir}/kernel.json"
  install -Dm644 "${pkgdir}${_npmdir}/images/logo-32x32.png" "${pkgdir}${_kerneldir}/logo-32x32.png"
  install -Dm644 "${pkgdir}${_npmdir}/images/logo-64x64.png" "${pkgdir}${_kerneldir}/logo-64x64.png"
  install -Dm644 "${pkgdir}${_npmdir}/images/logo-128x128.png" "${pkgdir}${_kerneldir}/logo-128x128.png"
}
