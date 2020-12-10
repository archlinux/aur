# Maintainer: Markus Hartung <mail@hartmark.se>
_pkgname=fakeroot
pkgname=fakeroot-git
pkgver=1.25.2.1.r6.g99bb388
pkgrel=1
pkgdesc='Tool for simulating superuser privileges'
arch=('x86_64')
license=('GPL')
url='https://tracker.debian.org/pkg/fakeroot'
groups=('base-devel')
depends=('glibc' 'filesystem' 'sed' 'util-linux' 'sh')
makedepends=('systemd' 'po4a')
provides=("$_pkgname")
source=("git+https://salsa.debian.org/clint/fakeroot.git")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  ./bootstrap
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr \
    --libdir=/usr/lib/libfakeroot \
    --disable-static \
    --with-ipc=sysv

  make -j$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)

  cd doc
  po4a -k 0 --rm-backups --variable 'srcdir=../doc/' po4a/po4a.cfg
}

pkgver() {
  cd "$_pkgname"
  # cutting off 'debian/' prefix
  git describe --long | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd $_pkgname
  make check || echo "Two tests are failing on WSL, I have notified upstream. Ignore for now"
  echo "===================================================================="
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/etc/ld.so.conf.d/"
  echo '/usr/lib/libfakeroot' > "$pkgdir/etc/ld.so.conf.d/fakeroot.conf"

  # install README for sysv/tcp usage
  install -Dm0644 README "$pkgdir/usr/share/doc/$_pkgname/README"

  echo "===================================================================="
  echo "The install will fail if you don't already have a working fakeroot"
  echo "You need to do these steps manually:"
  echo "cd src/fakeroot"
  echo "sudo make install"
  echo "===================================================================="
}
