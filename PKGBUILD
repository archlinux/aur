# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Andreas Gerlach <andigerlach76@gmail.com>
pkgname=ijavascript
pkgver=5.2.0
pkgrel=1
pkgdesc="IJavascript is a JavaScript kernel for the Jupyter notebook"
arch=(any)
url="https://github.com/n-riesco/ijavascript"
license=('BSD-3-Clause')
depends=('nodejs' 'jupyter' 'jupyter-notebook')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz
        kernel.json
        binding.gyp)
sha256sums=('f2b2799f3af99ec33e8f4386087462744b55270fa127dda7bc3b6649a2a591c0'
            '8b81b89b41548b732733bc65bf3919a346ad9c037bb668ce94369971fb96e4c8'
            'a33173c96cfbd957e5010746cdd6814c7fa839e366490559276866bb6b3f97cf')

_npmdir="/usr/lib/node_modules/ijavascript"

package() {
  npm install -g --omit=dev --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" "${pkgname}-${pkgver}.tgz"

  # Build *ZeroMQ* with our custom `binding.gyp`, as the official one doesn't link the required library `unwind`
  cp "${srcdir}/binding.gyp" "${pkgdir}/usr/lib/node_modules/ijavascript/node_modules/zeromq/"
  cd "${pkgdir}${_npmdir}/node_modules/zeromq"
  npm run build:libzmq

  # Can't run `ijsinstall --install=global` as we have permission errors. Do things manually.
  mkdir -p "${srcdir}/kernel/javascript"
  cd "${srcdir}/kernel/javascript"
  cp "${srcdir}/kernel.json" kernel.json
  cp "${pkgdir}${_npmdir}/images/nodejs/js-green-32x32.png" logo-32x32.png
  cp "${pkgdir}${_npmdir}/images/nodejs/js-green-64x64.png" logo-64x64.png

  cd "${srcdir}/kernel"
  jupyter-kernelspec install --prefix="${pkgdir}/usr" javascript
}
