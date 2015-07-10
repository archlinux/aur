# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Enrico Bacis <enrico.bacis@gmail.com>
pkgname=edx-downloader-git
pkgver=latest
pkgrel=2
pkgdesc='A simple tool to download video lectures from edx.org.'
arch=('any')
url='https://github.com/shk3/edx-downloader'
license=('unknown')
makedepends=('git')
depends=('python' 'python-beautifulsoup4' 'youtube-dl' 'python-six' 'python-html5lib' 'pandoc-bin')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

# it downloads 20MB of useless pack files
#source=("${pkgname%-git}::git://github.com/shk3/edx-downloader.git")
#md5sums=('SKIP')

pkgver() {
  msg "Downloading git repository..."
  git clone https://github.com/shk3/edx-downloader.git "$srcdir/${pkgname%-git}"

  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${pkgname%-git}"
  #install -D -m 755 edx-dl.py "${pkgdir}/usr/bin/edx-downloader"
  pandoc --from=markdown --to=rst --output=README.rst README.md
  python setup.py install --root="$pkgdir/" --optimize=1
}
