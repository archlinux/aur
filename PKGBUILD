# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=ceph-git
pkgver=20110528
pkgrel=1
pkgdesc="Massively distributed fault-tolerant file system. Git development version."
arch=('x86_64' 'i686')
url="http://ceph.newdream.net/"
license=('GPL')
depends=('libedit' 'libsigc++' 'gtkmm' 'btrfs-progs-unstable' 'crypto++' 'gperftools' 'python2' 'fuse' 'keyutils' 'libatomic_ops' 'linux>=2.6.37')
makedepends=('boost')
optdepends=('fcgi: radosgw - Amazon S3 compatibility'
						'expat: radosgw - Amazon S3 compatibility')
provides=('ceph')
conflicts=('ceph')
_gitroot="git://ceph.newdream.net/git/ceph.git"
_gitname="ceph"

build() {
  cd "$srcdir"

  msg "Connecting to the ceph git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir"
  rm -rf "$_gitname-build"
  git clone "$_gitname" "$_gitname-build"
  cd "$_gitname-build"

  msg2 "Configuring..."
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make clean
  msg2 "Compiling..."
  make
  msg2 "Patching python scripts..."
  sed -i 's:thon:thon2:' src/obsync/boto_tool
  sed -i 's:thon:thon2:' src/obsync/obsync
}

package() {
  cd "$_gitname-build"
  msg2 "Packaging..."
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/var/run/ceph" "$pkgdir/var/log/ceph" \
    "$pkgdir/etc/rc.d" "$pkgdir/etc/ceph"
  install -Dm755 "src/init-ceph" "$pkgdir/etc/rc.d/ceph"
  # Move /usr/sbin to /sbin, which is expected by the mount command
  mv "$pkgdir/usr/sbin" "$pkgdir/"
  install -Dm644 "$pkgdir/usr/share/doc/ceph/sample.ceph.conf" \
    "$pkgdir/etc/ceph/ceph.conf.sample"
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
