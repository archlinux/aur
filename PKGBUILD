# Maintainer: Yann Forget <forget.yann31@gmail.com>
pkgname="espa-cloud-masking"
pkgver=2.0.0
pkgrel=1
pkgdesc="Produces Cloud Mask products for Landsat data based on the CFMASK algorithm."
arch=('x86_64')
url="https://github.com/USGS-EROS/espa-cloud-masking"
license=('custom:"Nasa Open Source Agreement"')
depends=('espa-product-formatter')
provides=('espa-cloud-masking')
conflicts=('espa-cloud-masking')
source=("https://github.com/USGS-EROS/espa-cloud-masking/archive/cloud-masking-2016_Mar.tar.gz")
md5sums=('SKIP')

prepare() {
        cd "$srcdir"
        mv "espa-cloud-masking-cloud-masking-2016_Mar" "$pkgname"
        cd "$pkgname"

        mv cfmask/CFMASK-LICENSE.txt LICENSE

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

        cd static_data
        sed -i -e \
            's:static_install_path = $(espa_project_dir)/static_data:static_install_path = $(prefix)/../var/lib/espa/$(project_name)/static_data:g' \
            Makefile


}


build() {
        cd "$srcdir/$pkgname"

        install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

        export PREFIX="/usr"

        export XML2INC="/usr/include/libxml2"
        export XML2LIB="/usr/lib"

        export ZLIBINC="/usr/include"
        export ZLIBLIB="/usr/lib"
        export LZMALIB="/usr/lib"
        export ESPAINC="$PREFIX/lib/$pkgname/raw_binary/include"
        export ESPALIB="$PREFIX/lib/$pkgname/raw_binary/lib"
 
        export ESUN="/var/lib/espa/$pkgname/static_data"

        cd "$srcdir/$pkgname"
        make
}

package() {
    mkdir -p "$pkgdir$PREFIX/lib/$pkgname"
    mkdir -p "$pkgdir/var/lib/espa/$pkgname/static_data"

    cd "$srcdir/$pkgname"
    make PREFIX="$pkgdir$PREFIX" install
    make PREFIX="$pkgdir$PREFIX" clean
}
