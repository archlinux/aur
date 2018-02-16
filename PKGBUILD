# Maintainer: dctxmei <dctxmei@gmail.com>
pkgname=hmcl-git
_pkgname=HMCL
pkgver=2.0
pkgrel=1
pkgdesc="A powered Minecraft launcher that supports a lot of features."
arch=("any")
url="https://github.com/huanghongxun/HMCL/tree/master"
license=("GPL3")
makedepends=("aria2" "git")
provides=("hmcl")
conflicts=("hmcl")
source=("git://github.com/huanghongxun/$_pkgname.git#branch=master"
        "hmcl")
sha512sums=("SKIP"
        "4f83cd5629ef331f5d172fef3591964ac55da86c529cc7d87be8df63e25a29107773f7a389f83218bd9bd400963d01f9e1495898d9391c7a77042b475ee627cf")

pkgver() {
    git -C $_pkgname describe | sed -e 's/^v//' -e 's/-/./g'
}

build() {
    if [ $(uname -m) = x86_64 ]; then
        arch=x64
    else
        arch=i586
    fi
    rm -rf jdk*
    aria2c https://soft.dct.party/aur/hmcl/jdk-8-linux-$arch.tar.xz &&
        tar -Jxvf jdk-8-linux-$arch.tar.xz
    export JAVA_HOME=$srcdir/jdk1.8.0
    cd $srcdir/$_pkgname
    bash gradlew build
}

package() {
    jpath=$(echo $srcdir/$_pkgname/$_pkgname/build/libs/HMCL-*sources.jar | sed 's/-sources//')
    install -Dm644 $jpath $pkgdir/usr/share/hmcl/hmcl.jar
    mv $JAVA_HOME/jre $pkgdir/usr/share/hmcl/jre
    install -Dm755 $srcdir/hmcl $pkgdir/usr/bin/hmcl
}
