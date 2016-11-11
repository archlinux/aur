# Maintainer: X0rg

_gitname=darling
pkgbase=$_gitname-mach-git
pkgname=($_gitname-mach-git $_gitname-mach-dkms-git)
pkgver=r23.44cf244
pkgrel=2
pkgdesc="Darling's Linux kernel module (darling-mach)"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
groups=('darling-git')
makedepends=('git')
source=('git+https://github.com/darlinghq/darling.git'
        'dkms.conf')
md5sums=('SKIP'
         'ecdbe450d66128abda784cf6ec232f25')

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

package_darling-mach-git() {
	install=$pkgname.install

	cd "$srcdir/$_gitname/src/lkm"

	for kernel in $(ls -d /lib/modules/*); do
		if [[ -n $(pacman -Qo $kernel | awk '/linux/ && /headers/') ]]; then
			msg2 "Install Linux kernel module for $(basename $kernel) kernel..."
			make INSTALL_MOD_PATH="$pkgdir/usr" -C "$kernel/build" M=$PWD modules_install
		fi
	done
}

package_darling-mach-dkms-git() {
	depends=('dkms')
	optdepends=('linux-headers: Build the module for Arch kernel'
	            'linux-lts-headers: Build the module for LTS Arch kernel')
	conflicts=('darling-mach-git')
	provides=('darling-mach-git')
	_srcdest="$pkgdir/usr/src/darling-mach-$pkgver"

	msg2 "Install module sources for DKMS..."
	install -dm755 "$_srcdest"
	cp -r "$srcdir/$_gitname/src/lkm"                        "$_srcdest"
	cp -r "$srcdir/$_gitname/kernel-include"                 "$_srcdest"
	cp -r "$srcdir/$_gitname/platform-include"               "$_srcdest"
	cp -r "$srcdir/$_gitname/src/libc/include"               "$_srcdest/libc-include"
	install -Dm644 "$srcdir/dkms.conf"                       "$_srcdest"

	msg2 "Set configuration for DKMS..."
	sed -i "s|/../../kernel-include|/../kernel-include|"     "$_srcdest/lkm/Makefile"
	sed -i "s|/../../platform-include|/../platform-include|" "$_srcdest/lkm/Makefile"
	sed -i "s|/../libc/include|/../libc-include|"            "$_srcdest/lkm/Makefile"
	sed -i "s|@PKGVER@|$pkgver|g"                            "$_srcdest/dkms.conf"
}
