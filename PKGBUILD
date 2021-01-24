# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>
# Contributor: tfl5034
pkgname=gprbuild-bootstrap-git
pkgver=r3723.815226d6
pkgrel=1
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself"
arch=('i686' 'x86_64')
url='https://github.com/AdaCore/gprbuild/'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'gcc-ada')
provides=('gprbuild-bootstrap')
conflicts=('gprbuild' 'gprbuild-bootstrap')
source=('git+https://github.com/AdaCore/gprbuild.git'
        'git+https://github.com/AdaCore/gprconfig_kb.git'
        'git+https://github.com/AdaCore/xmlada.git')
sha1sums=(SKIP SKIP SKIP)


pkgver() {
    cd "$srcdir/gprbuild"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/gprbuild"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr

    cd "$srcdir/gprconfig_kb"
    sed -i 's/libexec/lib/g' db/{compilers,gnat,linker}.xml
}

build() {
    cd "$srcdir/gprbuild"

    export GNATMAKEFLAGS="-j$(nproc)"
    export DESTDIR="$srcdir/bootstrap"
    ./bootstrap.sh \
        --prefix=/usr \
        --libexecdir=/lib \
        --with-xmlada="$srcdir/xmlada" \
        --with-kb="$srcdir/gprconfig_kb"
}

package() {
    cd "$srcdir/bootstrap"
    cp -a --no-preserve=ownership -- "$srcdir/bootstrap/usr" "$pkgdir"
}
