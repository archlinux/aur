# Maintainer: fanfly <fanfly at pm dot me>
pkgname=akochan
pkgver=r87.53188a0
pkgrel=3
pkgdesc="Artificial Intelligence for Japanese mahjong"
arch=('any')
url="https://github.com/critter-mj/akochan"
license=('custom')
depends=('boost')
makedepends=('git')
install=
changelog=
source=("git+https://github.com/critter-mj/akochan")
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  iconv -f shift-jis -t utf-8 LICENSE -o LICENSE.new
  mv LICENSE.new LICENSE

  grep -q '#include <cstdint>' share/json11.cpp || \
    sed -i '/#include <cstdio>/a #include <cstdint>' share/json11.cpp

  # Drop the obsolete flag (Boost.System is header-only since 1.69).
  sed -i 's/ *-lboost_system//' Makefile_Linux ai_src/Makefile_Linux

  # Modernise removed Boost.Asio APIs.
  sed -i 's/boost::asio::io_service/boost::asio::io_context/g' \
    mjai_client.hpp mjai_client.cpp
  sed -i 's/boost::asio::ip::address::from_string/boost::asio::ip::make_address/g' \
    mjai_client.cpp
  sed -i 's/boost::asio::buffer_cast<const char \*>(buffer.data())/static_cast<const char *>(buffer.data().data())/' \
    mjai_client.cpp
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	pushd ai_src
	make -f Makefile_Linux
	popd
	make -f Makefile_Linux
}

package() {
	install -dm755 "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname/system.exe" "$pkgdir/opt/$pkgname/"
	install -Dm755 "$srcdir/$pkgname/mjai.sh" "$pkgdir/opt/$pkgname/"
	install -Dm644 "$srcdir/$pkgname/readme.md" "$pkgdir/opt/$pkgname/"
	install -Dm644 "$srcdir/$pkgname/readme_jpn.md" "$pkgdir/opt/$pkgname/"
	install -Dm644 "$srcdir/$pkgname/haifu_log_sample.json" "$pkgdir/opt/$pkgname/"
	install -Dm644 "$srcdir/$pkgname/setup_match.json" "$pkgdir/opt/$pkgname/"
	install -Dm644 "$srcdir/$pkgname/setup_mjai.json" "$pkgdir/opt/$pkgname/"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/opt/$pkgname/"
	cp -rp "$srcdir/$pkgname/params" -t "$pkgdir/opt/$pkgname/"
	cp -rp "$srcdir/$pkgname/match_result" -t "$pkgdir/opt/$pkgname/"

	install -dm755 "$pkgdir/usr/lib"
	install -Dm755 "$srcdir/$pkgname/libai.so" "$pkgdir/usr/lib/"

	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
