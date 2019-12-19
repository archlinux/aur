# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: geekbeat <geekbeat@bitbucket.org>
pkgname=inotify-daemon # '-bzr', '-git', '-hg' or '-svn'
pkgver=20191219.3.r0.g70e0802
pkgrel=1
pkgdesc="A daemon to trigger system-tasks upon preconfigured inotify-events."
arch=('i686' 'x86_64')
url="http://matcha.cakeisaweso.me/ast/inotify-daemon"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'rust' 'fakeroot') # 'bzr', 'git', 'mercurial' or 'subversion'
backup=('etc/inotify-daemon.yml')
install=
source=(
	'git+http://matcha.cakeisaweso.me/ast/inotify-daemon.git' 
	'inotify-daemon.example.yml'
)
md5sums=(
	'SKIP' 
	39929e16227a365eca33116ae4530d60
)


pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

build() {
	cd "$srcdir/${pkgname%-VCS}"
	cargo build --release
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	cargo test
}

package() {
	mkdir "$pkgdir/etc"
	mkdir -p "$pkgdir/usr/share/man/man8"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	install "$srcdir/$pkgname/target/release/inotify-daemon" \
	  "$pkgdir/usr/bin"
	install "$srcdir/inotify-daemon.example.yml" "$pkgdir/etc/inotify-daemon.yml"
	install "$srcdir/$pkgname/systemd/inotify-daemon.service" "$pkgdir/usr/lib/systemd/system"
	install "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/README.md"
	install "$srcdir/$pkgname/manpages/inotify-daemon.8" "$pkgdir/usr/share/man/man8/inotify-daemon.8"
	install "$srcdir/$pkgname/manpages/inotify-daemon.service.8" "$pkgdir/usr/share/man/man8/inotify-daemon.service.8"
}
