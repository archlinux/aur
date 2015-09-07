# Maintainer: Salamandar <felix@piedallu.me>
pkgname=ar-sdk3-git
pkgver=ARSDK3_version_3_5.r135.gd4abf11
pkgrel=1
pkgdesc="The Parrot's AR SDK for Linux !"
arch=('any')
license=('GPL')
groups=('games')
depends=()
makedepends=('git'
             'yasm'
             'jdk8-openjdk'
             'python-virtualenv'
             'gcc-libs'
             'uthash')
install=

_gitname=ARSDKBuildUtils

url="https://github.com/Parrot-Developers/$_gitname.git"
source=("git+$url")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/$_gitname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {

    # Use Python2 instead of Python
    virtualenv python2 --python=python2
    source python2/bin/activate

    # This is needed because of the FORTIFY_SOURCE=2 of makepkg.
    unset CPPFLAGS

    cd "$_gitname"

    # CheckEnv.py

    if [ `./CheckEnv.py 2>/dev/null | grep Unix | awk '{print $3}' ` == "OK" ]
        then
        echo "Okay !"
    else
        echo "Error ! Restarting CheckEnv for info…"
        ./CheckEnv.py
        #return 1
    fi

    # Download the sources
    ./SDK3Build.py -t Unix --none

    # Replace json/json.h with json-c/json.h
    sed -i 's#json/json.h#json-c/json.h#g' `find .. -name "*.c" -o -name "*.h"`
    sed -i 's#uthash/uthash.h#uthash.h#g' `find .. -name "*.c" -o -name "*.h"`

    # Build the sources
    ./SDK3Build.py -t Unix --nogit

    # Use Python2 instead of Python
    deactivate
}

check() {
    echo "check"
    # cd "$srcdir/$pkgname"
    # make -k check
}

package() {
    cd "$srcdir/$_gitname/Targets/Unix/Install"

    mkdir -p                "$pkgdir/usr/include"
    cp -R include/libAR*    "$pkgdir/usr/include"

    mkdir -p                "$pkgdir/usr/lib"
    cp -R     lib/libar*    "$pkgdir/usr/lib"

    cd "$srcdir/"

    mkdir -p                "$pkgdir/usr/share/doc/ar-sdk3"
    cp -R Docs/*            "$pkgdir/usr/share/doc/ar-sdk3"

    mkdir -p                "$pkgdir/usr/share/ar-sdk3"
    cp -R Samples/          "$pkgdir/usr/share/ar-sdk3"

}
