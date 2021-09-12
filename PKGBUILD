# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Enrico Bacis <enrico.bacis@gmail.com>
pkgname=edx-downloader-git
pkgname_git=edx-dl
pkgver=0.1.12.r2.g1009c18
pkgrel=1
pkgdesc='A simple tool to download video lectures from edx.org.'
arch=('any')
url='https://github.com/coursera-dl/edx-dl'
license=('LGPL3')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-beautifulsoup4' 'youtube-dl' 'python-six' 'python-html5lib' 'python-requests')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=('edx-dl::git+https://github.com/coursera-dl/edx-dl.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname_git%-git}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${pkgname_git%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.md "${pkgdir}/usr/share/doc/edx-downloader/README.md"
  ln -s "/usr/bin/edx-dl" "$pkgdir/usr/bin/edx-downloader"
}
