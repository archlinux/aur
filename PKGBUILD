# Maintainer: xeruf <27jf at pm dot me>
# Creator: Matthias De Bie <mattydebie@gmail.com>

_pkgname='invoiceninja-desktop'
_repo='admin-portal'
pkgname="${_pkgname}-git"
pkgdesc="Desktop version for Invoice Ninja"
pkgver=5.0.100.r32.g01ff13438
pkgrel=1
url="https://github.com/invoiceninja/$_repo"
source=("git+${url}" "invoiceninja-desktop.desktop")
provides=("${_pkgname}")
conflicts=("$_pkgname")
makedepends=(flutter)
arch=('i686' 'x86_64')
license=('unknown')
sha256sums=('SKIP'
            'beb5d95b727169634e0ee42bf4d4f556ac1fa2d2f73a9d9a61c29820c13dc1c6')

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  install -m 655 invoiceninja-desktop.desktop "${pkgdir}/usr/share/applications/"

  cd "${srcdir}/${_repo}/"
  # See Repo Readme
  cp lib/.env.dart.example lib/.env.dart
  flutter build linux
  # TODO pass -Wno-dev to make

  cd build/linux/x64/release
  dest="${pkgdir}/opt/${pkgname}"
  mkdir -p "$dest" "${pkgdir}/usr/bin"
  cp -r bundle/data "$dest"
  cp -r bundle/lib "$dest"
  install -m 755 bundle/invoiceninja "$dest"
  install -m 755 bundle/invoiceninja "${pkgdir}/usr/bin"
}

pkgver() {
  cd "${_repo}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
