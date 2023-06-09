# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_plugins_pkgver=3.16
pkgname=nomacs
pkgver=3.17.2282
pkgrel=1
epoch=1
pkgdesc="A Qt image viewer"
arch=(x86_64)
url="https://nomacs.org/"
license=(GPL3)
depends=(exiv2 gcc-libs glibc libraw libtiff opencv qt5-base qt5-svg quazip)
makedepends=(cmake qt5-tools)
optdepends=('qt5-imageformats: support additional image formats')
source=("nomacs-${pkgver}.tar.gz::https://github.com/nomacs/nomacs/archive/${pkgver}.tar.gz"
        "nomacs-plugins-${_plugins_pkgver}.tar.gz::https://github.com/nomacs/nomacs-plugins/archive/${_plugins_pkgver}.tar.gz"
        "https://github.com/nomacs/nomacs/files/11703502/nomacs-fix-exiv2-0.28.patch.txt"
        )
sha512sums=('bb603b94a97c8bd8e95e5067e4fdca163c8c991417fdce3469f28f37635b2919733c882a5d46969422349a003e1526e1e49fbe358253586920c0c00009226ac4'
            'cd72f6ddbe3e07d7ed97f08405bac7574f4f3285c81e835f5630e011c8a9b105f23d892fed8084cb35ce521aca5524db071d0edb8bb04850dd2209d9ed019747'
            '73c0eb36435b5b877f1affbcadf1a4057b603aa71cb90be47ddd8b10fe75ae4e9d4d4463e6751624524304c6ef5d540c21b7d250705da2be0ea6ea4b89f26b1a')
b2sums=('419b79d5173fb0ab1733dd875475f4ca84824b56dfa4e4fc82cf5d53dfd6481853f29c6dcb63b9c3a8b94965426714544b25b40f5f215357d0c29a089fe37ce7'
        '2bda4f36d56709653f6696af3404e416fd2d9fe7fa11de9636643c728028018ac769df3e2e519799322c5c42006cdc114d0e6406f9f60294234b07d9fd8d8409'
        '7144b3e3391047bf89df4da8b78cf0b9273ff7cb2db8637f719ac4b926290901ba3f6f2dee4ba342f8dac4939b4d60be3d80a45dd2481d25408e712160a1bb78')

prepare() {
  cd "nomacs-${pkgver}"
  # https://github.com/nomacs/nomacs/issues/951
  patch -Np1 -i ../nomacs-fix-exiv2-0.28.patch.txt
  # copy plugin sources into place
  cp -av "${srcdir}/nomacs-plugins-${_plugins_pkgver}/"* "ImageLounge/plugins"
}

build() {
  cd "nomacs-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DUSE_SYSTEM_QUAZIP=ON \
        -DENABLE_AVIF=ON \
        -DENABLE_TRANSLATIONS=ON \
        -W no-dev \
        -B build \
        -S ./ImageLounge
  make VERBOSE=1 -C build
}

package() {
  cd "nomacs-${pkgver}"
  make DESTDIR="${pkgdir}" install -C build
}
