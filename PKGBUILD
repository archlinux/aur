# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

# upstreamed renamed to libarcus
pkgname=arcus
pkgver=5.0.0
pkgrel=2
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('x86_64')
license=('LGPL')
makedepends=('cmake' 'git' 'ninja')
depends=('python' 'protobuf')
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz"
        protobuf-3.18.patch)
sha512sums=('ffa22847693b4368966e02667ab44e0ce8da82210936da7364ee405acb38286e0e3a05aadbdf56f2a2fcafa8a28b1e4fa294609e1181a68a56dc0ad591e5556f'
            '5aa03da6a8db4fd3145c61bca587aac6c622536dc8211ca19be2c37ce33bf8a53508a95aa35d40d7972c7f0fea3e66ee0c506eda932be35751238f4d7f7e0d61')

prepare() {
  export _sitelib="$(python -c 'import site; print(site.getsitepackages()[0])')"

  python -m venv --system-site-packages .venv
  source .venv/bin/activate
  python -m pip install sip==6.5.1

  cd libArcus-${pkgver}
  patch -Np1 -i ../protobuf-3.18.patch
}

build() {
  cmake -S libArcus-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/ \
    -DPython_SITELIB_LOCAL="${_sitelib}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${srcdir}/libArcus-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
