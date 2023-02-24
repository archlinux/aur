# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=tarantool
pkgver=2.10.4
pkgrel=2
pkgdesc='Lua application server integrated with a database management system'
arch=(x86_64)
url='https://www.tarantool.org'
license=(BSD)
depends=(readline ncurses zlib libyaml openssl libunwind icu)
makedepends=(git cmake systemd)
checkdepends=(python-gevent python-tarantool python-yaml)
source=(git+https://github.com/tarantool/tarantool.git#tag=$pkgver
        git+https://github.com/tarantool/luajit.git#branch=tarantool-1.7
        git+https://github.com/tarantool/libyaml.git
        git+https://github.com/tarantool/msgpuck.git
        git+https://github.com/luafun/luafun.git
        git+https://github.com/tarantool/test-run.git
        git+https://github.com/tarantool/small.git
        git+https://github.com/tarantool/zstd.git
        git+https://github.com/tarantool/luarocks.git#branch=luarocks-3.1.3-tarantool
        git+https://github.com/tarantool/decNumber.git
        git+https://github.com/tarantool/curl.git
        git+https://github.com/tarantool/c-ares.git
        git+https://github.com/tarantool/xxHash
        git+https://github.com/tarantool/c-dt.git
        git+https://github.com/tarantool/lua-zlib.git
        git+https://github.com/tarantool/luazip.git
        git+https://github.com/tarantool/nghttp2.git
        git+https://github.com/tarantool/libunwind.git#branch=libunwind-1.6.2-tarantool
        git+https://github.com/tarantool/tz.git
        tarantool.sysusers
        tarantool.service.override)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2feccda75effbd44b40e43608e56395376ea7b9039a09aada91a05f9559b12fe'
            '93a8dd3a172a676d6850f624b19d832bac03b2658ae17d37638118b25c72a190')

prepare() {
  cd tarantool

  git submodule init
  git config -f .gitmodules 'submodule.third_party/luajit.url' "$srcdir/luajit"
  git config -f .gitmodules 'submodule.third_party/libyaml.url' "$srcdir/libyaml"
  git config -f .gitmodules 'submodule.src/lib/msgpuck.url' "$srcdir/msgpuck"
  git config -f .gitmodules 'submodule.third_party/luafun.url' "$srcdir/luafun"
  git config -f .gitmodules 'submodule.test-run.url' "$srcdir/test-run"
  git config -f .gitmodules 'submodule.src/lib/small.url' "$srcdir/small"
  git config -f .gitmodules 'submodule.third_party/zstd.url' "$srcdir/zstd"
  git config -f .gitmodules 'submodule.third_party/luarocks.url' "$srcdir/luarocks"
  git config -f .gitmodules 'submodule.third_party/decNumber.url' "$srcdir/decNumber"
  git config -f .gitmodules 'submodule.third_party/curl.url' "$srcdir/curl"
  git config -f .gitmodules 'submodule.third_party/c-ares.url' "$srcdir/c-ares"
  git config -f .gitmodules 'submodule.third_party/xxHash.url' "$srcdir/xxHash"
  git config -f .gitmodules 'submodule.third_party/c-dt.url' "$srcdir/c-dt"
  git config -f .gitmodules 'submodule.third_party/lua-zlib.url' "$srcdir/lua-zlib"
  git config -f .gitmodules 'submodule.third_party/luazip.url' "$srcdir/luazip"
  git config -f .gitmodules 'submodule.third_party/nghttp2.url' "$srcdir/nghttp2"
  git config -f .gitmodules 'submodule.third_party/libunwind.url' "$srcdir/libunwind"
  git config -f .gitmodules 'submodule.third_party/tz.url' "$srcdir/tz"

  git submodule sync
  git -c protocol.file.allow=always submodule update
}

build() {
  cd tarantool

  # tarantool uses git submodule, handle this
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_BINDIR=/usr/bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_SKIP_RPATH=ON \
    -DENABLE_BACKTRACE:BOOL=ON \
    -DWITH_SYSTEMD:BOOL=ON \
    -DENABLE_DIST:BOOL=ON \
    -DENABLE_LTO:BOOL=ON \
    .
  make
}

check() {
  cd "$srcdir/tarantool/test"
  python test-run.py --suite box
}

package() {
  cd tarantool
  make install DESTDIR="$pkgdir"

  rm "$pkgdir"/usr/lib/tmpfiles.d/tarantool.conf
  install -D -m644 "$srcdir"/tarantool.service.override "$pkgdir/usr/lib/systemd/system/tarantool@.service.d/override.conf"

  install -D -m644 "$srcdir"/tarantool.sysusers "$pkgdir/usr/lib/sysusers.d/tarantool.conf"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
