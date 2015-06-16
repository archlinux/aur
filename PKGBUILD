# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Bruno Vieira <mail@bmpvieira.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=casperjs-git
pkgver=20150602
pkgrel=1
pkgdesc="Navigation scripting & testing utility for PhantomJS and SlimerJS"
arch=('i686' 'x86_64')
depends=('nodejs' 'python2')
makedepends=('git' 'npm' 'python2-sphinx')
optdepends=('slimerjs: run your tests against Gecko (Firefox) instead of Webkit (just add –engine=slimerjs to your command line options)')
url="https://github.com/n1k0/casperjs"
license=('MIT')
source=(git+https://github.com/n1k0/casperjs)
sha256sums=('SKIP')
options=('!strip')
provides=('casperjs')
conflicts=('casperjs')
_pkgname=${pkgname%-git}

pkgver() {
  cd $_pkgname
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd $_pkgname

  msg 'Fetching NPM dependencies...'
  npm install --python=python2

  msg 'Building man pages...'
  make build -C docs/
}

package() {
  cd $_pkgname

  msg 'Installing license...'
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/${pkgname%-git}"
  find docs/_build/ -mindepth 1 -maxdepth 1 -type f -name "*.html" -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/doc/${pkgname%-git}" \;
  cp -dpr --no-preserve=ownership docs CHANGELOG.md CONTRIBUTING.md README.md \
    "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg 'Installing...'
  install -dm 755 "$pkgdir/opt/$_pkgname"
  install -dm 755 "$pkgdir/{usr/share,opt}/$_pkgname"
  find . -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/opt/$_pkgname" \;

  mkdir -m755 -p $pkgdir/usr/bin
  mkdir -m755 -p $pkgdir/opt/casperjs/bin
  
  install -m755 bin/* "$pkgdir"/opt/casperjs/bin
  install -m755 package.json "$pkgdir"/opt/casperjs/
  ln -sf /opt/$_pkgname/bin/$_pkgname $pkgdir/usr/bin/$_pkgname

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
