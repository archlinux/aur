# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luatrace-git' 'lua51-luatrace-git' 'lua52-luatrace-git' 'lua53-luatrace-git')
_pkgbase='luatrace'
pkgver=r143.d9d8918
pkgrel=3
arch=('x86_64' 'i686')
url='https://github.com/geoffleyland/luatrace'
license=('MIT')
makedepends=('git' 'lua' 'lua51' 'lua52' 'lua53')
source=('git+https://github.com/geoffleyland/luatrace.git'
"${_pkgbase}-compat.patch"
"${_pkgbase}-updates.patch"
'luatrace.profile')

md5sums=('SKIP'
'aa58cc5542f67dac04f842f8145dea22'
'9f619a644c5b669d9d0af7b337cc69f8'
'f826cbac6c3ec8d6465f5b6ddcd5712d')

pkgver() {
	cd "$srcdir/${_pkgbase}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgbase}"
    patch --forward --strip=1 --input="${srcdir}/${_pkgbase}-compat.patch"
    patch --forward --strip=1 --input="${srcdir}/${_pkgbase}-updates.patch"
}

build() {
    cd "${_pkgbase}"

    gcc -fPIC $CPPFLAGS $CFLAGS -o c/c_hook.o -c c/c_hook.c
    gcc -shared $LDFLAGS -o c_hook.so c/c_hook.o

    gcc -fPIC $CPPFLAGS $CFLAGS -I/usr/include/lua5.1 -o c/c_hook.o -c c/c_hook.c
    gcc -shared $LDFLAGS -o c_hook-5.1.so c/c_hook.o

    gcc -fPIC $CPPFLAGS $CFLAGS -I/usr/include/lua5.2 -o c/c_hook.o -c c/c_hook.c
    gcc -shared $LDFLAGS -o c_hook-5.2.so c/c_hook.o

    gcc -fPIC $CPPFLAGS $CFLAGS -I/usr/include/lua5.3 -o c/c_hook.o -c c/c_hook.c
    gcc -shared $LDFLAGS -o c_hook-5.3.so c/c_hook.o

    sed 's/@LUA@/lua/'    < "${srcdir}/luatrace.profile" > luatrace.profile
    sed 's/@LUA@/lua5.1/' < "${srcdir}/luatrace.profile" > luatrace.profile5.1
    sed 's/@LUA@/lua5.2/' < "${srcdir}/luatrace.profile" > luatrace.profile5.2
    sed 's/@LUA@/lua5.3/' < "${srcdir}/luatrace.profile" > luatrace.profile5.3
}

package_lua-luatrace-git() {
    pkgdesc="luatrace for Lua 5.4"
    provides=('lua-luatrace')
    conflicts=('lua-luatrace')
    depends+=('lua')

    cd "${_pkgbase}"

    install -D c_hook.so "$pkgdir/usr/lib/lua/5.4/luatrace/c_hook.so"

    install -d "$pkgdir/usr/share/lua/5.4/luatrace"
    install -d "$pkgdir/usr/share/lua/5.4/uatrace"
    install -d "$pkgdir/usr/share/lua/5.4/jit"

    install -Dm644 lua/luatrace.lua "$pkgdir/usr/share/lua/5.4/"
    install -Dm644 lua/luatrace/*.lua "$pkgdir/usr/share/lua/5.4/luatrace/"
    install -Dm644 lua/uatrace.lua "$pkgdir/usr/share/lua/5.4/"
    install -Dm644 lua/uatrace/*.lua "$pkgdir/usr/share/lua/5.4/uatrace/"
    install -Dm644 lua/jit/*.lua "$pkgdir/usr/share/lua/5.4/jit/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 luatrace.profile "$pkgdir/usr/bin/luatrace.profile"
}

package_lua51-luatrace-git() {
    pkgdesc="luatrace for Lua 5.1"
    provides=('lua51-luatrace')
    conflicts=('lua51-luatrace')
    depends+=('lua51')

    cd "${_pkgbase}"

    install -D c_hook-5.1.so "$pkgdir/usr/lib/lua/5.1/luatrace/c_hook.so"

    install -d "$pkgdir/usr/share/lua/5.1/luatrace"
    install -d "$pkgdir/usr/share/lua/5.1/uatrace"
    install -d "$pkgdir/usr/share/lua/5.1/jit"

    install -Dm644 lua/luatrace.lua "$pkgdir/usr/share/lua/5.1/"
    install -Dm644 lua/luatrace/*.lua "$pkgdir/usr/share/lua/5.1/luatrace/"
    install -Dm644 lua/uatrace.lua "$pkgdir/usr/share/lua/5.1/"
    install -Dm644 lua/uatrace/*.lua "$pkgdir/usr/share/lua/5.1/uatrace/"
    install -Dm644 lua/jit/*.lua "$pkgdir/usr/share/lua/5.1/jit/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 luatrace.profile5.1 "$pkgdir/usr/bin/luatrace.profile5.1"
}

package_lua52-luatrace-git() {
    pkgdesc="luatrace for Lua 5.2"
    provides=('lua52-luatrace')
    conflicts=('lua52-luatrace')
    depends+=('lua52')

    cd "${_pkgbase}"

    install -D c_hook-5.2.so "$pkgdir/usr/lib/lua/5.2/luatrace/c_hook.so"

    install -d "$pkgdir/usr/share/lua/5.2/luatrace"
    install -d "$pkgdir/usr/share/lua/5.2/uatrace"
    install -d "$pkgdir/usr/share/lua/5.2/jit"

    install -Dm644 lua/luatrace.lua "$pkgdir/usr/share/lua/5.2/"
    install -Dm644 lua/luatrace/*.lua "$pkgdir/usr/share/lua/5.2/luatrace/"
    install -Dm644 lua/uatrace.lua "$pkgdir/usr/share/lua/5.2/"
    install -Dm644 lua/uatrace/*.lua "$pkgdir/usr/share/lua/5.2/uatrace/"
    install -Dm644 lua/jit/*.lua "$pkgdir/usr/share/lua/5.2/jit/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 luatrace.profile5.2 "$pkgdir/usr/bin/luatrace.profile5.2"
}

package_lua53-luatrace-git() {
    pkgdesc="luatrace for Lua 5.3"
    provides=('lua53-luatrace')
    conflicts=('lua53-luatrace')
    depends+=('lua53')

    cd "${_pkgbase}"

    install -D c_hook-5.3.so "$pkgdir/usr/lib/lua/5.3/luatrace/c_hook.so"

    install -d "$pkgdir/usr/share/lua/5.3/luatrace"
    install -d "$pkgdir/usr/share/lua/5.3/uatrace"
    install -d "$pkgdir/usr/share/lua/5.3/jit"

    install -Dm644 lua/luatrace.lua "$pkgdir/usr/share/lua/5.3/"
    install -Dm644 lua/luatrace/*.lua "$pkgdir/usr/share/lua/5.3/luatrace/"
    install -Dm644 lua/uatrace.lua "$pkgdir/usr/share/lua/5.3/"
    install -Dm644 lua/uatrace/*.lua "$pkgdir/usr/share/lua/5.3/uatrace/"
    install -Dm644 lua/jit/*.lua "$pkgdir/usr/share/lua/5.3/jit/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 luatrace.profile5.3 "$pkgdir/usr/bin/luatrace.profile5.3"
}
