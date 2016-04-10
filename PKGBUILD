# Maintainer: Yann Forget <forget.yann31@gmail.com>
pkgname=espa-surface-reflectance
pkgver=2.5.0
pkgrel=1
pkgdesc="Producing surface reflectance products. LEDAPS for Landsats 4-7 and L8SR for Landsat 8."
arch=('x86_64')
url="https://github.com/USGS-EROS/espa-surface-reflectance"
license=('custom:"Nasa Open Source Agreement"')
depends=('espa-product-formatter')
provides=('espa-surface-reflectance')
conflicts=('espa-surface-reflectance')
source=("https://github.com/USGS-EROS/espa-surface-reflectance/archive/surface_reflectance_mar2016.tar.gz")
md5sums=('SKIP')
install="$pkgname.install"

prepare() {
        cd "$srcdir"
        mv "espa-surface-reflectance-surface_reflectance_mar2016" "$pkgname"
        cd "$pkgname"

        wget https://raw.githubusercontent.com/USGS-EROS/espa-product-formatter/master/ESPA-COMMON-LICENSE.txt
        mv ESPA-COMMON-LICENSE.txt LICENSE

        python_files=$(find -name '*.py')
        for file in $python_files
        do
            sed -i -e 's:/usr/bin/env python:/usr/bin/env python2:g' $file
        done

        sed -i -e \
            's:espa_project_dir = $(prefix)/$(project_name):espa_project_dir = $(prefix)/lib/$(project_name):g' \
            make.config
        
        sed -i -e \
            's: = ../$(project_name): = ../lib/$(project_name):g' \
            make.config
}

build() {
        cd "$srcdir/$pkgname"

        export PREFIX="/usr"

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
        export JBIGINC="/usr/include"
        export JBIGLIB="/usr/lib"
        export ZLIBINC="/usr/include"
        export ZLIBLIB="/usr/lib"
        export ESPAINC="$PREFIX/lib/$pkgname/raw_binary/include"
        export ESPALIB="$PREFIX/lib/$pkgname/raw_binary/lib"

        export NCDF4INC="/usr/include"
        export NCDF4LIB="/usr/lib"
        export HDF5INC="/usr/include"
        export HDF5LIB="/usr/lib"
        export CURLINC="/usr/include"
        export CURLLIB="/usr/lib"
        export IDNINC="/usr/include"
        export IDNLIB="/usr/lib"
        export ZLIBLIB="/usr/lib"
        
        export LEDAPS_AUX_DIR="$PREFIX/../var/lib/espa/$pkgname/static_data/ledaps"
        export L8_AUX_DIR="$PREFIX/../var/lib/espa/$pkgname/static_data/l8_sr"
 
        make
}

package() {
        mkdir -p $pkgdir$LEDAPS_AUX_DIR
        mkdir -p $pkgdir$L8_AUX_DIR
        mkdir -p $pkgdir$PREFIX/lib/$pkgname

        install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

        cd "$srcdir/$pkgname"

        make PREFIX="$pkgdir$PREFIX" install
}
