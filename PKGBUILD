# Maintainer: Sergey Shatunov <me@prok.pw>
_pkgname=pgweb
_github_prefix=github.com/sosedoff

pkgname=pgweb-git
pkgver=v0.9.5.r10.g1e88d3d
pkgrel=2
pkgdesc="Web client (GUI) for PostgreSQL databases"
arch=('any')
url="https://$_github_prefix/$_pkgname"
license=('MIT')
makedepends=('git' 'go')
backup=('etc/conf.d/pgweb')
install=pgweb.install
source=("git+https://$_github_prefix/$_pkgname.git"
        'pgweb.install'
        'pgweb.env'
        'pgweb.service')
md5sums=('SKIP'
         'd45bd1fdcac2311fffa9534b430a3ee8'
         '3a89d3f7502a2695ffc3598bd6e7d8b0'
         '1362f2c1ba241a56b4c2c98bdfa2eca7')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"
  export PATH="$GOPATH/bin:$PATH"
  
  mkdir -p "$GOPATH/src/$_github_prefix"
  ln -sf "$srcdir/$_pkgname" "$GOPATH/src/$_github_prefix/$_pkgname"
  
  cd "$GOPATH/src/$_github_prefix/$_pkgname"
  make setup
  make build
}

package() {
  cd "$pkgdir"
  
  install -d usr/{bin,lib/systemd/system} etc/conf.d

  install $srcdir/$_pkgname/$_pkgname usr/bin/$_pkgname
  install -m064 $srcdir/$_pkgname.env etc/conf.d/$_pkgname
  install -m064 $srcdir/$_pkgname.service usr/lib/systemd/system/$_pkgname.service
}
