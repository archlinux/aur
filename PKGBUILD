# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>
 
pkgname=dtc-git-patched
pkgver=20130410
pkgrel=1
pkgdesc="Device Tree Compiler with Dynamic Symbols and Fixup Support Patch"
url="http://jdl.com/software/"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
makedepends=('git')
 
_gitroot='git://git.kernel.org/pub/scm/utils/dtc/dtc.git'
_gitname='dtc.git'
 
build() {
    msg 'Downloading dynamic symbols fixup patch...'
    wget https://patchwork.kernel.org/patch/1934471/raw/ -O dynamic-symbols.patch
    msg 'Connecting to GIT server...'
 
    if [[ -d ${_gitname} ]]
    then
        cd ${_gitname}
        git reset --hard HEAD
        git pull -f
        git clean -f
    else
        git clone ${_gitroot} ${_gitname}
    fi
 
    msg 'GIT checkout done or server timeout'
}
 
package() {
   cd ${_gitname}
 
   # Revert to version that patch applies to
   git reset --hard f8cb5dd94903a5cfa1609695328b8f1d5557367f
 
   # Apply patch
   git apply ../dynamic-symbols.patch
   #    patch -Np1 -i ../dynamic-symbols.patch
 
    make || return 1
    make INSTALL=$(which install) DESTDIR=${pkgdir} PREFIX=/usr install || return 1
}
