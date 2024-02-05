# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

_gitname=wpgtk
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=deviantfero # deviantfero
pkgver=r912.4e2e8ff
pkgrel=1
pkgdesc="A gui wallpaper chooser that changes your WM theme, GTK theme and more"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPLv2')
source=("git+https://github.com/${_gitauthor}/${_gitname}.git"
        "wpgtk.png::https://github.githubassets.com/images/icons/emoji/unicode/1f3b4.png")
noextract=('wpgtk.png')
sha512sums=('SKIP' 'SKIP')
arch=('any')
makedepends=('python-setuptools' 'git' 'python-build' 'python-installer')
depends=('python' 'python-pillow' 'python-gobject' 'gtk3' 'libxslt' 'python-pywal')
optdepends=('feh: set wallpaper'
            'nitrogen: set wallpaper'
			'xsettingsd: live reload GTK+ theme')
conflicts=("${_gitname}")
provides=("${_gitname}=$pkgver")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  python -m build --wheel
}

package() {
  cd "${srcdir}/${_gitname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_gitname/$_gitname/misc/wpgtk.desktop" \
                 "$pkgdir/usr/share/applications/wpgtk.desktop"
  install -Dm644 "$srcdir/wpgtk.png" \
                 "$pkgdir/usr/share/pixmaps/wpgtk.png"
  install -Dm644 "$srcdir/$_gitname/completions/bash/wpg" \
                 "$pkgdir/usr/share/bash-completion/wpg"
  install -Dm644 "$srcdir/$_gitname/completions/zsh/_wpg" \
                 "$pkgdir/usr/share/zsh/site-functions/_wpg"
  install -Dm644 "$srcdir/$_gitname/$_gitname/misc/wpg-install.sh" \
                 "$pkgdir/usr/bin/wpg-install.sh"
}
