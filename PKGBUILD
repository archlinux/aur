# Maintainer: X0rg

_gitname=darling
pkgname=$_gitname-mach-git
pkgver=r23.44cf244
pkgrel=2
pkgdesc="Darling's Linux kernel module (darling-mach)"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
groups=('darling-git')
makedepends=('git')
source=('git+https://github.com/darlinghq/darling.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD -- 'src/lkm')" "$(git rev-list --abbrev-commit --max-count=1 HEAD -- 'src/lkm')"
}

build() {
	cd "$srcdir/$_gitname/src/lkm"

	for kernel in $(ls -d /lib/modules/*); do
		if [[ -n $(pacman -Qo $kernel | awk '/linux/ && /headers/') ]]; then
			msg2 "Build Linux kernel module for $(basename $kernel) kernel..."
			make -C "$kernel/build" M=$PWD modules
		fi
	done
}

package() {
	install=$pkgname.install

	cd "$srcdir/$_gitname/src/lkm"

	for kernel in $(ls -d /lib/modules/*); do
		if [[ -n $(pacman -Qo $kernel | awk '/linux/ && /headers/') ]]; then
			msg2 "Install Linux kernel module for $(basename $kernel) kernel..."
			make INSTALL_MOD_PATH="$pkgdir/usr" -C "$kernel/build" M=$PWD modules_install
		fi
	done
}
