# Maintainer: theflameemperor <un.own.cry@gmail.com>
pkgname=ygopro-koishipro
pkgver=2019.4.15
pkgrel=1
_pkgrel=1
name="$pkgver"
zipFile=KoishiPro-linux-full-${pkgver}.zip
pkgdesc="Link compatable ygopro client with AI"
arch=('x86_64')
url='https://github.com/purerosefallen/ygopro'
license=('GPL2')
depends=('mono' 'libevent')
makedepends=('patchelf')
source=("https://github.com/purerosefallen/ygopro/releases/download/$name/$zipFile")
noextract=($zipFile)
sha256sums=('0ec0b34578e5897c20e704cb390ce6c1d63ea2647163c7522868c069d5e4c001')
options=('!strip' 'emptydirs')

prepare(){
    mkdir -p ../usr/bin
    cp ../koishipro ../usr/bin/
    mkdir -p ../usr/share/applications
    cp ../koishipro.desktop ../usr/share/applications
    unzip -qq -o $zipFile -d $pkgname
    patchelf --remove-needed libevent_pthreads-2.0.so.5 ./$pkgname/ygopro
    patchelf --add-needed libevent_pthreads.so ./$pkgname/ygopro
    patchelf --remove-needed libevent-2.0.so.5 ./$pkgname/ygopro
    patchelf --add-needed libevent.so ./$pkgname/ygopro
    patchelf --set-rpath '$ORIGIN' ./$pkgname/ygopro
}

package(){
    outputDir="$pkgdir/opt/$pkgname"
    mkdir -p $outputDir
    cp -r ../usr $pkgdir
    cp ../YGOPro.png $outputDir/
    cp -dR $pkgname/* $outputDir
	find $outputDir -type d -exec chmod 777 {} \;
	find $outputDir -type f -exec chmod 777 {} \;
    rm $outputDir/deck/*
}
