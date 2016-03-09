# Maintainer: Jiehong Ma <email@majiehong.com>

pkgname=ihaskell-git
pkgver=0.8.3
pkgrel=1
pkgdesc="A Haskell kernel for IPython, built in a sandbox."
arch=('i686' 'x86_64')
url="https://github.com/gibiansky/IHaskell"
license=('MIT')
depends=('ipython>=4' 'python-pyzmq' 'jupyter' 'ghc=7.10.3')
makedepends=('git' 'happy' 'gtk2hs-buildtools' 'haskell-stack')
provides=('ihaskell')
conflicts=()
source=("git+https://github.com/gibiansky/IHaskell" "patch")
sha512sums=('SKIP'
            '34b08fb46b428fc871660415a3bc16864f4136aaf15792334d378eb6ebd4e78cb358039723c70767f4fe2369e042c0d9e6ef6a7117e420a00f0da263c7131210')

prepare()
{
  cd "$srcdir/IHaskell"
  patch "stack.yaml" "../../patch"
}

build() {
  cd "$srcdir/IHaskell"
  #git checkout "v${pkgver}.0"
  git checkout 1b6d908
  stack setup
  printf '%s\n' 'If you never used stack before, run `stack init` first.'
  stack install ghc-parser --no-copy-bins
  stack install ipython-kernel --no-copy-bins
  stack install system-argv0 --no-copy-bins
  stack install ihaskell --no-copy-bins
}

package() {
  cd "$srcdir/IHaskell/.stack-work/install/x86_64-linux/lts-5.6/7.10.3/bin"
  mkdir -p "$pkgdir/usr/bin/"
  cp ihaskell "$pkgdir/usr/bin/ihaskell"
  printf '\n%s\n' 'Now, install ihaskell with `ihaskell install`, and enjoy it in `jupyter notebook`!'
  printf '%s\n\n' 'Also make sure to set resolver to `resolver: lts-5.6` in your ~/.stack/global/stack.yaml file.'
  printf '%s\n' 'If you run in any issue, make sure to check that you initialiazed stack with `stack init`' 'But change the resolver as mentionned'
}
