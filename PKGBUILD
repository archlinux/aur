# Maintainer: Fabian Zaremba <fabian at youremail dot eu>

pkgname=sslyze-git
pkgver=1.3.4.r19.g57e99f7
pkgrel=3
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url="https://github.com/nabla-c0d3/sslyze"
license=('AGPL3')
depends=('python2' 'python2-typing' 'python2-enum34' 'python2-cryptography')
makedepends=('git' 'perl')
provides=('sslyze')
conflicts=('sslyze')
options=('!makeflags')
source=("git+https://github.com/nabla-c0d3/nassl.git"
        "git+https://github.com/nabla-c0d3/sslyze.git"
        "git+https://github.com/nabla-c0d3/tls_parser.git"
        "git+https://github.com/openssl/openssl.git"
        "http://zlib.net/zlib-1.2.11.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1')

pkgver() {
  cd "$srcdir/sslyze"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
} 

build() {
  cd "$srcdir/"

  cp -r openssl openssl-1.0.2e
  cd openssl-1.0.2e
  git checkout OpenSSL_1_0_2e
  cd ..

  mv "$srcdir/openssl" "$srcdir/nassl/openssl-master"
  mv "$srcdir/openssl-1.0.2e" "$srcdir/nassl/openssl-1.0.2e"
  mv "$srcdir/zlib-1.2.11" "$srcdir/nassl/"

  cd "$srcdir/nassl"

  # Delete binaries that are shipped within the git repository
  find "$srcdir/nassl/bin" -type f -delete

  # Test nassl in check()
  grep -v NASSL_TEST_TASKS build_from_scratch.py > build_from_scratch_notest.py
  python2.7 build_from_scratch_notest.py
}

check() {
  export TRAVIS=true # Accept inconsistent result from ROBOT test
	
  cd "$srcdir/tls_parser"
  python2.7 run_tests.py

  cd "$srcdir/nassl"
  python2.7 run_tests.py

  cp -r "$srcdir/sslyze" "$srcdir/sslyze_test"
  cp -r "$srcdir/tls_parser/tls_parser" "$srcdir/sslyze_test/"
  cp -r "$srcdir/nassl/nassl" "$srcdir/sslyze_test/"
  cd "$srcdir/sslyze_test"
  python2.7 run_tests.py
  rm -rf "$srcdir/sslyze_test"
}

package() {
  cd "$srcdir/tls_parser"
  python2.7 setup.py install --root="$pkgdir" --optimize=1

  cd "$srcdir/nassl"
  python2.7 setup.py install --root="$pkgdir" --optimize=1

  cd "$srcdir/sslyze"
  python2.7 setup.py install --root="$pkgdir" --optimize=1

  # CLI launcher is now created by setup.py
}
