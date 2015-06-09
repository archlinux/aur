# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=jsx-git
pkgver=20130216
pkgrel=2
pkgdesc="A faster, safer, easier JavaScript"
arch=('i686' 'x86_64')
url="http://jsx.github.com/"
license=('MIT')
depends=('perl>=5.8.8' 'nodejs>=0.8.0')
makedepends=('git' 'perl>=5.8.8' 'nodejs>=0.8.0')
optdepends=('perl-json-xs')
source=('jsx.sh')
install=jsx-git.install
md5sums=('c799303999d6b8368c3d6bf4b1705fc9')

_gitroot="https://github.com/jsx/JSX.git"
_gitname="JSX"
_pkgname=${pkgname/%-git/}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin && git submodule update --init --recursive
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  env --unset=JSX_HOME make
  sed --in-place -e "s!$PWD!/opt/jsx!g" bin/jsx-compiler.js
}

check() {
  cd "$srcdir/$_gitname-build"
  make test
}

package() {
  _pkgname=${pkgname/%-git/}
  install -d "$pkgdir"/{opt/$_pkgname,usr/bin}
  cd "$srcdir"/$_gitname-build
  git archive --format tar --prefix=opt/$_pkgname/ HEAD|(cd $pkgdir && tar xf -)
  install -m755 -d "$pkgdir"/opt/$_pkgname/bin
  install -m755 "$srcdir"/$_gitname-build/bin/* "$pkgdir"/opt/$_pkgname/bin/
  (cd $pkgdir/usr/bin && ln -sf ../../opt/$_pkgname/bin/jsx jsx)
  install -m644 -DT "$srcdir"/$_gitname-build/README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -m755 -DT "$srcdir"/jsx.sh "$pkgdir"/etc/profile.d/jsx.sh
}
