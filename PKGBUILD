# Maintainer: SaultDon <sault.don gmail>
pkgname=filegdb-api
_pkgname=FileGDB_API
pkgver=1.5.1
pkgrel=4
pkgdesc="ESRI File Geodatabase (FileGDB) API"
arch=('i686' 'x86_64')
url="https://github.com/Esri/file-geodatabase-api"
license=('APACHE')
makedepends=('libxml2' 'gcc')
changelog=$pkgname.changelog
case $CARCH in
i686)
  source=($pkgname-$pkgver.tar.gz::https://raw.githubusercontent.com/Esri/file-geodatabase-api/master/${_pkgname}_${pkgver}/${_pkgname}_${pkgver//./_}-32gcc51.tar.gz)
  md5sums=('145f760871892b822b5f26442e2e8255')
  ;; 
x86_64)
  source=($pkgname-$pkgver.tar.gz::https://raw.githubusercontent.com/Esri/file-geodatabase-api/master/${_pkgname}_${pkgver}/${_pkgname}_${pkgver//./_}-64gcc51.tar.gz)
  md5sums=('10a18003adaa6ccf0c4d8e6bb8da1e4f')
  ;; 
esac

prepare() {
    cd $srcdir
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

    install -Dm644 $srcdir/${pkgname}/lib/* "$pkgdir/usr/lib/"
    rm $pkgdir/usr/lib/libstdc++.so*
    install -Dm644 $srcdir/${pkgname}/include/* "$pkgdir/usr/include/$pkgname"

    cp -r $srcdir/${pkgname}/doc/html "$pkgdir/usr/share/doc/$pkgname/"

    find $pkgdir/usr/share/doc/$pkgname/ -type d -exec chmod 755 '{}' \;
    find $pkgdir/usr/share/doc/$pkgname/ -type f -exec chmod 644 '{}' \;

    chown root: $pkgdir/usr/share/doc/$pkgname/*
}
