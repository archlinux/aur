# Maintainer:  jyantis <yantis@yantis.net>

# R package isn't compiling anymore so temp removed.

pkgbase=xgboost-git
pkgname=('xgboost-git'
         'python-xgboost-git'
         'python2-xgboost-git'
         )
         # 'r-xgboost-git'
pkgver=r1639.00a8076
pkgrel=2
url='https://github.com/tqchen/xgboost'
license=('APACHE')
source=('git+https://github.com/tqchen/xgboost.git')
sha256sums=('SKIP')
makedepends=('git')
arch=('x86_64')
pkgver() {
  cd xgboost
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_xgboost-git() {
  pkgdesc='An optimized general purpose gradient boosting library. Which is parallelized using OpenMP. It implements machine learning algorithm under gradient boosting framework, including generalized linear model and gradient boosted regression tree'
  provides=('xgboost')
  conflicts=('xgboost')
  depends=('python' 'bash')
  optdepends=('python-xgboost-git: Python 3 Wrapper'
              'python2-xgboost-git: Python 2 Wrapper')
              # 'r-xgboost-git: R Wrapper'

  cd xgboost
  make

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install main executable
  install -Dm755 "xgboost" "$pkgdir/usr/bin/xgboost"

  # Install shared libraries
  mkdir -p $pkgdir/usr/lib/
  install -Dm644 wrapper/*.so "${pkgdir}/usr/lib/"

  mkdir -p $pkgdir/opt/xgboost

  # Copy the python wrapper to opt/xgboost
  cp -r wrapper $pkgdir/opt/xgboost

  # Copy the demos to opt/xgboost
  cp -r demo $pkgdir/opt/xgboost
}

# package_r-xgboost-git() {
#   msg "You will need to have these R packages installed to use this"
#   msg "Type this in R:"
#   msg "install.packages(\"data.table\", repos=\"http://cran.rstudio.com/\")"
#   msg "install.packages(\"magrittr\", repos=\"http://cran.rstudio.com/\")"
#   msg "install.packages(\"DiagrammeR\", repos=\"http://cran.rstudio.com/\")"
#   msg "install.packages(\"vcd\", repos=\"http://cran.rstudio.com/\")"

#   pkgdesc="XGBoost R wrapper"
#   depends=('xgboost' 'r')
#   conflicts=('r-xgboost')
#   provides=('r-xgboost')
#   makedepends=('xgboost')

#   cd xgboost

#   # Hotpatch Error: T used instead of TRUE
#   for file in $(find . -name '*.R' -print); do
#     sed -i 's/ = T)/ = TRUE)/' $file
#   done

#   for file in $(find . -name '*.Rd' -print); do
#     sed -i 's/ = T)/ = TRUE)/' $file
#   done

#   make clean
#   rm -rf xgboost xgboost*.tar.gz
#   cp -r R-package xgboost
#   rm -rf xgboost/inst/examples/*.buffer
#   rm -rf xgboost/inst/examples/*.model
#   rm -rf xgboost/inst/examples/dump*
#   rm -rf xgboost/src/*.o xgboost/src/*.so xgboost/src/*.dll
#   rm -rf xgboost/demo/*.model xgboost/demo/*.buffer xgboost/demo/*.txt
#   rm -rf xgboost/demo/runall.R
#   cp -r src xgboost/src/src
#   mkdir xgboost/src/wrapper
#   cp  wrapper/xgboost_wrapper.h xgboost/src/wrapper
#   cp  wrapper/xgboost_wrapper.cpp xgboost/src/wrapper
#   cp ./LICENSE xgboost
#   cat R-package/src/Makevars|sed '2s/.*/PKGROOT=./' > xgboost/src/Makevars
#   cat R-package/src/Makevars.win|sed '2s/.*/PKGROOT=./' > xgboost/src/Makevars.win
#   R CMD build xgboost
#   rm -rf xgboost
#   R CMD INSTALL --as-cran xgboost*.tar.gz
# }

package_python2-xgboost-git() {
  pkgdesc="XGBoost Python 2 wrapper"
  depends=('xgboost'
           'python2'
           'python2-numpy'
           'python2-scipy'
           'python2-setuptools'
           'bash')
  conflicts=('python2-xgboost')
  provides=('python2-xgboost')
  makedepends=('xgboost')

  cd xgboost

  msg "Patching any #!/usr/bin/python to #!/usr/bin/python2"
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  msg "Patching it so it can find the shared library"
  for file in $(find . -name '*.py' -print); do
    sed -i 's/os.path.dirname(__file__)/"\/usr\/lib" /' $file
  done

  msg "Patching out the sys path usage since we don't use it anymore"
  for file in $(find . -name '*.py' -print); do
    sed -i 's/sys.path.append/# sys.path.append/' $file
  done

  msg "Patching in our module"
  for file in $(find . -name '*.py' -print); do
    sed -i 's/import xgboost/from xgboost import xgboost/' $file
  done

  msg "Since no setup.py lets set it up by hand"
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; \
    print get_python_lib()"`
  mkdir -p "${pkgdir}/${pydir}"
  mkdir -p "${pkgdir}/${pydir}/xgboost"
  touch "${pkgdir}/${pydir}/xgboost/__init__.py"

  cp wrapper/xgboost.py "${pkgdir}/${pydir}/xgboost"
  cp -R demo "${pkgdir}/${pydir}/xgboost"
}

package_python-xgboost-git() {
  pkgdesc="XGBoost Python 3 wrapper"
  depends=('xgboost'
           'python'
           'python-numpy'
           'python-scipy'
           'python-setuptools'
           'bash')
  conflicts=('python-xgboost')
  provides=('python-xgboost')
  makedepends=('xgboost')

  cd xgboost

  msg "Patching it so it can find the shared library"
  for file in $(find . -name '*.py' -print); do
    sed -i 's/os.path.dirname(__file__)/"\/usr\/lib" /' $file
  done

  msg "Patching out the sys path usage since we don't use it anymore"
  for file in $(find . -name '*.py' -print); do
    sed -i 's/sys.path.append/# sys.path.append/' $file
  done

  msg "Patching in our module"
  for file in $(find . -name '*.py' -print); do
    sed -i 's/import xgboost/from xgboost import xgboost/' $file
  done

  msg "Since no setup.py lets set it up by hand"
  pydir=`python -c "from distutils.sysconfig import get_python_lib; \
    print(get_python_lib())"`
  mkdir -p "${pkgdir}/${pydir}"
  mkdir -p "${pkgdir}/${pydir}/xgboost"
  touch "${pkgdir}/${pydir}/xgboost/__init__.py"

  cp wrapper/xgboost.py "${pkgdir}/${pydir}/xgboost"
  cp -R demo "${pkgdir}/${pydir}/xgboost"
}

# vim:set ts=2 sw=2 et:
