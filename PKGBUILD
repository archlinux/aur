# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rogof <rogof /at/ gmx /dot/ com>

pkgname=ccl-git
epoch=1
pkgver=1.12.dev.3.44.g8fa7fdfc
pkgrel=1
pkgdesc="The Clozure Common Lisp implementation"
url="http://ccl.clozure.com/"
license=('APACHE')
arch=('x86_64')
depends=('bash')
optdepends=('java-environment: for using emaple file jfli.jar')
makedepends=('git' 'subversion')
provides=('common-lisp' 'cl-asdf' 'ccl')
conflicts=('ccl-bin' 'ccl')
_arch=64
source=("git+https://github.com/Clozure/ccl.git" http://svn.clozure.com/publicsvn/openmcl/trunk/source/scripts/get-binaries)
sha1sums=('SKIP'
          '3160281c3c8ed63b0019fa00139026d9fdb3259e')

pkgver() {
  cd ccl
  git describe --tags|tr - .|cut -c2-
  #printf %s.%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  sed -i "s+svn export+svn export --force+" get-binaries
  cd ccl
  chmod 700 ../get-binaries
  ../get-binaries linuxx86 
}

build() {
  cd ccl/lisp-kernel/linuxx8664
  make
  cd ../..
  echo "(ccl:rebuild-ccl :full t)" | ./lx86cl$_arch --no-init --quiet --batch
}

package() {
  cd ccl
  
  # install data
 install -d "$pkgdir"/usr/lib/$pkgname
  cp -a {compiler,level-*,lib*,lisp-kernel,objc-bridge,tools,xdump,lx86cl$_arch*} \
     "$pkgdir"/usr/lib/$pkgname
  # install examples
  install -d "$pkgdir"/usr/share/$pkgname
  cp -a examples "$pkgdir"/usr/share/$pkgname
  
  # install documentation
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cp -a doc/* "$pkgdir"/usr/share/doc/$pkgname
  
  # remove unwanted files
  find "$pkgdir"/usr/ -type d -name .svn -exec rm -rf '{}' +
  find "$pkgdir"/usr/lib/$pkgname -name '*.o' -exec rm -f '{}' +
  find "$pkgdir"/usr/lib/$pkgname -name '*.*fsl' -exec rm -f '{}' +

  # install frontend script
  install -d "$pkgdir"/usr/bin
  cat > "$pkgdir"/usr/bin/ccl <<EOF
#!/bin/sh
exec /usr/lib/$pkgname/lx86cl$_arch "\$@"
EOF
  chmod +x "$pkgdir"/usr/bin/ccl
}
