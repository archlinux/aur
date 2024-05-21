# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Y <y.archlinux@paritcher.com>

pkgname=luarocks-git
_pkgname=${pkgname%-git}
pkgver=v3.11.0.r12.gdc0af58
pkgrel=2
pkgdesc='Deployment and management system for Lua modules'
backup=(etc/luarocks/config-5.{1,2,3,4}.lua)
arch=('any')
url='https://luarocks.org/'
license=('custom')
replaces=('luarocks5.1' 'luarocks5.2')
depends=('coreutils' # need chmod, md5sum
         'curl' # need one of curl or wget
         'lua'
         'unzip' # need unzip and zip or lua-zlib
         'zip')
optdepends=('cvs: for fetching sources from CVS repositories'
            'git: for fetching sources from git repositories'
            'mercurial: for fetching sources from mercurial repositories'
            'cmake: for building rocks that use the cmake build system'
            'lua-sec: HTTPS support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/${_pkgname}/${_pkgname}"
        luarocks-make-manifest-5.{1,2,3,4}.hook
        "luarocks.bash"
        "luarocks.fish"
        "luarocks.zsh"
        "luarocks-admin.bash"
        "luarocks-admin.fish"
        "luarocks-admin.zsh"
        )
sha512sums=('SKIP'
            'cd90cba877c0dd435b44328a0869e3102c52eb36ed5b764c3ee8a78de95772fe094419dc032db2e2c91d9a0aa35ab7c6e8a13e29b9feeb3a3172d7a129d005c0'
            '25b2303f39ecf8e6ce44bd6c9f59d322eb748eea89e4ca31991fe36eae46949062bd4d3c876de488b4dd7354fcb0531b5e29454dec99a7f981f3dc857776d2bb'
            '5ac781ad861bb7c821daef5ca664c53d28f7f3a530b6ac1c0c64ec063476cb4e6b0a7705b86b67e0dbe3f439f4a46645ea430a5fb6a49b705d51f21788067fe3'
            '7c86aea103036be8ede7c0688ea2c45cfe2e9811710aacccc053530dae4bdfa0214e4e170c36de55d64d6fe851ee31923429678febe3c6790ac152945bc11264'
            'b34ea6fde901f531f841784c7f75dec3f72ac055333fd1dbafbb2da5f5963b2dd4b89e28d2099e57d201877d0b00ae44bd2aced92ab41ef7a775c8f452985d3a'
            '57378406df3a0454ef46b3b97aaf92bbf2f597ed8216a33757e351efbb151f1fc44ef0ad33f24031eb62f70d3737bf02fb72c3682ea1d533aa9495ca11566ed5'
            '4a24e6f44c13711ba42eab155d7e5699707e9b8d00158104065ce01d8cfdbe5ea9c1e4f12ed10b324caa076b6862a630a4638092827698a5455181e38d821869'
            'b43ccd818c3022b63690b6d060940bbbfd2775b1c174b9e99c8162ea0e746b276b4414c2489156e6bb9eae9ce41d83481022a5a757ea94b62074a6c8c57e9c5a'
            '6b52bd6f446586c3e7d5dbe1ba870e5e37c5bb9cdd5e5878959fa1c151b5a43d8b37c1dc43de46ff2c70c1f57c0429a85c382f53390179609a2880e5aa089497'
            'f6ab6c65aaaa2680ce83a3277a2aec4400d234ddfc17c62f44190928a53b7146c38f8a779aedc1c71fed3dd2f1833e1ca924080e98ecf7462274b0d9acb07f90')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr
  make ./build/luarocks ./build/luarocks-admin ./build/config-5.4.lua
  make LUA_VERSION=5.1 LUA=/usr/bin/lua5.1 LUA_INCDIR=/usr/include/lua5.1 ./build/config-5.1.lua
  make LUA_VERSION=5.2 LUA=/usr/bin/lua5.2 LUA_INCDIR=/usr/include/lua5.2 ./build/config-5.2.lua
  make LUA_VERSION=5.3 LUA=/usr/bin/lua5.3 LUA_INCDIR=/usr/include/lua5.3 ./build/config-5.3.lua
}

package() {
  install -Dm644 luarocks-make-manifest-5.1.hook "$pkgdir/usr/share/libalpm/hooks/luarocks-make-manifest-5.1.hook"
  install -Dm644 luarocks-make-manifest-5.2.hook "$pkgdir/usr/share/libalpm/hooks/luarocks-make-manifest-5.2.hook"
  install -Dm644 luarocks-make-manifest-5.3.hook "$pkgdir/usr/share/libalpm/hooks/luarocks-make-manifest-5.3.hook"
  install -Dm644 luarocks-make-manifest-5.4.hook "$pkgdir/usr/share/libalpm/hooks/luarocks-make-manifest-5.4.hook"

  install -Dm644 luarocks.bash "$pkgdir/usr/share/bash-completion/completions/luarocks"
  install -Dm644 luarocks.fish "$pkgdir/usr/share/fish/vendor_completions.d/luarocks.fish"
  install -Dm644 luarocks.zsh "$pkgdir/usr/share/zsh/site-functions/_luarocks"
  install -Dm644 luarocks-admin.bash "$pkgdir/usr/share/bash-completion/completions/luarocks-admin"
  install -Dm644 luarocks-admin.fish "$pkgdir/usr/share/fish/vendor_completions.d/luarocks-admin.fish"
  install -Dm644 luarocks-admin.zsh "$pkgdir/usr/share/zsh/site-functions/_luarocks-admin"

  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" LUA_VERSION=5.1 install-config
  make DESTDIR="$pkgdir" LUA_VERSION=5.2 install-config
  make DESTDIR="$pkgdir" LUA_VERSION=5.3 install-config
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
