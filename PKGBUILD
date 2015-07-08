pkgname=servo-git
pkgver=10609.c63fc4d
pkgrel=1
pkgdesc='Parallel Browser Project: web browser written in Rust'
arch=('x86_64' 'i686')
url="https://github.com/mozilla/servo"
license=('MPL')
depends=('freetype2' 'mesa' 'libxrandr' 'libxi' 'libgl' 'glu' 'fontconfig'
         'ttf-font' 'bzip2' 'libxcursor' 'libxmu')
makedepends=('git' 'curl' 'python2' 'python2-virtualenv' 'gperf'
             'cmake')
provides=('servo')
conflicts=('servo' 'rust')
source=('git+https://github.com/servo/servo.git')

md5sums=('SKIP')


pkgver() {
	cd $srcdir/servo
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd $srcdir/servo

	# fixes build error
	# possibly _FORTIFY_SOURCE? https://bugs.archlinux.org/task/34759
	unset CPPFLAGS

	./mach build -d
}

package() {
  servopath=servo/components/servo/target/debug
  install -Dm755 "$srcdir/$servopath/servo" "$pkgdir/usr/bin/servo"

  mkdir -p "$pkgdir/usr/lib"

  find $srcdir/$servopath/deps -name "*-*.so" -exec basename {} \; | sort | uniq | while read _f; do
	  _file=$(find $srcdir/$servopath/deps -name "$_f" -print | head -n 1)
	  if [ -z "$_file" ]; then
		  echo "Skipping: $_f"
		  continue
	  fi
	  install -Dm644 "$_file" "$pkgdir/usr/lib"
  done
}
