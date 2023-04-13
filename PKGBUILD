# Maintainer: chrhasse <hasse dot christopher at gmail dot com>
pkgname=ranger-sixel-git
_pkgname=ranger-git
pkgver=1.9.3.644.gffa6cf79
pkgrel=1
pkgdesc="A simple, vim-like file manager, with PR2466 applied for sixel image previews."
arch=('any')
url="https://github.com/ranger/ranger/pull/2466"
license=('GPL')
depends=('python') #python(>=2.6 or >=3.1)
makedepends=('git' 'python-setuptools')
optdepends=('atool: for previews of archives'
            'file: for determining file types'
            'highlight: for syntax highlighting of code'
            'libcaca: for ASCII-art image previews'
            'mediainfo: for viewing information about media files'
            'perl-image-exiftool: for viewing information about media files'
            'poppler: for pdf previews'
            'python-bidi: for bidi algorithm support'
            'python-chardet: in case of encoding detection problems'
            'python-ueberzug: w3mimgdisplay alternative'
            'sudo: to use the "run as root"-feature'
            'transmission-cli: for viewing bittorrent information'
            'w3m: for previews of images and html pages'
            'imagemagick: for sixel image previews')
provides=('ranger')
conflicts=('ranger')
source=("$_pkgname::git+https://github.com/ranger/ranger")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  export GIT_CONFIG_GLOBAL="/dev/null"
  export GIT_CONFIG_SYSTEM="/dev/null"
  git config user.name "user"
  git config user.email "user@domain.fake"
  git config pull.rebase false
  git pull -X theirs origin pull/2466/head --no-edit
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py -q install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${_pkgname%-*}/LICENSE
}

