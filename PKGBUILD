# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gfms-git
pkgver=20140621
pkgrel=1
pkgdesc="Github Flavored Markdown Server with web preview and PDF export"
arch=('i686' 'x86_64')
depends=('nodejs')
makedepends=('git' 'npm')
optdepends=('phantomjs: export to PDF by appending ?pdf to URL')
url="https://github.com/pawel-wiejacha/gfms"
license=('MIT')
source=(git+https://github.com/pawel-wiejacha/gfms
        gfms.sh)
sha256sums=('SKIP'
            '228aaa509ae37b75963a3b39639459b453312000be470b498792e9243378e7f2')
options=('!strip')
provides=('gfms')
conflicts=('gfms')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Fetching NPM dependencies...'
  npm install --python=python2
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/share/gfms"
  find . -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/gfms" \;

  msg 'Installing executable...'
  install -Dm 755 "$srcdir/gfms.sh" "$pkgdir/usr/bin/gfms"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
