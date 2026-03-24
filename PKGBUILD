# Maintainer: Dhruva Sambrani <dhruvasambrani19 at gmail dot com>
# Previous Maintainer: André Kugland <kugland at gmail dot com>

pkgname=ttf-tiro-indigo-git
pkgdesc="Tiro Indigo Indic Typefaces, based on the series of fonts for Harvard's Murty Classical Library of India. Includes Bangla (Bengali), Devanagiri (Hindi, Sanskrit and Marathi varients), Gurmukhi (Punjabi), Kannada, Tamil and Telugu (built from source)"
pkgver=1.65.r0.gbb6971b # This will be dynamically updated by pkgver()
pkgrel=1
arch=('any')
url="https://github.com/TiroTypeworks/Indigo"
license=('OFL')
provides=('ttf-tiro-indigo')
conflicts=('ttf-tiro-indigo' 'ttf-tiro-indigo-bin')
makedepends=('git' 'python' 'python-pip')
source=("${pkgname%-git}::git+https://github.com/TiroTypeworks/Indigo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m venv venv
  source venv/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  python tools/tirobuild.py indigo.yml
}

package() {
  cd "$srcdir/${pkgname%-git}"
  local fontdir="$pkgdir/usr/share/fonts/TiroIndigo-ttf"
  install -d "$fontdir"
  find output -type f -name "*.ttf" -exec install -m644 {} -t "$fontdir" \;
  install -Dm644 LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
