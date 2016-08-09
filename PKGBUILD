# Maintainer: SaultDon <sault.don gmail>
pkgname=filegdb-api
_pkgname=FileGDB_API
pkgver=1.4
pkgrel=2
pkgdesc="ESRI File Geodatabase (FileGDB) API"
arch=('i686' 'x86_64')
url="http://www.esri.com/apps/products/download/#File_Geodatabase_API_1.3"
license=('custom:"ESRI - User Restrictions"')
makedepends=('libxml2' 'gcc>=3.4.6')
optdepends=('gdal-filegdb: wrapper')
changelog=$pkgname.changelog
case $CARCH in
i686)
  source=($pkgname-$pkgver.tar.gz::http://downloads2.esri.com/Software/${_pkgname}_${pkgver//./_}-32.tar.gz)
  md5sums=('e6eae3f612b7001ae3b1313d9797f3ef')
  ;; 
x86_64)
  source=($pkgname-$pkgver.tar.gz::http://downloads2.esri.com/Software/${_pkgname}_${pkgver//./_}-64.tar.gz)
  md5sums=('40c3e48e080947c1b6890063fa9f64c5')
  ;; 
esac

prepare() {
    cd $srcdir
    mv FileGDB_API-* $pkgname
}

build() {
    cd $srcdir/$pkgname

    #Build for linux
    export CPPFLAGS+=" -Dlinux"

	#Setup LD_LIBRARY_PATH
	export LD_LIBRARY_PATH=$srcdir/${pkgname}/lib:$LD_LIBRARY_PATH
    
    #Modify make.include to use old ABI
    cd "$srcdir/${pkgname}/include"
    sed -i '/-D_LARGEFILE64_SOURCE/ s/$/ -D_GLIBCXX_USE_CXX11_ABI=0/' make.include

    #Building all samples
	cd "$srcdir/${pkgname}/samples"
	make

	# Building ProcessTopology
	cd "$srcdir/${pkgname}/samples/ProcessTopologies"

	# Insert libxml2 library path to Makefile
	#sed -i '/^CXXFLAGS=/ s/$/ -I\/usr\/include\/libxml2\//' Makefile
	#make
}

# Uncomment check() portion if you want to perform sample tests
# Warning: Lots of verbose output for tests!
#
#check() {
#	cd "$srcdir/${_pkgname}/samples/bin"
#	for i in *
#	do
#	  ./${i}
#	done
#}

package() {
    cd $pkgdir

	mkdir -p $pkgdir/usr/{lib,share/{doc,licenses}/$pkgname}
	mkdir -p $pkgdir/usr/include

    install -Dm644 $srcdir/${pkgname}/license/* "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 $srcdir/${pkgname}/lib/* "$pkgdir/usr/lib/"
	install -Dm644 $srcdir/${pkgname}/include/* "$pkgdir/usr/include/"

	cp -r $srcdir/${pkgname}/doc/html "$pkgdir/usr/share/doc/$pkgname/"

	find $pkgdir/usr/share/doc/$pkgname/ -type d -exec chmod 755 '{}' \;
	find $pkgdir/usr/share/doc/$pkgname/ -type f -exec chmod 644 '{}' \;

	chown root: $pkgdir/usr/share/doc/$pkgname/*
}
