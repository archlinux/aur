# Maintainer: Oleg Finkelshteyn <olegfink@gmail.com>
pkgname=picocom-git
_pkgname=picocom
pkgver=r186.deffd18
pkgrel=1
arch=(x86_64 i686)
pkgdesc='Minimal dumb-terminal emulation program, very much like minicom. Development version'
url='https://github.com/npat-efault/picocom'
license=(GPL2)
source=('git+https://github.com/npat-efault/picocom.git')
makedepends=(git)
conflicts=(picocom)
provides=(picocom)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make UUCP_LOCK_DIR=/run/lock/picocom
}

package() {
  cd $_pkgname
  install -D -m 755 picocom "$pkgdir/usr/bin/picocom"
  install -D -m 644 picocom.1 "$pkgdir/usr/share/man/man1/picocom.1"
  # install tmpfiles for lock files
  # http://lists.freedesktop.org/archives/systemd-devel/2011-March/001823.html
  install -D -m 644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  echo "d /run/lock/$_pkgname 0770 root uucp" \
    > "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}

md5sums=('SKIP')
