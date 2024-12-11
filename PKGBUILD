# Maintainer: Philipp Joram <mail at phijor dot me>
# Contributor: Petr Špaček <pspacek at isc dot org>

_lua_version=5.4
_lua_name=luaprompt

pkgname=(lua-${_lua_name} lua53-${_lua_name} lua52-${_lua_name} lua51-${_lua_name})
pkgver=0.9
pkgrel=1
pkgdesc="An embeddable Lua command prompt as well as a stand-alone interpreter with pretty-printing and autocompletion."
arch=(i686 x86_64)
url="https://github.com/dpapavas/luaprompt"
license=('MIT')
makedepends=(lua lua53 lua52 lua51)
depends=("lua-argparse")
source=("${pkgname}-${pkgver}::https://github.com/dpapavas/luaprompt/archive/v${pkgver}.tar.gz")
# Upstream does not provide source archives with a stable checksum
md5sums=('bf7f7fc6171c395156c97508f9e2cbbe')

_package() {
  cp -a "$srcdir/$_lua_name-$pkgver" "$srcdir/$_lua_name-$pkgver-$1"
  cd "$srcdir/$_lua_name-$pkgver-$1"

  if [[ $1 != $_lua_version ]]; then
    depends=("lua${1/\./}-argparse")
    sed -i 's=\$(BINDIR)/luap=$(BINDIR)/luap'"$1=" Makefile
    sed -i 's=\$(MAN1DIR)/luap.1=$(MAN1DIR)/luap'"$1.1=" Makefile
    sed -i '1s=lua=lua'"$1"'=' luap.lua
  fi

  make PREFIX=/usr \
    VERSION=$1

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" \
    VERSION=$1 install

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/usr/share/"{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
	export LUA_PATH_${1/./_}="./share/lua/$1/?.lua;./?.lua;./?/init.lua;;/usr/share/lua/$1/?.lua;/usr/share/lua/$1.lua"
	export LUA_CPATH_${1/./_}="./lib/lua/$1/?.so;./?.so;./?/init.so;;/usr/lib/lua/$1/?.so;/usr/lib/lua/$1.so"
}

_complete() {
	pushd "$pkgdir/usr" || exit 1
	for program; do
		"bin/$program" --completion bash | tee "$pkgdir/usr/share/bash-completion/completions/$program"
		"bin/$program" --completion zsh | tee "$pkgdir/usr/share/zsh/site-functions/_$program"
		"bin/$program" --completion fish | tee "$pkgdir/usr/share/fish/vendor_completions.d/$program.fish"
	done
	popd || exit 1
}

package_lua51-luaprompt() {
  _package 5.1
	_complete luap5.1
}

package_lua52-luaprompt() {
  _package 5.2
	_complete luap5.2
}

package_lua53-luaprompt() {
  _package 5.3
	_complete luap5.3
}

package_lua-luaprompt() {
  _package $_lua_version
	_complete luap
}
# vim:set ts=2 sw=2 et:
