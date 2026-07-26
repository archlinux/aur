# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=palanteer
pkgver=0.8
pkgrel=1
pkgdesc="High performance visual profiler, debugger, tests enabler for C++ and Python"
arch=('x86_64')
url="https://github.com/dfeneyrou/${pkgname}"
license=('AGPL-3.0' 'MIT')
makedepends=('gcc' 'cmake' 'make' 'python312' 'python-pip' 'python-wheel')
depends=('python')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e36f6b969ac44621de902adf3d5a7dbdbb6e00002ba7c8d29b1e303500144e1')

build() {
  cd ${pkgname}-${pkgver}
  python3.12 -m ensurepip --upgrade 2>/dev/null
  python3.12 -m pip install setuptools wheel --break-system-packages
  [ -d build ] || mkdir build ; cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DPython3_EXECUTABLE=/usr/bin/python3.12
  make -j$(nproc)
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/build/bin/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Desktop icon.
  install -Dm 644 ../palanteer.png "${pkgdir}/usr/share/pixmaps/palanteer.png"
  install -Dm 644 ../palanteer.desktop "${pkgdir}/usr/share/applications/palanteer.desktop"

  # Python packages.
  python3.12 -m pip install "${pkgname}-${pkgver}/build/python/dist/${pkgname}-${pkgver}"*.whl --root "${pkgdir}" --ignore-installed --no-deps
  python3.12 -m pip install "${pkgname}-${pkgver}/build/server/scripting/dist/${pkgname}_scripting-${pkgver}"*.whl --root "${pkgdir}" --ignore-installed --no-deps
}
