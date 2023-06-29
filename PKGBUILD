# Maintainer: xeruf <27jf at pm dot me>
# Creator: Matthias De Bie <mattydebie@gmail.com>

_pkgname='invoiceninja-desktop'
_repo='admin-portal'
pkgname="${_pkgname}"
pkgdesc="Desktop version for Invoice Ninja"
pkgver=5.0.121
pkgrel=1
url="https://github.com/invoiceninja/$_repo"
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz" "invoiceninja-desktop.desktop")
provides=("${_pkgname}")
makedepends=(fvm-bin)
arch=('i686' 'x86_64')
license=('unknown')
sha256sums=('1059e354cb5bd08ed273a953c9fb3f9b3fa90535780726b44a358f4ae487a63f'
            'beb5d95b727169634e0ee42bf4d4f556ac1fa2d2f73a9d9a61c29820c13dc1c6')

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  install -m 655 invoiceninja-desktop.desktop "${pkgdir}/usr/share/applications/"

  cd "${srcdir}/${_repo}-${pkgver}"
  # See Repo Readme
  cp lib/.env.dart.example lib/.env.dart
  echo Y | fvm use 3.7.12
  fvm flutter build linux
  # TODO pass -Wno-dev to make
  # https://github.com/flutter/flutter/issues/115752

  cd build/linux/x64/release
  dest="${pkgdir}/opt/${pkgname}"
  mkdir -p "$dest" "${pkgdir}/usr/bin/"
  cp -r bundle/data "$dest"
  cp -r bundle/lib "$dest"
  install -m 755 bundle/invoiceninja "$dest"
  install -m 755 bundle/invoiceninja "${pkgdir}/usr/bin/"
}
