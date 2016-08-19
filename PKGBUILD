# Maintainer: Jiehong Ma <email@majiehong.com>

pkgname=ihaskell-git
pkgver=0.8.4
pkgrel=1
pkgdesc="A Haskell kernel for Jupyter, built in a sandbox."
arch=('i686' 'x86_64')
url="https://github.com/gibiansky/IHaskell"
license=('MIT')
depends=('python-pyzmq' 'jupyter' 'haskell-stack' 'ghc7.10-bin')
makedepends=('git' 'happy' 'haskell-gtk2hs-buildtools')
provides=('ihaskell')
conflicts=()
source=("git+https://github.com/gibiansky/IHaskell" "patch")
sha512sums=('SKIP'
            '6340595cafddcdcec315d086523d9c35539653fb8079ea56ddf75c15e3103fe81cccf3f98665d37dee9d3d46459985d10ff93ad5b66eb89a3ffb6265b5efec2f')

prepare()
{
  cd "$srcdir/IHaskell"
  git checkout 73791d3
  patch "stack.yaml" "../../patch"
}

build() {
  export STACK_ROOT="$HOME/.stack/"
  cd "$srcdir/IHaskell"
  stack setup
  printf '%s\n' 'If you never used stack before, run `stack init` first.'
  stack install ghc-parser --no-copy-bins
  stack install ipython-kernel --no-copy-bins
  stack install system-argv0 --no-copy-bins
  stack install ihaskell --no-copy-bins
  stack build
  stack build
}

package() {
  printf '\n%s\n' 'Now, install ihaskell with `ihaskell install`, and enjoy it in `jupyter notebook`!'
  printf '%s\n\n' 'Also make sure to set resolver to `resolver: lts-6.2` in your ~/.stack/global/stack.yaml file.'
  printf '%s\n' 'If you run in any issue, make sure to check that you initialiazed stack with `stack init`' 'But change the resolver as mentionned'
}
