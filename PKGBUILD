# Maintainer: <teraflops, cprieto.ortiz@gmail.com>

pkgname=mympc-git
pkgver=1.0.0
pkgrel=1
pkgdesc="An mpc wrapper with music library zsh completion and advanced tagging features"
arch=('any')
url="https://gitlab.com/teraflops/mympc"
license=('MIT')
depends=('zsh' 'mpc' 'mpd' 'python-mpd2' 'bash')
makedepends=('git' 'gnupg')  # Asegúrate de incluir gnupg para la verificación
provides=('mympc')
conflicts=('mympc')
source=("git+$url.git")
sha256sums=('SKIP')
install="$pkgname.install"

validpgpkeys=('463C26699946E6129B90A9E2CE7B6A8F1708ED21')

pkgver() {
  cd "$srcdir/mympc"
  # Obtener la última etiqueta anotada
  local latest_tag
  latest_tag=$(git describe --tags --abbrev=0)
  # Extraer la versión de la etiqueta (asumiendo formato vX.Y.Z)
  echo "${latest_tag#v}"
}

prepare() {
  cd "$srcdir/mympc"

  git fetch --tags --force
  git checkout "v$pkgver" || exit 1

  git tag -v "v$pkgver" || exit 1
}

package() {
  cd "$srcdir/mympc"
  install -Dm644 "usr/local/share/zsh/site-functions/_mympc" "$pkgdir/usr/local/share/zsh/site-functions/_mympc"
  install -Dm755 "usr/local/bin/mympc" "$pkgdir/usr/local/bin/mympc"
  install -Dm755 "usr/local/share/mympc/get_top_rated_tracks.py" "$pkgdir/usr/local/share/mympc/get_top_rated_tracks.py"
  install -Dm755 "usr/local/share/mympc/add_mood_tag.py" "$pkgdir/usr/local/share/mympc/add_mood_tag.py"
  install -Dm755 "usr/local/share/mympc/tags.sh" "$pkgdir/usr/local/share/mympc/tags.sh"
  install -Dm644 "usr/local/share/mympc/tags.conf" "$pkgdir/usr/local/share/mympc/tags.conf"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

