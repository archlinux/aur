# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=tarantool
pkgver=2.11.8
pkgrel=1
pkgdesc='Lua application server integrated with a database management system'
arch=(x86_64)
url='https://www.tarantool.org'
license=(BSD)
depends=(readline ncurses zlib libyaml openssl libunwind icu)
makedepends=(git cmake systemd)
checkdepends=(python-gevent python-tarantool python-yaml)
source=(git+https://github.com/tarantool/tarantool.git#tag=$pkgver
        tarantool-luajit::git+https://github.com/tarantool/luajit.git#branch=tarantool/archive/1.7
        tarantool-libyaml::git+https://github.com/tarantool/libyaml.git
        tarantool-msgpuck::git+https://github.com/tarantool/msgpuck.git
        git+https://github.com/luafun/luafun.git
        tarantool-test-run::git+https://github.com/tarantool/test-run.git
        tarantool-small::git+https://github.com/tarantool/small.git
        tarantool-zstd::git+https://github.com/tarantool/zstd.git
        tarantool-luarocks::git+https://github.com/tarantool/luarocks.git#branch=luarocks-3.1.3-tarantool
        tarantool-decNumber::git+https://github.com/tarantool/decNumber.git
        tarantool-curl::git+https://github.com/tarantool/curl.git
        tarantool-c-ares::git+https://github.com/tarantool/c-ares.git
        tarantool-xxHash::git+https://github.com/tarantool/xxHash.git
        tarantool-c-dt::git+https://github.com/tarantool/c-dt.git
        tarantool-lua-zlib::git+https://github.com/tarantool/lua-zlib.git
        tarantool-luazip::git+https://github.com/tarantool/luazip.git
        tarantool-nghttp2::git+https://github.com/tarantool/nghttp2.git
        tarantool-libunwind::git+https://github.com/tarantool/libunwind.git#branch=libunwind-1.6.2-tarantool
        tarantool-tz::git+https://github.com/tarantool/tz.git
        tarantool-checks::git+https://github.com/tarantool/checks.git
        tarantool.sysusers
        tarantool.service.override)
sha256sums=('f495425729ac5e5648454f4c8c74475905f6d48be4db2267536c865e652edd93'
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
            'SKIP'
            '2feccda75effbd44b40e43608e56395376ea7b9039a09aada91a05f9559b12fe'
            '93a8dd3a172a676d6850f624b19d832bac03b2658ae17d37638118b25c72a190')

prepare() {
  cd tarantool

  git submodule init
  git config -f .gitmodules 'submodule.third_party/luajit.url' "$srcdir/tarantool-luajit"
  git config -f .gitmodules 'submodule.third_party/libyaml.url' "$srcdir/tarantool-libyaml"
  git config -f .gitmodules 'submodule.src/lib/msgpuck.url' "$srcdir/tarantool-msgpuck"
  git config -f .gitmodules 'submodule.third_party/luafun.url' "$srcdir/luafun"
  git config -f .gitmodules 'submodule.test-run.url' "$srcdir/tarantool-test-run"
  git config -f .gitmodules 'submodule.src/lib/small.url' "$srcdir/tarantool-small"
  git config -f .gitmodules 'submodule.third_party/zstd.url' "$srcdir/tarantool-zstd"
  git config -f .gitmodules 'submodule.third_party/luarocks.url' "$srcdir/tarantool-luarocks"
  git config -f .gitmodules 'submodule.third_party/decNumber.url' "$srcdir/tarantool-decNumber"
  git config -f .gitmodules 'submodule.third_party/curl.url' "$srcdir/tarantool-curl"
  git config -f .gitmodules 'submodule.third_party/c-ares.url' "$srcdir/tarantool-c-ares"
  git config -f .gitmodules 'submodule.third_party/xxHash.url' "$srcdir/tarantool-xxHash"
  git config -f .gitmodules 'submodule.third_party/c-dt.url' "$srcdir/tarantool-c-dt"
  git config -f .gitmodules 'submodule.third_party/lua-zlib.url' "$srcdir/tarantool-lua-zlib"
  git config -f .gitmodules 'submodule.third_party/luazip.url' "$srcdir/tarantool-luazip"
  git config -f .gitmodules 'submodule.third_party/nghttp2.url' "$srcdir/tarantool-nghttp2"
  git config -f .gitmodules 'submodule.third_party/libunwind.url' "$srcdir/tarantool-libunwind"
  git config -f .gitmodules 'submodule.third_party/tz.url' "$srcdir/tarantool-tz"
  git config -f .gitmodules 'submodule.third_party/checks.url' "$srcdir/tarantool-checks"

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
