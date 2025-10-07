pkgname=python-typed-ast
pkgver=1.5.5
pkgrel=3
pkgdesc="a fork of Python 2 and 3 ast modules with type comment support"
arch=('x86_64')
url="https://github.com/python/typed_ast"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/python/typed_ast/archive/${pkgver}.tar.gz"
pycompat.h
)
sha256sums=('2e635e70f60b0a69c3e332e4bbbf1afc9140f64418025917df4dd97fc49bbba8'
            '0f51e059adffdabbdcc52ad2f94ecad4552be0ce5c3605d00258951def7bce64')

prepare(){
  cd "typed_ast-$pkgver"
  #sed -i 's/typedef enum {false, true} bool;/#include <stdbool.h>/' ast27/Include/asdl.h
  awk 'NR==1{print "typedef struct _PyFutureFeatures PyFutureFeatures;"} {print}' ast27/Include/compile.h > /tmp/compile.h.new && mv /tmp/compile.h.new ast27/Include/compile.h
  cp ../pycompat.h ast3/Include/.
  sed -i '/#include "Python.h"/a #include "pycompat.h"' ast3/Python/Python-ast.c
  sed -i '/#include "Python.h"/a #include "pycompat.h"' ast3/Python/ast.c
}

build(){
  cd "typed_ast-$pkgver"
  CFLAGS="-std=gnu11" python setup.py build
}

package(){
  cd "typed_ast-$pkgver"
  python setup.py install --prefix="usr/" --root="$pkgdir/" --optimize=1 --skip-build
}
