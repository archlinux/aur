pkgname=selftest-git
_gitname='selftest'

pkgver=v1.0.r9.g54a0022
pkgrel=1
pkgdesc="Tool for testing and educationg people"
arch=('any')
license=('GPLv2')
depends=('python2') 
makedepends=('git')
#conflicts=('selftest')
optdepends=()
provides=('selftest')
url="http://www.fedorahosted.org/selftest"
install=
source=("$_gitname"::'git+https://git.fedorahosted.org/git/selftest.git'
        'application.patch')

md5sums=('SKIP'
         '816ede0c70e8d7daf6d61e9cde11eadc')


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    _dir=$pkgdir/var/$_gitname
    mkdir -p "$_dir" $pkgdir/etc/sysconfig
    install -m 644 $srcdir/$_gitname/selftest-sysconfig $pkgdir/etc/sysconfig/selftest

    patch -p1 $srcdir/$_gitname/application < $srcdir/application.patch
    install -m 755 "$srcdir/$_gitname/application" $_dir/
    install -m 755 $srcdir/$_gitname/*.py $_dir/
    install -m 755 "$srcdir/$_gitname/make-test" $_dir/
    cp -rf $srcdir/$_gitname/res $_dir/
    cp -rf $srcdir/$_gitname/src/* $_dir/
    rm $_dir/config-openshift.py*
    mkdir -p $_dir/tests
    cp -rf $srcdir/$_gitname/tests/* $_dir/tests/
    mkdir -p $_dir/results

    install -m755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m644 "${srcdir}/$_gitname/selftest.service" "${pkgdir}/usr/lib/systemd/system/"
}

