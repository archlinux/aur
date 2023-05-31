# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>

pkgname=alire-git
pkgver=v1.2.0.r125.g9cac98b
pkgrel=2
pkgdesc="Ada Alire (alr): A library manager for the Ada Programming Language (git top of tree version)."
arch=('i686' 'x86_64')
url="https://alire.ada.dev/"
license=(GPL3)
depends=(gnatcoll-core unzip)
makedepends=(git gprbuild python python-pip)
provides=("alire")
conflicts=("alire")
source=("${pkgname}::git+https://github.com/alire-project/alire.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 --exclude=nightly | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$pkgname"
  ALIRE_OS=linux gprbuild -j0 -p -P alr_env -gnatws -cargs
}

check() {
  cd "$srcdir/$pkgname/testsuite"
  python -m venv alrtest_venv
  source alrtest_venv/bin/activate
  pip install --upgrade -r requirements.txt
  PATH="$srcdir/$pkgname/bin:$PATH" GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null ./run.py
}

package() {
  cd "$srcdir/$pkgname"
  ALIRE_OS=linux gprinstall -P alr_env -p --prefix="$pkgdir/usr"
  install -D scripts/alr-completion.bash "$pkgdir/usr/share/bash-completion/completions/alr"
}

# vim:set ts=2 sw=2 et:
