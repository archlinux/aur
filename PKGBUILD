# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: xeruf <27jf at pm dot me>
# Contributor: Matthias De Bie <mattydebie@gmail.com>

pkgname='invoiceninja-desktop'
_repo='admin-portal'
pkgdesc="Desktop client for Invoice Ninja"
pkgver=5.0.172
pkgrel=1
url='https://invoiceninja.com/'
source=("git+https://github.com/invoiceninja/${_repo}#tag=v${pkgver}" "invoiceninja-desktop.desktop" "invoiceninja")
makedepends=(fvm ninja clang cmake unzip)
depends=(gtk3
        glib2
        gcc-libs
        at-spi2-core
        libepoxy
        glibc)
arch=('i686' 'x86_64')
license=('custom')
sha512sums=('SKIP'
            '2465924fe1087c5980419841d17352f23fb2458a74bb1acda577d58f374e0dcd871e8bc1334c7ed151e6050b08e50eb400631a24b0b94007b5e938d875db6255'
            'bb7286a93b510c0c0b5fbb7b3889e4e264bb17108d43e981fdca1535764c02d99b1a8f4a3ee878c994730cff82ff736a0c56ca8089bdca26d82d66df12ef9a93')

prepare() {
  cd "${srcdir}/${_repo}"
  cp lib/.env.dart.example lib/.env.dart
  fvm use 3.19.6 --force
}

build() {
  cd "${srcdir}/${_repo}"
  fvm flutter build linux
  # TODO pass -Wno-dev to make
  # https://github.com/flutter/flutter/issues/115752
}
package() {
  mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin/"
  install -m 655 invoiceninja-desktop.desktop "${pkgdir}/usr/share/applications/"
  install -m 755 invoiceninja "${pkgdir}/usr/bin/"

  cd "${srcdir}/${_repo}"/build/linux/x64/release

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/192x192/apps"
  install -m 655 bundle/data/flutter_assets/assets/images/icon.png "${pkgdir}/usr/share/icons/hicolor/192x192/apps/invoiceninja.png"

  dest="${pkgdir}/opt/${pkgname}"
  mkdir -p "$dest"

  cp -r bundle/data "$dest"
  cp -r bundle/lib "$dest"
  install -m 755 bundle/invoiceninja "$dest"
}
