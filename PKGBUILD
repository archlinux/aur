# Maintainer: Henrik Hallberg <henrik@k2h.se>
pkgname=pvpn
pkgver=0.2.1
pkgrel=1
pkgdesc="VPN over SSH"
arch=('any')
url="https://github.com/halhen/pvpn"
license=('BSD')
depends=('bash' 'iproute2' 'openssh' 'dnsutils' 'ppp')
makedepends=('git' 'asciidoc')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$pkgname.git" ]]; then
    cd "$pkgname.git" && git pull origin
    msg "The local files are updated."
  else
    git clone "$url.git" "$pkgname.git"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$pkgname.git-build"
  git clone "$srcdir/$pkgname.git" "$srcdir/$pkgname.git-build"
  cd "$srcdir/$pkgname.git-build"
  git checkout -q $pkgver

  make
}

package() {
  cd "$srcdir/$pkgname.git-build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
