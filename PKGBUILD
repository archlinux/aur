# Maintainer: Yann Forget <forget.yann31@gmail.com>
pkgname=espa-product-formatter
pkgver=1.6.0
pkgrel=1
pkgdesc="libraries and tools for working with the ESPA internal file format"
arch=('x86_64')
url="https://github.com/USGS-EROS/espa-product-formatter"
license=('custom:"Nasa Open Source Agreement"')
depends=('libxml2' 'jbigkit' 'netcdf' 'hdf-eos2' 'hdf-eos5')
provides=('espa-product-formatter')
conflicts=('espa-product-formatter')
source=("https://github.com/USGS-EROS/espa-product-formatter/archive/product_formatter_v1.6.0.tar.gz")
md5sums=('SKIP')
install="$pkgname.install"

prepare() {
        cd "$srcdir"
        mv "espa-product-formatter-product_formatter_v$pkgver" "$pkgname"
        cd "$pkgname"

        mv ESPA-COMMON-LICENSE.txt LICENSE

        python_files=$(find -name '*.py')
        for file in $python_files
        do
            sed -i -e 's:/usr/bin/env python:/usr/bin/env python2:g' $file
        done

        sed -i -e \
            's:python_link_path = $(PREFIX)/python:python_link_path = $(PREFIX)/bin:g' \
            make.config

        sed -i -e \
            's:schema_link_path = $(PREFIX)/schema:schema_link_path = $(PREFIX)/lib/espa-product-formatter/schema:g' \
            make.config

        sed -i -e \
            's:espa_project_dir = $(prefix)/$(project_name):espa_project_dir = $(prefix)/lib/$(project_name):g' \
            make.config

        sed -i -e \
            's: = ../$(project_name): = ../lib/$(project_name):g' \
            make.config
}


build() {
        cd "$srcdir/$pkgname"

        export HDFEOS_GCTPINC="/usr/include"
        export HDFEOS_GCTPLIB="/usr/lib"
        export TIFFINC="/usr/include"
        export TIFFLIB="/usr/lib"
        export GEOTIFF_INC="/usr/include"
        export GEOTIFF_LIB="/usr/lib"
        export HDFINC="/usr/include"
        export HDFLIB="/usr/lib"
        export HDFEOS_INC="/usr/include"
        export HDFEOS_LIB="/usr/lib"
        export JPEGINC="/usr/include"
        export JPEGLIB="/usr/lib"
        export XML2INC="/usr/include/libxml2"
        export XML2LIB="/usr/lib"
        export PREFIX="/usr"
        export JBIGINC="/usr/include"
        export JBIGLIB="/usr/lib"
        export ZLIBINC="/usr/include"
        export ZLIBLIB="/usr/lib"
        export ESPAINC="$PREFIX/lib/$pkgname/raw_binary/include"
        export ESPALIB="$PREFIX/lib/$pkgname/raw_binary/lib"
        export ESPA_STATIC_DATA_DIR="/var/lib/espa"
        export ESPA_LAND_MASS_POLYGON="$ESPA_STATIC_DATA_DIR/$pkgname/static_data/land_no_buf.ply"
 
        cd "$srcdir/$pkgname/raw_binary"
        make

        cd ../
        make
}

package() {
        mkdir -p "$pkgdir$ESPA_STATIC_DATA_DIR/$pkgname/static_data"
        mkdir -p "$pkgdir$PREFIX/lib/$pkgname"

        cd "$srcdir/$pkgname"
        install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

        cd raw_binary
        make PREFIX="$pkgdir$PREFIX" install
        make PREFIX="$pkgdir$PREFIX" clean

        cd ../
        make PREFIX="$pkgdir$PREFIX" install
        make PREFIX="$pkgdir$PREFIX" clean
}
