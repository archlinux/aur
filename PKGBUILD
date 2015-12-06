# Maintainer: Ricardo Catalinas Jiménez <r@untroubled.be>

pkgname=('ktap-git' 'ktap-utils-git' 'vim-ktap-git')
pkgrel=1
pkgver=v0.4.r130.gfca420f
pkgdesc='KTAP kernel module, userpace tool and Vim plugin'
arch=('i686' 'x86_64')
url='https://github.com/ktap/ktap'
license=('GPL')
makedepends=('git')
md5sums=('SKIP')
_gitname='ktap'
source="$_gitname::git+https://github.com/ktap/ktap.git"

pkgver() {
    cd $_gitname
    # Use the last tag, revision and commit
    git describe --long --tags | sed 's/-/.r/; s/-/./g'
}

build() {
    cd $_gitname
    make
}

package_ktap-git() {
    depends=('linux')
    install='ktap-git.install'
    cd $_gitname
    install -d $pkgdir/usr/lib/modules/$(uname -r)/kernel/misc/
    install -m 644 -o root -g root -p ktapvm.ko $pkgdir/usr/lib/modules/$(uname -r)/kernel/misc/
}

package_ktap-utils-git() {
    depends=("ktap-git=$pkgver")
    cd $_gitname
    install -d $pkgdir/usr/bin/
    install -d $pkgdir/usr/share/doc/ktap/
    install -m 755 -o root -g root -p ktap $pkgdir/usr/bin/
    install -m 644 -o root -g root -p doc/* $pkgdir/usr/share/doc/ktap/
    cp -r --no-preserve=mode,ownership samples/ $pkgdir/usr/share/doc/ktap/
}

package_vim-ktap-git() {
    depends=('vim')
    cd $_gitname
    install -d $pkgdir/usr/share/vim/vimfiles/{ftdetect,syntax}/
    install -m 644 -o root -g root -p vim/ftdetect/ktap.vim $pkgdir/usr/share/vim/vimfiles/ftdetect/
    install -m 644 -o root -g root -p vim/syntax/ktap.vim $pkgdir/usr/share/vim/vimfiles/syntax/
}
