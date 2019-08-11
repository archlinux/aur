# Maintainer: theflameemperor <un.own.cry@gmail.com>
pkgname=ygopro-koishipro
pkgver=2019.8.7
pkgrel=1
_pkgrel=1
name="Charin"
zipFile="KoishiPro-linux-full-$name.zip"
pkgdesc="Link compatable ygopro client with AI"
arch=('x86_64')
url='https://github.com/purerosefallen/ygopro'
license=('GPL2')
depends=('mono' 'libevent')
makedepends=('patchelf' 'unzip')
source=("$url/releases/download/$name/$zipFile")
noextract=($zipFile)
sha256sums=('622fb41491b8c380d5620ae486de06efcbe7a9a125517429a3923541389a4768')
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
    # uncomment to get rid of the default decks if wanted
    #rm $outputDir/deck/*
}
