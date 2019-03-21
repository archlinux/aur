# Maintainer: theflameemperor <un.own.cry@gmail.com>
pkgname=ygopro-koishipro
pkgver=2019.3.15
pkgrel=1
_pkgrel=1
zipFile=KoishiPro-linux-full-${pkgver}.zip
pkgdesc="Link compatable ygopro client with AI"
arch=('x86_64')
url='https://github.com/purerosefallen/ygopro'
license=('GPL2')
depends=('mono' 'libevent')
makedepends=('patchelf')
source=("https://github.com/purerosefallen/ygopro/releases/download/$pkgver/$zipFile")
noextract=($zipFile)
sha256sums=('2ae0eccd26f24e3333e31e2baf1f901f07b0c309da6f096bc07a27f7b70f508b')
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
}

package(){
    outputDir="$pkgdir/opt/$pkgname"
    mkdir -p $outputDir
    echo $outputDir
    cp -r ../usr $pkgdir
    cp ../YGOPro.png $outputDir/
    cp -dR $pkgname/* $outputDir
	find $outputDir -type d -exec chmod 777 {} \;
	find $outputDir -type f -exec chmod 777 {} \;
    rm $outputDir/deck/*
}
