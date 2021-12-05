# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=palanteer
pkgver=0.5
python_pkgver=0.5.0
pkgrel=1
pkgdesc="High performance visual profiler, debugger, tests enabler for C++ and Python"
arch=('x86_64')
url="https://github.com/dfeneyrou/${pkgname}"
license=('AGPL-3.0' 'MIT')
makedepends=('gcc' 'cmake' 'make' 'python-pip' 'python-wheel')
depends=('python')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("f5ba0f54720b65ccd3efb6d018eedfc3821eb572711d895ea229f31065f31bce")

build() {
  cd ${pkgname}-${pkgver}
  [ -d build ] || mkdir build ; cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/build/bin/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Desktop icon.
  install -Dm 644 ../palanteer.png "${pkgdir}/usr/share/pixmaps/palanteer.png"
  install -Dm 644 ../palanteer.desktop "${pkgdir}/usr/share/applications/palanteer.desktop"

  # Python packages.
  pip install "${pkgname}-${pkgver}/build/python/dist/${pkgname}-${pkgver}-cp39-cp39-linux_x86_64.whl" --root "${pkgdir}" --ignore-installed
  pip install "${pkgname}-${pkgver}/build/server/scripting/dist/${pkgname}_scripting-${pkgver}-cp39-cp39-linux_x86_64.whl" --root "${pkgdir}" --ignore-installed
}
