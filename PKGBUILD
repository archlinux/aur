# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>

_pkgname="lua-language-server"
pkgname="$_pkgname-git"
pkgver=r1746.f4b2975
pkgrel=1
license=('MIT')
pkgdesc='Lua Language Server coded by Lua'
url='https://github.com/sumneko/lua-language-server'
arch=('x86_64')
depends=('lua')
makedepends=('ninja' 'git')
install="$_pkgname.install"
source=(git+https://github.com/sumneko/$_pkgname
        0001-Use-a-writable-log-dir-in-tmp.patch)
md5sums=('SKIP'
         'a83632ed00578977a6b50269f2d3b60a')

pkgver () {
 cd $srcdir/$_pkgname
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
 cd $srcdir/$_pkgname
 git submodule update --init --recursive
 git apply $srcdir/0001-Use-a-writable-log-dir-in-tmp.patch
}

build () {
 cd $srcdir/$_pkgname
 cd 3rd/luamake
 ninja -f ninja/linux.ninja
 cd ../..
 ./3rd/luamake/luamake rebuild
}

package () {
 cd $srcdir/$_pkgname
 install -d $pkgdir/usr/share
 install -d $pkgdir/usr/bin
 cp -a server $pkgdir/usr/share/$_pkgname
 echo -e "#!/bin/sh\ncd /usr/share/$_pkgname\n./bin/$_pkgname main.lua" > $pkgdir/usr/bin/$_pkgname
 chmod 755 $pkgdir/usr/bin/$_pkgname
}
