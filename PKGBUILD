# Maintainer: X0rg

_kernel=$(pacman -Qqo /usr/lib/modules/`uname -r` | grep linux | grep -v headers)
_gitname=darling
pkgname=$_gitname-mach-git
pkgver=21.b37d736
pkgrel=1
pkgdesc="Darling's Linux kernel module (darling-mach)"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
groups=('darling-git')
makedepends=('git' "$_kernel-headers")
install=$pkgname.install
source=('git+https://github.com/darlinghq/darling.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git rev-list --count HEAD -- "src/lkm").$(git rev-parse --short HEAD -- "src/lkm")
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
	cd "$srcdir/$_gitname/src/lkm"

	for kernel in $(ls -d /lib/modules/*); do
		if [[ -n $(pacman -Qo $kernel | awk '/linux/ && /headers/') ]]; then
			msg2 "Install Linux kernel module for $(basename $kernel) kernel..."
			make INSTALL_MOD_PATH="$pkgdir/usr" -C "$kernel/build" M=$PWD modules_install
		fi
	done
}
