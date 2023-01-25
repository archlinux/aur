# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

# This is a generic PKGBUILD which lets you build variants of the package for
# all the different Pd flavors out there. Just `makepkg` will build the pd
# (vanilla) package, `makepkg puredata=purr-data` will build a package for
# purr-data, etc. Note that in any case, pd-faustgen2 uses its own copy of the
# Pd source to build the external, but the resulting binary will work with all
# current Pd flavors. The PKGBUILD just makes sure that the external will be
# installed into the right directory for the target Pd version.

# Name of the Pd flavor we're building this package for (pd, pd-l2ork,
# purr-data, etc.). The package name prefix is derived from this (pd for
# vanilla, pdl2ork for pd-l2ork, purrdata for purr-data, etc.).
puredata=${puredata:-pd}
pkgpref=$(echo "$puredata" | sed -e 's/-//g')

# Source and destination package names.
srcname=pd-faustgen
dstname=$pkgpref-faustgen2

pkgname=$dstname-git
pkgver=2.2.0.r0.gabb1c7d
pkgrel=1
pkgdesc="The FAUST compiler embedded in a Pd external - git version"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/agraef/$srcname"
depends=("$puredata" 'llvm-libs')
makedepends=('cmake' 'faust' 'llvm')
provides=("$dstname")
conflicts=("$dstname")
source=("git+https://github.com/agraef/$srcname.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-rc/rc/g;s/-/./g'
}

prepare() {
     cd "$srcname"
     # We don't have to initialize the faust submodules, as we're building
     # against an installed libfaust. This makes checking out the submodules
     # much quicker.
     git submodule update --init pd.build pure-data
}

# Installation goes into /usr/lib/$puredata. Figure out the real name of that
# directory in case it is a link (as is the case with purr-data).
pdlibdir=$(cd /usr/lib/$puredata && pwd -P)

build() {
     cd "$srcname"
     rm -rf build
     mkdir build && cd build
     cmake .. -DCMAKE_INSTALL_PREFIX="$pdlibdir" -DINSTALL_DIR="extra/faustgen2~" -DINSTALLED_FAUST=ON
     make
}

package() {
     cd "$srcname/build"
     make install DESTDIR="$pkgdir"
}
