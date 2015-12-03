# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libgraphqlparser
pkgver=0.3.0
pkgrel=1
pkgdesc="A GraphQL query parser in C++ with C and C++ APIs"
arch=('i386' 'x86_64')
url="https://github.com/graphql/libgraphqlparser"
license=('BSD')
depends=('python2-ctypesgen')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/graphql/${pkgname}/archive/v${pkgver}.tar.gz")
options=(!makeflags)    # parallel build fails
md5sums=(5e3c1a8f561494475cecdabe1aaf1426)
sha256sums=(fa3d28fa6154077d8b3795e8d21f2946c16acf549e29c457ddc5c18427639f9c)
sha384sums=(57844fbfd263007a51a00a4d7eef390172dfdea665aae125bfbdecf6f94f4fd4eb31f611350d99ee426ed9780492c1ce)
sha512sums=(a3ee1b1ca2bfb06b31f6117b746b06e463050a55add843aabe24d9bc445ff8cf3e5b2070fb0bb280415e5da7af497274d1dc68d50ae35904267fce791d9accb7)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed 's/COMMAND python/COMMAND python2/g' -i CMakeLists.txt
  sed 's/AstNode.h/AstNode.h Ast.h AstVisitor.h/g' -i CMakeLists.txt
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DPYTHON_EXECUTABLE=/usr/bin/python2 -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include/graphqlparser/${pkgname}-${pkgver}/ast"
  rm -rf "${pkgdir}/usr/include/graphqlparser/${pkgname}-${pkgver}/CMakeFiles"
  rm -rf "${pkgdir}/usr/include/graphqlparser/${pkgname}-${pkgver}/go"
  rm -rf "${pkgdir}/usr/include/graphqlparser/${pkgname}-${pkgver}/python"
  rm -rf "${pkgdir}/usr/include/graphqlparser/${pkgname}-${pkgver}/test"

  install -dm755 "${pkgdir}/usr/lib/python2.7/site-packages/GraphQLParser"
  install -Dm644 python/GraphQLParser.py "${pkgdir}/usr/lib/python2.7/site-packages/GraphQLParser/GraphQLParser.py"
  echo "from GraphQLParser import *" > "${pkgdir}/usr/lib/python2.7/site-packages/GraphQLParser/__init__.py"
}
