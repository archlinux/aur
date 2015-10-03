# Maintainer: Jiehong Ma <email@majiehong.com>

pkgname=ihaskell-git
pkgver=0.7.1
pkgrel=2
pkgdesc="A Haskell kernel for IPython, built in a sandbox."
arch=('i686' 'x86_64')
url="https://github.com/gibiansky/IHaskell"
license=('MIT')
depends=('ipython>=4' 'python-pyzmq' 'jupyter' 'ghc=7.10.1')
makedepends=('git' 'happy' 'gtk2hs-buildtools' 'haskell-stack')
provides=('ihaskell')
conflicts=()
source=("git+https://github.com/gibiansky/IHaskell" 'stack.yaml.patch')
sha512sums=('SKIP'
            'cb9a18e7d1798e223a6278d84bd41fc23647c43bfac52036bb360739f97901830e60c6de9bce632f2faa8ae4045a9f98bff2af25af78da5eff0a2f2f81706552')

prepare()
{
  cd "$srcdir/IHaskell"
  patch stack.yaml ../../stack.yaml.patch
}

build() {
  cd "$srcdir/IHaskell"
  stack setup
  printf '%s\n' 'If you never used stack before, run `stack init` first.'
  stack install ghc-parser --no-copy-bins
  stack install ipython-kernel --no-copy-bins
  stack install system-argv0 --no-copy-bins
  stack install ihaskell --no-copy-bins
}

package() {
  cd "$srcdir/IHaskell/.stack-work/install/x86_64-linux/nightly-2015-08-03/7.10.1/bin"
  mkdir -p "$pkgdir/usr/bin/"
  cp ihaskell "$pkgdir/usr/bin/ihaskell"
  printf '\n%s\n' 'Now, install ihaskell with `ihaskell install`, and enjoy it in ipython notebook or console!'
  printf '%s\n\n' 'Also make sure to set resolver to `resolver: nightly-2015-08-03` in your ~/.stack/global/stack.yaml file.'
  printf '%s\n' 'If you run in any issue, make sure to check that you initialiazed stack with `stack init`' 'But change the resolver as mentionned'
}
