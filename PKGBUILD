# Author: Mathieu Boespflug <mboes@tweag.net> (original 0.9.21)
# Maintainer: Alexey Stukalov <astukalov@gmail.com> (maintainance of 2.x-3.x series)
# Contributor: Nikolay Amiantov <nikoamia@gmail.com> (added bindings packaging)
# Contributor: Ivan Kanakarakis <ivan.kanak@gmail.com> (fixed bison failures)
pkgname=zorba
pkgver=3.0
pkgrel=2
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
source=(http://launchpad.net/${pkgname}/trunk/3.0/+download/${pkgname}-${pkgver}.tar.gz
        item_handle.patch
        bindings_dirs.patch
	swig_xqj.patch
        parser_bison_3_0_compatibility.patch
)
md5sums=('652e67103597e36126586ed1432e23bd'
         '1ec5d529746472147af9c325b0f49a62'
         '465cb60352b3a564da363b3e1cc80dcf'
         '93227da5598469f57eb1ff44e225c8d6'
	 'a578bf5966ab6dca4bdecfda5dff13c7')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p1 -i ../item_handle.patch
  patch -p1 -i ../bindings_dirs.patch
  patch -p1 -i ../swig_xqj.patch
  patch -p1 -i ../parser_bison_3_0_compatibility.patch
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

