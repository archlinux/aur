# Contributor: MCMic <come@chilliet.eu>

pkgname=purity
pkgver=20071027
pkgrel=6
pkgdesc="An abstract first-person shooter built on the Quake3 engine."
arch=('i686' 'x86_64')
url="http://vectorpoem.com/purity/"
license=('GPL')
depends=()
makedepends=('make' 'mercurial')
optdepends=('zenity: allow using purity-zen to choose graphically the map')
source=('http://vectorpoem.com/purity/latest_content/core.pk3'
        'http://vectorpoem.com/purity/latest_content/map0.pk3'
        'http://vectorpoem.com/purity/latest_content/vm.pk3'
        'purity-zen'
        'hg+https://bitbucket.org/JPLeBreton/purity')
noextract=( 'core.pk3'
            'map0.pk3'
            'vm.pk3')
md5sums=('4f5b6af36a738a54570f21fb24177edd'
         'b7f5730e443ea5c066d7ef67bce09892'
         '8396c0dfe49c31ff866800837bf80d9d'
         '8361d4586bf2c0dd1a31edddf8b70d89'
         'SKIP')

pgkver() {
    cd $srcdir/$pkgname

    # As per the wiki the version is r<commit number>.<commit hash>
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd $srcdir/$pkgname
    make
    
    msg "Cleaning and adapting scripts"
    build_folder=`ls ${srcdir}/$pkgname/build`
    bin_name=`ls ${srcdir}/$pkgname/build/$build_folder | grep "purity\."`
    bin_serv=`ls ${srcdir}/$pkgname/build/$build_folder | grep "purity-ded"`
    bin_path=/opt/$pkgname/build/$build_folder/$bin_name
    serv_path=/opt/$pkgname/build/$build_folder/$bin_serv
    _bin=`echo $bin_path | sed "s|\/|\\\/|g"`
    _serv=`echo $serv_path | sed "s|\/|\\\/|g"`
    rm *.exe
    for i in `ls *.bat | cut -d'.' -f1`
        do sed -i "s|@start purity.x86|$_bin|" $i.bat
        sed -i "s|@start purity-ded.x86|$_serv|" $i.bat
        mv $i.bat $i.sh
        chmod +x $i.sh
    done

    sed -i "s|purity_cmd|$_bin|" ${srcdir}/purity-zen
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/$pkgname/purity.sh ${pkgdir}/usr/bin/
    cp ${srcdir}/purity-zen ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/opt/$pkgname/build/$build_folder/base
    cp -r ${srcdir}/$pkgname ${pkgdir}/opt/
    cp ${srcdir}/*.pk3 ${pkgdir}/opt/$pkgname/build/$build_folder/base/
}
