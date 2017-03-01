# Maintainer: François Garillot <francois[@]garillot.net>

pkgname=zinc-git
pkgver=0.3.13
pkgrel=1
pkgdesc="Zinc is a stand-alone version of sbt's incremental compiler."
license=('Apache')
url='https://github.com/typesafehub/zinc'
arch=('i686' 'x86_64')
provides=('zinc')
conflicts=('zinc')
depends=('sbt')
makedepends=('git')
options=(!libtool)

_gitroot="git://github.com/typesafehub/zinc.git"
_gitname="zinc"

build() {
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
        git checkout v$pkgver
        sbt universal:packageZipTarball
}

package() {
        cd $srcdir/$pkgname-build/target/universal
        tar -xvf ${pkgname%-git}-$pkgver.tgz
        cd ${pkgname%-git}-$pkgver
        install -dm755 "$pkgdir/usr/bin"
        install -dm755 "$pkgdir/usr/bin/ng"
        if [[ "$(uname -m)" = "x86_64" ]] ; then
          install -dm755 "$pkgdir/usr/bin/ng/linux64"
          install -Dm755 "bin/ng/linux64/ng" "$pkgdir/usr/bin/ng/linux64/"
        else
          install -dm755 "$pkgdir/usr/bin/ng/linux32"
          install -Dm755 "bin/ng/linux32/ng" "$pkgdir/usr/bin/ng/linux32/"
        fi
        install -dm644 "$pkgdir/usr/lib"
        for i in lib/*; do
          install -m 0644 $i "$pkgdir/usr/lib"
        done
        install -Dm755 "bin/zinc" "bin/nailgun" "$pkgdir/usr/bin"
        rm -rf $srcdir/$pkgname-build
}
