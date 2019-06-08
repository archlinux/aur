# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=ccpnmr
pkgver=2.4.2
pkgrel=1
pkgdesc="An interactive NMR spectrum visualisation, resonance assignment and analysis program"
arch=("x86_64")
url="https://www.ccpn.ac.uk"
license=('LGPL2.1' 'custom')
depends=('tcsh' 'python2' 'freeglut' 'glu' 'tk')
makedepends=('sed' 'gcc')
optdepends=('python2-numpy: extends Analysis functionality'
            'tix: used in ARIA')
source=("http://www.ccpn.ac.uk/download/$pkgname/analysis$pkgver.tar.gz")
sha256sums=('14941131033cbd4b0b13d6d4fe3f9253360a7c2ace8ece9194be00c1fe4b2903')

prepare() {
    export CCPNMR_TOP_DIR=$srcdir/$pkgname
    cd $srcdir/$pkgname/${pkgname}${pkgver:0:3}/c
    cp environment_default.txt environment.txt
    sed -i 's/2.5/2.7/' environment.txt
    sed -i 's/8.5/8.6/' environment.txt
    sed -i 's#-I$(GL_DIR)/include#-I$(GL_DIR)/include/GL#' environment.txt
    mkdir $srcdir/$pkgname/bin
}

build() {
    cd $srcdir/$pkgname/${pkgname}${pkgver:0:3}/c
    make -j1
}

package() {
    cd $srcdir/$pkgname/${pkgname}${pkgver:0:3}
    install -dm755 $pkgdir/usr/{bin,lib,share/licenses/$pkgname}
    install -dm755 $pkgdir/usr/lib/python2.7/site-packages/$pkgname
    install -dm755 $pkgdir/usr/lib/python2.7/site-packages/$pkgname-$pkgver-py2.7.egg-info
    cp -r doc data license model python $pkgdir/usr/lib/python2.7/site-packages/$pkgname
    install -m755 license/CCPN.license $pkgdir/usr/share/licenses/$pkgname
    
    cd c
    find . -type d -exec mkdir -p $pkgdir/usr/lib/{} \;
    find . -name "*.so" -exec install -m755 {} $pkgdir/usr/lib/{} \;
    find $pkgdir/usr/lib/python2.7/site-packages/$pkgname/python -name "linkSharedObjs" -exec sed -i "/rm/d" {} \;
    find $pkgdir/usr/lib/python2.7/site-packages/$pkgname/python -name "linkSharedObjs" -exec sed -i "s#../../../c#../../../../../..#g" {} \;
    cd $pkgdir/usr/lib/python2.7/site-packages/$pkgname/python/memops/c
    source linkSharedObjs; rm *Shared*; cd ../..
    cd ccp/c; source linkSharedObjs; rm *Shared*; cd ../..
    cd ccpnmr/c; source linkSharedObjs; rm *Shared*
    
    cd $pkgdir/usr/lib/python2.7/site-packages/$pkgname-$pkgver-py2.7.egg-info
    touch dependency_links.txt PKG-INFO SOURCES.txt
    echo "$pkgname" > top_level.txt
    
    cat <<EOF > $pkgdir/usr/bin/analysis
#!/bin/bash
export PYTHONPATH=/usr/lib/python2.7/site-packages/ccpnmr/python
python2 -i -O /usr/lib/python2.7/site-packages/ccpnmr/python/ccpnmr/analysis/AnalysisGui.py $*
EOF

    cat <<EOF > $pkgdir/usr/bin/formatConverter
#!/bin/bash
export PYTHONPATH=/usr/lib/python2.7/site-packages/ccpnmr/python
python2 -i -O /usr/lib/python2.7/site-packages/ccpnmr/python/ccpnmr/format/gui/FormatConverter.py $*
EOF

    cat <<EOF > $pkgdir/usr/bin/pipe2azara
#!/bin/bash
export PYTHONPATH=/usr/lib/python2.7/site-packages/ccpnmr/python
python2 -i -O /usr/lib/python2.7/site-packages/ccpnmr/python/ccpnmr/analysis/NmrPipeData.py $*
EOF

    cd $pkgdir/usr/bin
    chmod 755 analysis formatConverter pipe2azara
}
