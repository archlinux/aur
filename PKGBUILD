# Maintainer: François Garillot <francois[@]garillot.net>

pkgname=nfusr-git
pkgver=r2.4a83ede
pkgrel=3
pkgdesc="nfusr is a userspace FUSE client for accessing NFSv3 servers based on libnfs."
license=('BSD')
url='https://github.com/facebookincubator/nfusr'
arch=('i686' 'x86_64')
provides=('nfusr')
conflicts=('nfusr')
depends=('libnfs')
makedepends=('git')

_gitroot="git://github.com/facebookincubator/nfusr.git"
_gitname="nfusr"

pkgver() {
  cd $srcdir/$pkgname-build/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd $srcdir/$pkgname-build
        ./bootstrap
}

prepare() {
        cd $srcdir
        msg "Connecting to the GIT server...."
        if [[ -d $srcdir/$_gitname ]] ; then
                cd $_gitname
                git checkout master
                git pull origin
                msg "The local files are updated."
        else
                git clone $_gitroot $_gitname
        fi

        rm -rf $srcdir/$pkgname-build
        git clone $srcdir/$_gitname $srcdir/$pkgname-build
	 cd $srcdir/$pkgname-build
	 patch -Np1 -i "${srcdir}/../functional.patch"
}

package() {
        cd $srcdir/$pkgname-build/
        ./configure
        make
        make DESTDIR="$pkgdir" install
	cd $pkgdir
	mv sbin usr/bin
}
