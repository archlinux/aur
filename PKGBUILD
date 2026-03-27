# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luatrace-git' 'lua51-luatrace-git' 'lua52-luatrace-git' 'lua53-luatrace-git' 'lua54-luatrace-git')
_pkgbase='luatrace'
_lua_cur=5.5
_lua_next=5.6
pkgver=r143.d9d8918
pkgrel=4
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/geoffleyland/luatrace'
license=('MIT')
makedepends=('git' "lua>=${_lua_cur}" "lua<${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=('git+https://github.com/geoffleyland/luatrace.git'
"${_pkgbase}-compat.patch"
"${_pkgbase}-updates.patch"
'luatrace.profile')

pkgver() {
	cd "$srcdir/${_pkgbase}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgbase}"
    patch --forward --strip=1 --input="${srcdir}/${_pkgbase}-compat.patch"
    patch --forward --strip=1 --input="${srcdir}/${_pkgbase}-updates.patch"
}

_build() {
    LUA_V=$1

    if [[ $LUA_V = $_lua_cur ]] ; then
        gcc -fPIC $CPPFLAGS $CFLAGS -o c/c_hook.o -c c/c_hook.c
    else
        gcc -fPIC $CPPFLAGS $CFLAGS -I/usr/include/lua$LUA_V -o c/c_hook.o -c c/c_hook.c
    fi

    gcc -shared $LDFLAGS -o c_hook-$LUA_V.so c/c_hook.o
}

build() {
    cd "${_pkgbase}"

    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build $v
    done
}

_package() {
    LUA_V=$1

    install -D c_hook-${LUA_V}.so "$pkgdir/usr/lib/lua/${LUA_V}/luatrace/c_hook.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd lua
    find * -type d | while read dir ; do
      if test -n "$(find $dir -name '*.lua' -print -quit)" ; then
        install -Dm755 -d "$pkgdir/usr/share/lua/${LUA_V}/$dir"
        install -Dm644 $dir/*.lua "$pkgdir/usr/share/lua/${LUA_V}/$dir/"
      fi
    done

    install -Dm644 *.lua "$pkgdir/usr/share/lua/"
}

package_lua-luatrace-git() {
    pkgdesc="luatrace for Lua ${_lua_cur}"
    provides=('lua-luatrace')
    conflicts=('lua-luatrace')
    depends+=("lua>=${_lua_cur}" "lua<${_lua_next}")

    cd "${_pkgbase}"

    install -Dm755 -d "$pkgdir/usr/bin"
    sed 's/@LUA@/lua/'    < "${srcdir}/luatrace.profile" > $pkgdir/usr/bin/luatrace.profile
    chmod 0755 $pkgdir/usr/bin/luatrace.profile

    _package $_lua_cur
}

package_lua54-luatrace-git() {
    pkgdesc="luatrace for Lua 5.4"
    provides=('lua54-luatrace')
    conflicts=('lua54-luatrace')
    depends+=('lua54')

    cd "${_pkgbase}"

    install -Dm755 -d "$pkgdir/usr/bin"
    sed 's/@LUA@/lua5.4/'    < "${srcdir}/luatrace.profile" > $pkgdir/usr/bin/luatrace.profile5.4
    chmod 0755 $pkgdir/usr/bin/luatrace.profile5.4

    _package 5.4
}

package_lua53-luatrace-git() {
    pkgdesc="luatrace for Lua 5.3"
    provides=('lua53-luatrace')
    conflicts=('lua53-luatrace')
    depends+=('lua53')

    cd "${_pkgbase}"

    install -Dm755 -d "$pkgdir/usr/bin"
    sed 's/@LUA@/lua5.3/'    < "${srcdir}/luatrace.profile" > $pkgdir/usr/bin/luatrace.profile5.3
    chmod 0755 $pkgdir/usr/bin/luatrace.profile5.3

    _package 5.3
}


package_lua52-luatrace-git() {
    pkgdesc="luatrace for Lua 5.2"
    provides=('lua52-luatrace')
    conflicts=('lua52-luatrace')
    depends+=('lua52')

    cd "${_pkgbase}"

    install -Dm755 -d "$pkgdir/usr/bin"
    sed 's/@LUA@/lua5.2/'    < "${srcdir}/luatrace.profile" > $pkgdir/usr/bin/luatrace.profile5.2
    chmod 0755 $pkgdir/usr/bin/luatrace.profile5.2

    _package 5.2

}

package_lua51-luatrace-git() {
    pkgdesc="luatrace for Lua 5.1"
    provides=('lua51-luatrace')
    conflicts=('lua51-luatrace')
    depends+=('lua51')

    cd "${_pkgbase}"

    install -Dm755 -d "$pkgdir/usr/bin"
    sed 's/@LUA@/lua5.1/'    < "${srcdir}/luatrace.profile" > $pkgdir/usr/bin/luatrace.profile5.1
    chmod 0755 $pkgdir/usr/bin/luatrace.profile5.1

    _package 5.1

}

sha512sums=(
'SKIP'
'542109a331137031fb23c026c61fed7b0681e17a3603f1675186d0a0fda11219816f434220ec0b57101c6dfa7afe505874ca936b3cab3d18cde00ec0b5bf2f43' # luatrace-compat.patch
'9a4c66f7fa50bea009b323b288c736aa9e48a7773b71127dee25a10bd1f3f2baf54dac328e0ed637d6939475fffad3529612dae4ded62b97cc5f6e8906192b99' # luatrace-updates.patch
'80cba4a69e8a242d13977af58e6e7a859af29ee9b12ea25fe77153be5b64c256bdabec899c1a9b418214f9c31c3d27ac5d2a0c7fbc11a14f2c2fb2db851372d5' # luatrace.profile
)
