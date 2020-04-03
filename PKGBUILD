# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
pkgname=cpachecker-svn
_pkgname=cpachecker
pkgver=r33105
pkgrel=1
pkgdesc="Tool for configurable software verification."
arch=("x86_64")
url="https://svn.sosy-lab.org/software/cpachecker/trunk"
license=('Apache Version 2.0')
depends=("java-environment=11" "python" "bash")
makedepends=("ant" "subversion")
checkdepends=("ant")
conflicts=("cpachecker")
source=("$_pkgname::svn+https://svn.sosy-lab.org/software/cpachecker/trunk")
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
        cd "$srcdir/$_pkgname"
        ant build
        sed '2 i PATH_TO_CPACHECKER=/opt/cpachecker\nJAVA_HOME=/usr/lib/jvm/java-11-openjdk/jre\nPATH=${JAVA_HOME}/bin:$PATH' scripts/cpa.sh > tmpfile
        mv tmpfile scripts/cpa.sh
}

check() {
        cd "$srcdir/$_pkgname"
        #ant all-checks
}

package() {
        cd "$srcdir/$_pkgname"
        mkdir -p "$pkgdir"/opt/cpachecker
        cp -r "$srcdir/$_pkgname"/. "$pkgdir"/opt/cpachecker/
        mkdir -p "$pkgdir"/usr/bin
        cp "$srcdir/$_pkgname"/scripts/cpa.sh "$pkgdir"/usr/bin/cpachecker
        chmod +xr "$pkgdir"/usr/bin/cpachecker        
        chmod 755 -R "$pkgdir"/opt/cpachecker/
}
