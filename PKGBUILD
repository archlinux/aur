# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=sgopherd-git
pkgver=20121007
pkgrel=1
pkgdesc="A gopher server written in Bash"
arch=('any')
url="https://github.com/vain/sgopherd"
license=('custom:PIZZA-WARE')
depends=('bash')
makedepends=('git')
backup=('etc/xinetd.d/sgopherd')
optdepends=('xinetd: Traditional way to run sgopherd'
            'systemd: sgopherd also works with socket activation')

_gitroot="git://github.com/vain/sgopherd.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 sgopherd "$pkgdir"/usr/bin/sgopherd

  install -Dm644 xinetd/xinetd-example.conf "$pkgdir"/etc/xinetd.d/sgopherd

  install -Dm644 systemd/sgopherd@.service \
    "$pkgdir"/usr/lib/systemd/system/sgopherd@.service
  install -Dm644 systemd/sgopherd.socket \
    "$pkgdir"/usr/lib/systemd/system/sgopherd.socket
  install -Dm755 systemd/sgopherd-systemd \
    "$pkgdir"/usr/bin/sgopherd-systemd

  install -Dm644 man8/sgopherd.8 "$pkgdir"/usr/share/man/man8/sgopherd.8
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
