# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.14.0
pkgrel=1
pkgdesc="Sass makes CSS fun again (canonical implementation)"
arch=(any)
url="http://sass-lang.com/"
license=('MIT')
depends=(dart bash)
provides=('sass')
conflicts=('ruby-sass')
source=("https://github.com/sass/$pkgname/archive/$pkgver.tar.gz" "sass.sh")
sha256sums=('07a88eb1b08bb64093c09fa681f7a1ac2925d083b2fb2e9f0d400c169ebcba31'
            '14c6034f43b2577ef4779ed4e8e6c539fb6f8f7ffdb0147bfe9d501e08cf88e7')

build() {
  cd "$pkgname-$pkgver"
  pub get
  # Create snapshot
  # This doesn't use the grinder script so it is compatible with dart 2
  dart --snapshot=sass.snapshot --snapshot-kind=app-jit bin/sass.dart tool/app-snapshot-input.scss > /dev/null
}

package() {
  install -D -m755 sass.sh "$pkgdir/usr/bin/sass"
  cd "$pkgname-$pkgver"
  install -D -m644 sass.snapshot "$pkgdir/usr/lib/sass/app.snapshot"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
