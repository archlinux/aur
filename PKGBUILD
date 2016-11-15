# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gitea
_gourl="code.gitea.io"
pkgname=gitea-git
pkgver=4392.07a0753
pkgrel=1
pkgdesc='A painless self-hosted Git service.'
url='https://gitea.io/'
license=('MIT')
source=('git://github.com/go-gitea/gitea.git#branch=master' 'gitea.service.patch' 'app.ini')
sha256sums=('SKIP'
            'f7b570315bd98a4e2d1c82ebdc2e78d76f6df49286ca4ac59cfb2b3f9985d1f9'
            '3697c023a58737474d0a3dd815988516acca08324147edfb7035c46ba237219b')
arch=('x86_64' 'i686')
depends=('go' 'git')
makedepends=('go' 'git' 'patch')
optdepends=('mariadb' 'postgresql' 'openssh')
install=gitea.install
conflicts=('gitea')
options=('!strip' 'emptydirs')
provides=('gitea')

pkgver() {
  cd "$srcdir/build/src/$_gourl/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p build/go; cd build/go
  for f in "/usr/lib/go/"*; do ln -s "$f"; done
  rm pkg; mkdir pkg; cd pkg
  for f in "/usr/lib/go/pkg/"*; do ln -s "$f"; done
  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"
  mkdir -p "$GOPATH/src/$_gourl"
  mv "$srcdir/$_pkgname/" "$GOPATH/src/$_gourl/"

  # patch
  patch -Np1 -i "$srcdir/gitea.service.patch" "$srcdir/build/src/$_gourl/$_pkgname/scripts/systemd/gitea.service"
}

build() {
  cd "$GOPATH/src/$_gourl/$_pkgname"
  go fix && go build
}

package() {
  install -dm755 $pkgdir/var/lib/$_pkgname/{custom/conf,conf,data/{attachments,avatars,sessions,tmp},repo}
  install -Dm755 "$srcdir/build/src/$_gourl/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/build/src/$_gourl/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/build/src/$_gourl/$_pkgname/scripts/systemd/gitea.service" "$pkgdir/usr/lib/systemd/system/gitea.service"
  install -Dm644 "$srcdir/app.ini" "$pkgdir/var/lib/$_pkgname/custom/conf/app.ini"
  cp -r $srcdir/build/src/$_gourl/$_pkgname/{conf,templates,public} $pkgdir/var/lib/$_pkgname
}

# vim: ft=sh ts=2 sw=2 et
