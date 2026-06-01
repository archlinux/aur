# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=symfpu
pkgver=1.2.0
pkgrel=1
pkgdesc="Concrete or symbolic implementation of IEEE-754 / SMT-LIB floating-point"
arch=('x86_64')
url="https://github.com/martin-cs/symfpu"
license=('GPL-3.0-or-later OR BSD-3-Clause')
source=(
    "https://github.com/martin-cs/symfpu/archive/refs/tags/symfpu-${pkgver}-dual-license.tar.gz"
    "0000-fix-include-paths.patch"
)
conflicts=(symfpu-cvc5)
b2sums=('8055d09b54f900607b31a5181cfe1185712571019d6a6d7aa866485a81b7d17ffbf0767483df25c7045fa0edb73b98bb7d35fa0d6e5b59901beb97dd4d12010a'
        '8f7b37aa97174fee0b2202c6ca14e18108d8ec9601e7a68449b48f83c07dac915c454e09acd5040b5e971ed816aef2de05723420ed0d5cd80d73cef501948d5c')

prepare()
{
    cd $srcdir/symfpu-symfpu-1.2.0-dual-license
    patch -Np1 -i ../0000-fix-include-paths.patch
}

build()
{
    cd $srcdir/symfpu-symfpu-1.2.0-dual-license

    # Rather use a subshell than $PWD which could be set to anything
    make SUBDIRS=baseTypes subdirs symfpu.a CXXFLAGS="-I$(pwd)"
}

package()
{
    cd $srcdir/symfpu-symfpu-1.2.0-dual-license
    find core utils -name \*.h \
	 -exec  install -Dm644 {} $pkgdir/usr/include/$pkgname/{} \;

    install -Dm644 symfpu.a -t $pkgdir/usr/lib
    install -Dm644 LICENSE-BSD -t $pkgdir/usr/share/licenses/$pkgname
}
