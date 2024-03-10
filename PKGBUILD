# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=steamback-git
pkgver=1.0.0.r25.gba41859
pkgrel=1
pkgdesc="Add versioned save-game snapshots to Steam-cloud enabled games."
arch=('x86_64')
url="https://github.com/geeksville/steamback"
license=('GPL-3.0-or-later')
depends=(
  'python-async-tkinter-loop'
  'python-pillow'
  'python-platformdirs'
  'python-psutil'
  'python-sv-ttk'
  'python-timeago'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/geeksville/steamback.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '8331fcc39c1d80640cb314db5acd47cad1df35278279b75001e99c844df6bd51')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "defaults/py_modules/${pkgname%-git}/data/icons8-refresh-96.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}
