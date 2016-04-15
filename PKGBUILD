# $Id: PKGBUILD 134107 2015-05-25 23:45:31Z dwallace $
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Richard Murri <admin@richardmurri.com>
_pkgname=jython
pkgname=$_pkgname-hg
pkgver=r7918+.87534ec6252a+
pkgrel=1
pkgdesc="An implementation of the Python language written in Java"
arch=('any')
url="http://www.jython.org/"
license=('PSF' 'APACHE' 'custom')
# Jython requires jdk7 for correct building
# TODO: Find a way to accept both jdk7 and jdk7-openjdk
depends=('jdk7-openjdk' 'bash' 'python2')
makedepends=('apache-ant')
backup=('opt/jython/registry')
options=('!emptydirs')
install='jython.install'
source=("hg+https://hg.python.org/jython/"
        'README.ArchLinux'
        'jython.sh'
        'issue2481.patch')
provides=('jython')
conflicts=('jython')

md5sums=('SKIP'
         '0a2e265af61c7d695e13b605dc180553'
         'c08ade059dae86b015f39842ceb465cf'
         'a9f1dc09c8fdb2f1b3a0a2b9793a44df')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch -i ../issue2481.patch -Np1
}

build() {
    cd "$srcdir/$_pkgname"

    JAVA_HOME="/usr/lib/jvm/java-7-openjdk" ant
}

package() {
    install -m755 -D -d "$pkgdir/opt/"

    cp -r "$srcdir/$_pkgname/dist" "$pkgdir/opt/$_pkgname"
    rm "$pkgdir/opt/jython/bin/"{jython.exe,jython_regrtest.bat,python27.dll}

    install -m644 -D "$srcdir/jython.sh" "$pkgdir/etc/profile.d/jython.sh"
    install -m644 -D "$srcdir/README.ArchLinux" "$pkgdir/usr/share/doc/$_pkgname/README.ArchLinux"

    install -m644 -D "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt"
}
