# Maintainer: Alireza S.N <alireza6677@gmail.com>
pkgname=filegdb-api
_pkgname=FileGDB_API
pkgver=1.5.4
pkgrel=2
pkgdesc="ESRI File Geodatabase (FileGDB) API"
arch=('x86_64')
url="https://github.com/Esri/file-geodatabase-api"
license=('Apache-2.0')
makedepends=('libxml2' 'gcc')
changelog=$pkgname.changelog
source=($pkgname-$pkgver.tar.gz::https://raw.githubusercontent.com/Esri/file-geodatabase-api/master/${_pkgname}_${pkgver}/${_pkgname}-RHEL8-64gcc83.tar.gz)
b2sums=('19e284a710b0ac7b483ddf7cb940d8aef7b5f525f43105796d239868a505cff1704ac26d641e644ccb76e59f0335d504f421b6476de7d0eb101671f05c14e819')

prepare() {
    cd $srcdir
    rm -rf $pkgname/
    mv ${_pkgname}-* $pkgname
}

build() {
    cd $srcdir/$pkgname

    #Build for linux
    export CPPFLAGS+=" -Dlinux"

    #Setup LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$srcdir/${pkgname}/lib:$LD_LIBRARY_PATH
    
    # Modify make.include to use old ABI
    # cd "$srcdir/${pkgname}/include"
    # sed -i '/-D_LARGEFILE64_SOURCE/ s/$/ -D_GLIBCXX_USE_CXX11_ABI=0/' make.include

    # Building all samples
    cd "$srcdir/${pkgname}/samples"
    make

    # Building ProcessTopology
    cd "$srcdir/${pkgname}/samples/ProcessTopologies"

    # Insert libxml2 library path to Makefile
    # sed -i '/^CXXFLAGS=/ s/$/ -I\/usr\/include\/libxml2\//' Makefile
    # make
}

# Uncomment check() portion if you want to perform sample tests
# Warning: Lots of verbose output for tests!
#
# check() {
    # cd "$srcdir/${pkgname}/samples/bin"
    # for i in *
    # do
      # ./${i}
    # done
# }

package() {
    cd $pkgdir

    mkdir -p $pkgdir/usr/{lib,share/{doc,licenses}/$pkgname}
    mkdir -p $pkgdir/usr/include/${pkgname}/

    #rm -r $srcdir/${pkgname}/lib/libstdc++.so*
    rm -r $srcdir/${pkgname}/lib/make.include
    install -Dm755 $srcdir/${pkgname}/lib/* "$pkgdir/usr/lib/"
    install -Dm755 $srcdir/${pkgname}/include/* "$pkgdir/usr/include/$pkgname"

    cp -r $srcdir/${pkgname}/doc/html "$pkgdir/usr/share/doc/$pkgname/"

    find $pkgdir/usr/share/doc/$pkgname/ -type d -exec chmod 755 '{}' \;
    find $pkgdir/usr/share/doc/$pkgname/ -type f -exec chmod 644 '{}' \;

    chown root: $pkgdir/usr/share/doc/$pkgname/*
}
