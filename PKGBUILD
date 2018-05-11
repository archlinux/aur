# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: yinflying <yinflying@foxmail.com>
_proname=RTKLIB
pkgname=rtklib-git
pkgver=2.4.3b29
pkgrel=3
pkgdesc="An Open Source Program Package for GNSS Positioning"
arch=('x86_64')
url="http://www.rtklib.com/"
license=('GPL')
groups=('GNSS')
depends=('glibc')
makedepends=('git' 'gcc-fortran') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${_proname}::git+https://github.com/tomojitakasu/RTKLIB.git#branch=rtklib_2.4.3")
noextract=()
md5sums=('SKIP')

#prepare() {
    #cd "$srcdir/${_proname}/app"
    ##sed -i "s/\/usr\/local\/bin/\/usr\/bin/g" makefile
#}

build() {
    cd "$srcdir/${_proname}/lib/iers/gcc"
    make
    cd "$srcdir/${_proname}/app"
    make
}

package() {
    # install bin file
    install -Dm755 "$srcdir/${_proname}/app/pos2kml/gcc/pos2kml" "$pkgdir/usr/bin/pos2kml"
    install -Dm755 "$srcdir/${_proname}/app/str2str/gcc/str2str" "$pkgdir/usr/bin/str2str"
    install -Dm755 "$srcdir/${_proname}/app/rnx2rtkp/gcc/rnx2rtkp" "$pkgdir/usr/bin/rnx2rtkp"
    install -Dm755 "$srcdir/${_proname}/app/rtkrcv/gcc/rtkrcv" "$pkgdir/usr/bin/rtkrcv"
    install -Dm755 "$srcdir/${_proname}/app/convbin/gcc/convbin" "$pkgdir/usr/bin/convbin"
    # copy share file
    mkdir -p "$pkgdir/usr/share/${pkgname}/data/"
    for f in $srcdir/${_proname}/data/*;do
        install -m644 "$f" "$pkgdir/usr/share/${pkgname}/data/"
    done
    mkdir -p "$pkgdir/usr/share/${pkgname}/rnx2rtkp/"
    for f in $srcdir/${_proname}/app/rnx2rtkp/gcc/*.conf;do
        install -m644 "$f" "$pkgdir/usr/share/${pkgname}/rnx2rtkp/"
    done
}
