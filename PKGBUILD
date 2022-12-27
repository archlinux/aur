# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>

pkgname=ihaskell-git
pkgver=2140.14059d9
pkgrel=1
pkgdesc="A Haskell backend kernel for the IPython project"
arch=('x86_64')
url="https://github.com/gibiansky/IHaskell"
license=('MIT')
depends=('ghc-libs' 'haskell-aeson' 'haskell-base64-bytestring' 'haskell-cmdargs' 'haskell-ghc'
         'haskell-ghc-parser' 'haskell-ghc-paths' 'hlint' 'haskell-http-client' 'haskell-http-client-tls'
         'haskell-ipython-kernel' 'haskell-random' 'haskell-shelly' 'haskell-split' 'haskell-strict'
         'haskell-unordered-containers' 'haskell-utf8-string' 'haskell-vector' 'jupyterlab')
makedepends=('git' 'ghc' 'haskell-hunit' 'haskell-here' 'haskell-hspec' 'haskell-hspec-contrib'
             'haskell-raw-strings-qq' 'haskell-setenv' 'ghc-static')
conflicts=('ihaskell')
source=("git+https://github.com/gibiansky/IHaskell")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir"/IHaskell
        echo `git rev-list --count master`.`git rev-parse --short master`
}

build() {
  cd IHaskell

  runhaskell Setup configure --ghc-option='-dynamic' --prefix=/usr --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --enable-tests

  runhaskell Setup build
}

 check() {
   cd IHaskell
   export PATH=$PWD/dist/build/ihaskell:$PATH
   export GHC_PACKAGE_PATH=$PWD/dist/package.conf.inplace/:$GHC_PACKAGE_PATH
   runhaskell Setup test
}

package() {
  cd IHaskell

  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  _ghc_ver=$(ghc -V | sed -e 's/[A-Za-z, ]\+\([0-9.]\+\)$/\1/')
  _kernel_json_content='{"argv":["/usr/bin/ihaskell","kernel","{connection_file}","--ghclib","/usr/lib/ghc-'$_ghc_ver'","+RTS","-M3g","-N2","-RTS"],"display_name":"Haskell","language":"haskell"}'

  msg2 "Generating kernel.json"
  echo $_kernel_json_content > html/kernel.json

  msg2 "Copying labextension and kernel in jupyter share folder"
  for _file in $(ls jupyterlab-ihaskell/labextension/static)
  do
    install -D -m644 jupyterlab-ihaskell/labextension/static/$_file "$pkgdir"/usr/share/jupyter/labextension/jupyterlab-ihaskell/static/$_file
  done

  install -D -m644 jupyterlab-ihaskell/labextension/package.json "$pkgdir"/usr/share/jupyter/labextension/jupyterlab-ihaskell/package.json

  for _file in $(ls html)
  do
    install -D -m644 html/$_file "$pkgdir"/usr/share/jupyter/kernels/haskell/$_file
  done

}
