# Maintainer: Kars Wang <jaklsy g-mail>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname='moonscript'
pkgver='0.5.0_1'
_pkgver="$(sed 's/_/-/g' <<< "$pkgver")"
_tarball_ver="$(sed 's/_.*$//' <<< "$pkgver")"
pkgrel='1'
pkgdesc='A programmer friendly language that compiles to Lua'
arch=('x86_64' 'i686')
url='http://moonscript.org'
license=('MIT')
depends=('luarocks' 'lua>=5.1' 'lua-lpeg>=0.10' 'lua-alt-getopt>=0.7' 'lua-filesystem>=1.5')
makedepends=('git' 'curl')
source=("https://luarocks.org/manifests/leafo/moonscript-${_pkgver}.rockspec"
        "https://github.com/leafo/moonscript/archive/v${_tarball_ver}.tar.gz")
sha256sums=('cd4803862a15ecb73887bee9081e1a5ca28d280b94a8822c5f95cd667fddd31b'
            '1adb5bb38f9c6f306250f6e90d92796fe100408ee062ac0d14f3c4c22c92e682')
install='rock.install'

_lua_ver="$(lua -e 'print(_VERSION)' | cut -d ' ' -f 2)"

build() {
    cd "${srcdir}/moonscript-${_tarball_ver}"
    luarocks make --pack-binary-rock "${srcdir}/moonscript-${_pkgver}.rockspec"
}

package() {
    cd "${srcdir}/moonscript-${_tarball_ver}"
    luarocks --to="${pkgdir}/usr" install --deps-mode=none --keep "moonscript-${_pkgver}".*.rock
    rm -- "${pkgdir}/usr/lib/luarocks/rocks-${_lua_ver}/manifest"

    write_moon > "${pkgdir}/usr/bin/moon"
    write_moonc > "${pkgdir}/usr/bin/moonc"
}

write_moon() {
    cat << EOF
#!/bin/sh

exec '/usr/bin/lua' -e 'package.path="/usr/share/lua/${_lua_ver}/?.lua;/usr/share/lua/${_lua_ver}/?/init.lua;"..package.path; package.cpath="/usr/lib/lua/${_lua_ver}/?.so;"..package.cpath' -e 'local k,l,_=pcall(require,"luarocks.loader") _=k and l.add_context("moonscript","${_pkgver}")' '/usr/lib/luarocks/rocks-${_lua_ver}/moonscript/${_pkgver}/bin/moon' "\$@"
EOF
}

write_moonc() {
    cat << EOF
#!/bin/sh

exec '/usr/bin/lua' -e 'package.path="/usr/share/lua/${_lua_ver}/?.lua;/usr/share/lua/${_lua_ver}/?/init.lua;"..package.path; package.cpath="/usr/lib/lua/${_lua_ver}/?.so;"..package.cpath' -e 'local k,l,_=pcall(require,"luarocks.loader") _=k and l.add_context("moonscript","${_pkgver}")' '/usr/lib/luarocks/rocks-${_lua_ver}/moonscript/${_pkgver}/bin/moonc' "\$@"
EOF
}