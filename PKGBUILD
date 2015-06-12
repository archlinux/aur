# Contributor: Whitney Marshall <whitney.marshall@gmail.com>
# Maintainer: McNoggins <Gagnon88 (at) gmail (dot) com>

pkgname=go-mtpfs-git
pkgver=20150424
pkgrel=1
pkgdesc="Simple tool for viewing MTP devices as FUSE filesystems"
arch=('x86_64' 'i686')
url="http://github.com/hanwen/go-mtpfs"
license=('BSD')
depends=('libmtp' 'fuse')
makedepends=('go>=1.3.0' 'git')
options=('!strip' '!emptydirs')
source=("git+https://github.com/hanwen/go-mtpfs.git")
md5sums=("SKIP")
_gourl=github.com/hanwen/go-mtpfs

pkgver() {
  # Use date of latest commit for pkgver
  cd "$srcdir/go-mtpfs"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir"
  # Build using go
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {

  # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
  
  # Package executables
  if [ -e "$srcdir/bin/go-mtpfs" ]; then
    install -Dm755 "$srcdir/bin/go-mtpfs" \
      "$pkgdir/usr/bin/go-mtpfs"
  fi
}