# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rogof <rogof /at/ gmx /dot/ com>

pkgname=ccl-svn
pkgver=1.12.dev.r16617
pkgrel=1
pkgdesc="The Clozure Common Lisp implementation"
url="http://ccl.clozure.com/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('bash')
optdepends=('java-environment: for using emaple file jfli.jar')
makedepends=('svn')
provides=('common-lisp' 'cl-asdf' 'ccl')
conflicts=('ccl-bin')
source=("svn+http://svn.clozure.com/publicsvn/openmcl/trunk/linuxx86/ccl")
sha1sums=('SKIP')

_arch=''
[ "${CARCH}" = 'x86_64' ] && _arch=64

pkgver() {
  cd $srcdir/ccl
  # get version from version.lisp file & the svn revision
  local ver_prog="(format t \"~a.~a_r~a\" ccl::*openmcl-major-version* ccl::*openmcl-minor-version* $(svnversion))"
  # use head to remove trailing NIL
  echo -n $ver_prog | ./lx86cl$_arch -n -Q -b -l level-1/version.lisp | awk '/Version/ {print $2}'|sed 's+-+.+g'|sed 's+M++'
}

build() {
  cd $srcdir/ccl
  echo '(ccl:rebuild-ccl :full t)' | ./lx86cl$_arch -n -Q -b
}

package() {
  cd $srcdir/ccl
  
  # install data
  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -a {compiler,contrib,level-*,lib*,lisp-kernel,objc-bridge,tools,x86-headers$_arch,xdump,lx86cl$_arch*} \
     "$pkgdir/usr/lib/$pkgname"
  
  # install examples
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -a examples "$pkgdir/usr/share/$pkgname"
  
  # install documentation
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp -a doc/* "$pkgdir/usr/share/doc/$pkgname"
  
  # remove unwanted files
  find "$pkgdir/usr/" -type d -name .svn -exec rm -rf '{}' +
  find "$pkgdir/usr/lib/$pkgname" -name '*.o' -exec rm -f '{}' +
  find "$pkgdir/usr/lib/$pkgname" -name '*.*fsl' -exec rm -f '{}' +

  # install frontend script
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/ccl" <<EOF
#!/bin/sh
exec /usr/lib/$pkgname/lx86cl$_arch "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/ccl"
}
