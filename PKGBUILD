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

# Branch to build (master by default).
branch=${branch:-master}

# Source and destination package names.
src_pkgname=pd-faustgen
dest_pkgname=$pkgpref-faustgen

pkgname=$dest_pkgname-git
pkgver=0.1.2.r0.g9e2aaea
pkgrel=1
pkgdesc="The FAUST compiler embedded in a Pd external - git version"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/CICM/$src_pkgname"
depends=("$puredata" 'llvm-libs')
makedepends=('cmake' 'llvm')
provides=("$dest_pkgname")
conflicts=("$dest_pkgname")
source=("git+https://github.com/CICM/$src_pkgname.git#branch=$branch")
md5sums=('SKIP')

pkgver() {
    cd "$src_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
     cd "$src_pkgname"
     git submodule update --init --recursive
}

build() {
     cd "$src_pkgname"
     mkdir build && cd build
     cmake ..
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
