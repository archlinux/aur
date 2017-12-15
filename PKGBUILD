# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rogof <rogof /at/ gmx /dot/ com>

pkgname=ccl-git
pkgver=4748.1944cfb3
pkgrel=1
pkgdesc="The Clozure Common Lisp implementation"
url="http://ccl.clozure.com/"
license=('APACHE')
arch=('i686' 'x86_64')
depends=('bash')
optdepends=('java-environment: for using emaple file jfli.jar')
makedepends=('git')
provides=('common-lisp' 'cl-asdf' 'ccl')
conflicts=('ccl-bin' 'ccl')
[ "${CARCH}" = 'x86_64' ] && _arch=64
[ "${CARCH}" = 'i686' ] && _arch=32
source=("git+https://github.com/Clozure/ccl.git" http://svn.clozure.com/publicsvn/openmcl/trunk/source/scripts/get-binaries)
sha1sums=('SKIP'
          '3160281c3c8ed63b0019fa00139026d9fdb3259e')

pkgver() {
  cd ccl
  printf %s.%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd ccl
  chmod 700 ../get-binaries
  ../get-binaries linuxx86 
  cd lisp-kernel/linuxx8664
  make
  cd ../..
  echo "(ccl:rebuild-ccl :full t)" | ./lx86cl$_arch --no-init --quiet --batch
}

package() {
  cd ccl
  
  # install data
 install -d "$pkgdir/usr/lib/$pkgname"
  cp -a {compiler,level-*,lib*,lisp-kernel,objc-bridge,tools,xdump,lx86cl$_arch*} \
     "$pkgdir"/usr/lib/$pkgname
  # install examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a examples "$pkgdir/usr/share/$pkgname"
  
  # install documentation
  install -d "$pkgdir/usr/share/doc/$pkgname"
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
