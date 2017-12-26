# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Enrico Bacis <enrico.bacis@gmail.com>
pkgname=edx-downloader-git
pkgname_git=edx-dl
pkgver=0.1.7.r6.g563cb8a
pkgrel=1
pkgdesc='A simple tool to download video lectures from edx.org.'
arch=('any')
url='https://github.com/coursera-dl/edx-dl'
license=('LGPL3')
makedepends=('git' 'pandoc')
depends=('python' 'python-beautifulsoup4' 'youtube-dl' 'python-six' 'python-html5lib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=('edx-dl::git+https://github.com/coursera-dl/edx-dl.git#branch=master'
        'req-html5lib.patch')
sha256sums=('SKIP'
            'bf4c762d46fe9e7a15402dbba9f0ab617d19f2349b6c801f49f77167fa23414e')

pkgver() {
  #msg "Downloading git repository..."
  #git clone https://github.com/coursera-dl/edx-dl.git "$srcdir/${pkgname%-git}"

  cd "$srcdir/${pkgname_git%-git}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname_git%-git}"
  patch -p0 -i ../req-html5lib.patch
}

package() {
  cd "$srcdir/${pkgname_git%-git}"
  #install -D -m 755 edx-dl.py "${pkgdir}/usr/bin/edx-downloader"
  pandoc --from=markdown --to=rst --output=README.rst README.md
  python setup.py install --root="$pkgdir/" --optimize=1
  ln -s "/usr/bin/edx-dl" "$pkgdir/usr/bin/edx-downloader"
}
