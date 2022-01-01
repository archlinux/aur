# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=fluidd-git
_pkgname="${pkgname%-git}"
pkgver=r1026.ec6ab04
pkgrel=1
pkgdesc="Klipper web frontend"
arch=(any)
url="https://docs.fluidd.xyz/"
license=('GPL3')
depends=()
makedepends=('git' 'npm' 'nodejs-lts-fermium')
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
  ./node_modules/.bin/vue-cli-service build
}

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "${pkgdir}/usr/share/webapps"
  cp -r dist "$pkgdir/usr/share/webapps/${_pkgname}"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 "${srcdir}/fluidd-klipper.cfg" "${pkgdir}/usr/share/doc/${_pkgname}/fluidd-klipper.cfg"
  install -Dm644 "${srcdir}/fluidd-nginx.conf" "${pkgdir}/usr/share/doc/${_pkgname}/fluidd-nginx.conf"
}
