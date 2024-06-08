# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=formiko-git
pkgver=1.4.3.r41.g2834e96
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD-3-Clause')
arch=('any')
depends=(
  'gtk3'
  'gtksourceview3'
  'gtkspell3'
  'hicolor-icon-theme'
  'python'
  'python-docutils'
  'python-gobject'
  'webkit2gtk-4.1'
)
optdepends=(
  'neovim-gtk: for formiko-vim'
#  'python-docutils-html5-writer: HTML5 writer'
#  'python-docutils-tinyhtmlwriter: Tiny HTML5 writer'
  'python-m2r2: converting MarkDown to reStructuredText'
  'python-pygments: syntax color in html output code blocks'
  'python-recommonmark: for Common Mark support (MarkDown)'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'appstream'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/ondratu/formiko.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"
  appstreamcli validate --no-net "${pkgname%-git}.metainfo.xml"
  desktop-file-validate "${pkgname%-git}.desktop"
  desktop-file-validate "${pkgname%-git}-vim.desktop"
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
