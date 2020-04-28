# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-sci-lang' 'lua51-sci-lang' 'lua52-sci-lang')
_rockname=sci-lang
pkgver=1.0.0.beta10
_pkgver=1.0.0-beta10
pkgrel=1
pkgdesc="Syntax extensions to LuaJIT for scientific computing"
arch=('x86_64')
url='https://scilua.org/'
license=('MIT')
provides=('scilua')
depends=('luajit'
         'lua-sci'
         'lua51-sci'
         'lua52-sci')
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stepelu/lua-sci-lang/archive/v${_pkgver}.tar.gz"
        "${_rockname}-${pkgver}-1.rockspec")
sha256sums=('1c97fff2171972b3617fa9acf9c330f7a186d1613a64804f4cfba78c4dcd50f2'
            '31cd7d3b194543b9373ba85548ac270cc7bdb20713bf9d4c0a12f2183391c097')

prepare() {
  ln -s "${srcdir}/${_rockname}-${pkgver}-1.rockspec" "lua-${_rockname}-${_pkgver}/"
}

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../"sci-lang-$pkgver-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../"sci-lang-$pkgver-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../"sci-lang-$pkgver-1.rockspec")

  rm "${srcdir}/${pkgname}-${_pkgver}/sci-lang-${pkgver}-1.rockspec"
}

package_lua-sci-lang() {
  pkgdesc='Syntax extensions to LuaJIT for scientific computing for Lua 5.3'
  depends=('lua51-sci-lang' 'lua52-sci-lang' 'luajit'
           'lua-sci' 'lua51-sci' 'lua52-sci')

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/${_rockname}-${pkgver}-1.all.rock
  echo "#!/usr/bin/env bash
  luajit /usr/share/lua/5.3/sci-lang/__bin/scilua.lua \$@" > scilua
  install -Dm755 scilua "${pkgdir}/usr/bin/scilua"

  install -Dm644 "${srcdir}/lua-${_rockname}-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-sci-lang() {
  pkgdesc='Syntax extensions to LuaJIT for scientific computing for Lua 5.1'
  depends=('lua-sci-lang' 'lua52-sci-lang' 'luajit'
           'lua-sci' 'lua51-sci' 'lua52-sci')

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/${_rockname}-${pkgver}-1.all.rock

  echo "#!/usr/bin/env bash
  luajit /usr/share/lua/5.1/sci-lang/__bin/scilua.lua \$@" > scilua51
  install -Dm755 scilua "${pkgdir}/usr/bin/scilua51"

  install -Dm644 "${srcdir}/lua-sci-lang-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-sci-lang() {
  pkgdesc='Syntax extensions to LuaJIT for scientific computing for Lua 5.2'
  depends=('lua-sci-lang' 'lua51-sci-lang' 'luajit'
           'lua-sci' 'lua51-sci' 'lua52-sci')

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/${_rockname}-${pkgver}-1.all.rock

  echo "#!/usr/bin/env bash
  luajit /usr/share/lua/5.2/sci-lang/__bin/scilua.lua \$@" > scilua52
  install -Dm755 scilua "${pkgdir}/usr/bin/scilua52"

  install -Dm644 "${srcdir}/lua-sci-lang-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}