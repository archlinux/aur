# Contributor: Wilhelm Schuster <aur [at] rot13 [dot] io>

pkgname=mainsail-git
_pkgname="${pkgname%-git}"
pkgver=r2484.12ade8ba
pkgrel=2
pkgdesc="Klipper web frontend"
arch=(any)
url="https://docs.mainsail.xyz/"
license=('GPL3')
depends=()
makedepends=('git' 'npm' 'zip')
optdepends=('nginx: serve via HTTP'
            'ustreamer: webcam streaming support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/mainsail-crew/mainsail.git#branch=develop' 'mainsail-klipper.cfg' 'mainsail-nginx.conf')
sha256sums=('SKIP'
            '3eca6e0cb002cb7def79ed41d81c734f12c5f365dee43f1fad38b0a7ae7a30dc'
            '7c86d687ac7b1fb84fc04d1ffcd468a05767a9c9d880ad6d666b2527523495ec')

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

  install -Dm644 "${srcdir}/mainsail-klipper.cfg" "${pkgdir}/usr/share/doc/${_pkgname}/mainsail-klipper.cfg"
  install -Dm644 "${srcdir}/mainsail-nginx.conf" "${pkgdir}/usr/share/doc/${_pkgname}/mainsail-nginx.conf"
}
