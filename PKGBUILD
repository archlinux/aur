# Author: Mathieu Boespflug <mboes@tweag.net> (original 0.9.21)
# Maintainer: Alexey Stukalov <astukalov@gmail.com> (maintainance of 2.x-3.x series)
# Contributor: Nikolay Amiantov <nikoamia@gmail.com> (added bindings packaging)
# Contributor: Ivan Kanakarakis <ivan.kanak@gmail.com> (fixed bison failures)
pkgname=zorba
pkgver=4.0
pkgrel=1
pkgdesc="NoSQL(XQuery/JSONiq) Query Processor written in C++."
url="http://www.zorba.io/"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('libxml2>=2.7.0'
         'libxslt>=1.1.24'
         'icu>=3.6'
         'boost>=1.47'
         'xerces-c>=3.0.0'
)
optdepends=('curl>=7.21.0: REST and HTTP support'
            'python2: python 2 bindings'
            'java-runtime: java bindings'
            'ruby: ruby bindings'
)
makedepends=('cmake>=2.8.0'
             'flex>=2.5.33'
             'bison>=2.6'
             'gcc>=4.7'
             'swig>=1.3.40'
             'python2'
             'java-environment'
             'ruby'
)
source=(https://github.com/zorba-processor/zorba/archive/${pkgver}.tar.gz
        bindings_dirs.patch
	swig_xqj.patch
)
sha512sums=('8173de6058c72b2a804a91f8f888c27f3d2af2e288512ce4908cc3582858ad9f708ce434e1069ef9e4c8fe5a61b076829b3f8aed266d45548a3f1eda387f1100'
            '0a25606f608d42bfb47415a5908413581d2bc94b37527cde74b12c5b70c949a61904784ee4ddd0df65f24cb61c9f8bb2a08d6d847789511bc4a41ee0b53fb260'
            '8f3fb456daf70fdafbf2cabcabd3632f9d30371aec7ae3da58fc8dd2e5ddba66f5905fb461ef511afa93c6d47cf569ea9d3df632229c512f64a4c2d93708d66e')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p1 -i ../bindings_dirs.patch
  patch -p1 -i ../swig_xqj.patch
}

build() {
  mkdir "$srcdir/${pkgname}-${pkgver}/build" || true
  cd "$srcdir/${pkgname}-${pkgver}/build"

  python_ver="$(python2 -c 'import sys; print(sys.version[:3])')"
  ruby_ver="$(ruby -e 'puts RUBY_VERSION')"

  msg2 "Configuring..."
  cmake -Wno-dev \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -std=gnu++11 -Wno-c++0x-compat"         \
	-DCMAKE_EXE_LINKER_FLAGS="-pthread"                                    \
        -DCMAKE_BUILD_TYPE=Release                                             \
        -DCMAKE_INSTALL_PREFIX=/usr                                            \
        -DPYTHON_INSTALL_PATH="/usr/lib/python$python_ver/site-packages"       \
        -DRUBY_INSTALL_PATH="/usr/lib/ruby/vendor_ruby/$ruby_ver/$CARCH-linux" \
        "$srcdir/${pkgname}-${pkgver}"

  msg2 "Compiling..."
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install

  # compile python bindings
  python_ver="$(python2 -c 'import sys; print(sys.version[:3])')"
  python2 -m compileall "$pkgdir/usr/lib/python$python_ver"
  python2 -Om compileall "$pkgdir/usr/lib/python$python_ver"
}

