# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=fluidd-git
_pkgname="${pkgname%-git}"
pkgver=r2026.3f1d22ea
pkgrel=1
pkgdesc="Klipper web frontend"
arch=(any)
url="https://docs.fluidd.xyz/"
license=('GPL3')
depends=()
makedepends=('git' 'npm' 'nodejs-lts-iron')
optdepends=('nginx: serve via HTTP'
            'ustreamer: webcam streaming support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/fluidd-core/fluidd.git#branch=develop' 'fluidd-klipper.cfg' 'fluidd-nginx.conf')
sha256sums=('SKIP'
            '8cc7f8e97459cc9e529363f63151a205d4a3702a1d20ce864d9f7d7b51a4e1cf'
            'e7b5ad3cf3024961e072add95e7367076874330dde8b1594e3410354005fbc7b')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  npm install --no-update-notifier --no-audit --cache "${srcdir}/npm-cache"
  npm run build
}

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "${pkgdir}/usr/share/webapps"
  cp -dr --no-preserve=ownership dist "$pkgdir/usr/share/webapps/${_pkgname}"

  install -Dm644 "${srcdir}/fluidd-klipper.cfg" "${pkgdir}/usr/share/doc/${_pkgname}/fluidd-klipper.cfg"
  install -Dm644 "${srcdir}/fluidd-nginx.conf" "${pkgdir}/usr/share/doc/${_pkgname}/fluidd-nginx.conf"
}
