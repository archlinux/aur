# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=dingoo-sdk
pkgver=20130707
pkgrel=2
pkgdesc="Dingoo A320 Native SDK"
arch=('i686' 'x86_64')
url="http://code.google.com/p/dingoo-sdk/"
license=('GPL')
depends=('bash' 'sed' 'python')
makedepends=('make')
options=(!strip)
install=dingoo-sdk.install
source=(http://dingoo-sdk.googlecode.com/files/dingoo_sdk_r324.zip
        http://dingoo-sdk.googlecode.com/files/linux_x86_elf2app.tar.bz2
        http://dingoo-sdk.googlecode.com/files/mipsel-4.1.2-nopic.tar.bz2
        dingoo-sdk.sh)

#_gitroot="http://dingoo-sdk.googlecode.com/svn/trunk/ dingoo-sdk-read-only"
#_gitname=dingoo-sdk

build() {
	cd "$srcdir"
#    if [ -d "$_gitname" ]; then
#        msg "GIT tree found."
#        cd "$_gitname"
#        git pull
#    else
#        git clone $_gitroot
#        cd "$_gitname"
#    fi
#	qmake
#	make
    cd dingoo_sdk
    export DINGOO_SDK=$srcdir/dingoo_sdk
    export MIPSTOOLS=$srcdir/mipsel-4.1.2-nopic
    export PATH=$PATH:$MIPSTOOLS/bin
    sh ./install
    # Removing unnecessary object files
    find $DINGOO_SDK -iname '*.o' -and -not -name 'dingoo.o'|xargs rm -f
}

package() {
	cd $srcdir
   
    install -d -m755 $pkgdir/usr/bin
    install -m755 dingoo-sdk.sh $pkgdir/usr/bin/dingoo-sdk.sh

    install -d -m755 $pkgdir/usr/share/$pkgname
    cp -a dingoo_sdk $pkgdir/usr/share/$pkgname 
    cp -a mipsel-4.1.2-nopic $pkgdir/usr/share/$pkgname 
    cp -a tools $pkgdir/usr/share/$pkgname 
}

md5sums=('0ed152a9d947897b4e346e554b90fe39'
         '6d617c4b6fbee77eeb84284f451d58ca'
         'd980b89d5604a422f4a80d3c86b9a5fd'
         'e84d16d30743c6b0b6ff76c060b681f6')

