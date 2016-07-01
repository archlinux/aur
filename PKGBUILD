# Maintainer: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
pkgname=cpplint
pkgver=456.r8
_commit=01f0f704f7ff052f601a7fa39e7194f885176701
pkgrel=1
pkgdesc="Automated checker to make sure a C++ file follows Google's C++ style guide."
arch=('any')
url='https://google.github.io/styleguide/cppguide.html'
license=('custom:BSD3')
groups=()
depends=('python2')
source=("cpplint-${_commit}.py::https://raw.githubusercontent.com/google/styleguide/${_commit}/cpplint/cpplint.py"
        "README-${_commit}::https://raw.githubusercontent.com/google/styleguide/${_commit}/cpplint/README"
        "cpplint_unittest-${_commit}.py::https://raw.githubusercontent.com/google/styleguide/${_commit}/cpplint/cpplint_unittest.py"
        "cpplint_test_header-${_commit}.h::https://raw.githubusercontent.com/google/styleguide/${_commit}/cpplint/cpplint_test_header.h")
sha256sums=('9e076acdaa6346118ee37835b51903c0850a84face3a42ce704c5f15dbc72ce5'
            'a2a49a15fc0db21a0c130e57fb5894954d81bc95962fc90be2e70d2daaa27d89'
            '956275c1cb6ce771e8ef4b5f29bd0a018e2d5d819838f88a45f05c6502e5057a'
            'ca87382ffce185c94adf1f33d46ec5f20d13bfe41549a5e243095ce1117f0b12')

build() {
  sed -i 's%/usr/bin/env python%/usr/bin/env python2%' "cpplint-${_commit}.py"

  # extract license from source
  sed -r '/^# Copyright/,/^$/!d; /^#/!d; s/# (.*)|#/\1/' "cpplint-${_commit}.py" > "LICENSE-$_commit"

  # ensure license hasn't changed
  sha256sum -c <(echo "70eb89e4cb460d1b27173348c9f9fca5cf67c09d722ddaa07c5d0fcd6262a97e LICENSE-$_commit")
}

check() {
  [ -d "cpplint" ] && rm -r "cpplint"
  mkdir "cpplint"
  cp "cpplint-${_commit}.py" "cpplint/cpplint.py"
  cp "cpplint_unittest-${_commit}.py" "cpplint/cpplint_unittest.py"
  cp "cpplint_test_header-${_commit}.h" "cpplint/cpplint_test_header.h"

  # one of the unit tests assumes it's being run in a clone of
  # https://github.com/google/styleguide, this makes the test work:
  touch ".svn" "cpplint/.svn"

  cd "cpplint"
  python2 cpplint_unittest.py
}

package() {
  install -Dm755 "cpplint-${_commit}.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README-$_commit" "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 "LICENSE-$_commit" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
