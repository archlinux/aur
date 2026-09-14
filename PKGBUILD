# Maintainer: Yo'av Moshe <aur@yoavmoshe.com>

pkgname=sendspin-client
pkgver=0.2.1
_sendspin_cpp_commit=bbc5958612939a3df970efcf9beb55e0d63084da
pkgrel=2
pkgdesc="Minimal SendSpin client based on sendspin-cpp"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/TermeHansen/sendspin-client"
license=('Apache-2.0')
depends=('portaudio' 'alsa-lib' 'avahi')
makedepends=('cmake' 'git' 'patch')
backup=('etc/sendspin-client/sendspin-client.conf')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/TermeHansen/sendspin-client/archive/refs/tags/v${pkgver}.tar.gz"
  "sendspin-cpp-${_sendspin_cpp_commit}.tar.gz::https://github.com/Sendspin/sendspin-cpp/archive/${_sendspin_cpp_commit}.tar.gz"
  "${pkgname}.service"
)
sha256sums=('5c6c999aa8b3b9d61990fcbb0076ebf4ca83f0615fd48d9ff2c85e79fe7abcb0'
            'bbfa5e7086a244a666a25d86b60fc02309d076ff06325c9a53eaa6629613ddee'
            '567fba38110de6c193ea0ab4e816d2e87f1ed41c2473db9bf64372c421757469')

prepare() {
  cd "${pkgname}-${pkgver}"
  rmdir sendspin-cpp 2>/dev/null || true
  ln -srf "${srcdir}/sendspin-cpp-${_sendspin_cpp_commit}" sendspin-cpp
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 build/sendspin-client "${pkgdir}/usr/bin/sendspin-client"
  install -Dm644 debian/sendspin-client.conf "${pkgdir}/etc/sendspin-client/sendspin-client.conf"
  install -Dm644 debian/sendspin-client.conf.example "${pkgdir}/etc/sendspin-client/sendspin-client.conf.example"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
}
