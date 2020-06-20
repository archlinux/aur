# Maintainer: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
pkgname=cpplint
pkgver='456.r42'
_commit=08268efb062ca77eb623e5745a2b11424f5951e0
pkgrel=1
pkgdesc="Automated checker to make sure a C++ file follows Google's C++ style guide."
arch=('any')
url='https://google.github.io/styleguide/cppguide.html'
license=('custom:BSD3')
groups=()
depends=('python2')
makedepends=('git')
source=("styleguide::git+https://github.com/google/styleguide.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$srcdir/styleguide/cpplint"

  sed -i 's%/usr/bin/env python%/usr/bin/env python2%' "cpplint.py"

  # extract license from source
  sed -r '/^# Copyright/,/^$/!d; /^#/!d; s/# (.*)|#/\1/' "cpplint.py" > "LICENSE"

  # ensure license hasn't changed
  sha256sum -c <(echo "70eb89e4cb460d1b27173348c9f9fca5cf67c09d722ddaa07c5d0fcd6262a97e LICENSE")
}

check() {
  cd "$srcdir/styleguide/cpplint"

  # unit test gets confused by the styleguide git repo being
  # checked out inside the AUR package's git repo.
  # we have to fake it out with a pretend SVN repo.
  touch {..,.,nested}/.svn

  python2 cpplint_unittest.py
}

package() {
  cd "$srcdir/styleguide/cpplint"

  install -Dm755 "cpplint.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README" "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
