# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

# This is a generic PKGBUILD which lets you build variants of the package for
# all the different Pd flavors out there. Just `makepkg` will build the pd
# (vanilla) package, `makepkg puredata=purr-data` will build a package for
# purr-data, etc. Note that in any case, pd-faustgen uses its own copy of the
# Pd source to build the external, but the resulting binary will work with all
# current Pd flavors. The PKGBUILD just makes sure that the external will be
# installed into the right directory for the target Pd version.

# Name of the Pd flavor we're building this package for (pd, pd-l2ork,
# purr-data, etc.). The package name prefix is derived from this (pd for
# vanilla, pdl2ork for pd-l2ork, purrdata for purr-data, etc.).
puredata=${puredata:-pd}
pkgpref=$(echo "$puredata" | sed -e 's/-//g')

# Branch to build (master by default)
branch=${branch:-master}
# Current development branch, this doesn't build yet.
#branch=dev/v0.1.2

# Source and destination package names.
src_pkgname=pd-faustgen
dest_pkgname=$pkgpref-faustgen

pkgname=$dest_pkgname-git
pkgver=0.1.1.r2.g569140a
pkgrel=1
pkgdesc="The FAUST compiler embedded in a Pd external - git version"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/CICM/$src_pkgname"
depends=("$puredata" 'llvm-libs')
makedepends=('cmake' 'llvm')
provides=("$dest_pkgname")
conflicts=("$dest_pkgname")
# faust@341bd3c5-patch.diff can be removed once upstream updates the included
# faust submodule to a version that supports LLVM 10.
source=("git+https://github.com/CICM/$src_pkgname.git#branch=$branch"
	"faust@341bd3c5-patch.diff")
md5sums=('SKIP'
         '99f845fe8a258a8185577beae6ff67d9')

pkgver() {
    cd "$src_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
     cd "$src_pkgname"
     git submodule update --init --recursive
     # check for the (old) Faust submodule in pd-faustgen v0.1.1
     if [ $(git -C faust describe) = "2.5.17-403-g341bd3c56" ]; then
	 # patch up the Faust source for LLVM10 support
	 patch -d faust -N -p1 -i "$srcdir/faust@341bd3c5-patch.diff"
     fi
     mkdir build && cd build && cmake ..
}

build() {
     cd "$src_pkgname/build"
     make
}

# Installation goes into /usr/lib/$puredata. Figure out the real name of that
# directory in case it is a link (as is the case with purr-data).
pdlibdir=$(cd /usr/lib/$puredata && pwd -P)

package() {
     cd "$src_pkgname"
     mkdir -p "$pkgdir$pdlibdir/extra/faustgen~/libs"
     cp -a external/* "$pkgdir$pdlibdir/extra/faustgen~"
     cp -a faust/libraries/* "$pkgdir$pdlibdir/extra/faustgen~/libs"
}
