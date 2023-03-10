# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=steamback-git
pkgver=r194.b0685cf
pkgrel=1
pkgdesc="Add versioned save-game snapshots to Steam-cloud enabled games."
arch=('x86_64')
url="https://github.com/geeksville/steamback"
license=('GPL3')
depends=('python-async-tkinter-loop' 'python-pillow' 'python-platformdirs'
         'python-psutil' 'python-sv-ttk' 'python-timeago')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm'
             'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/geeksville/steamback.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '8331fcc39c1d80640cb314db5acd47cad1df35278279b75001e99c844df6bd51')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "py_modules/${pkgname%-git}/data/icons8-refresh-96.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}
