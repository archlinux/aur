# Maintainer: X0rg

_gitname=darling
pkgname=$_gitname-mach-dkms-git
pkgver=r23.44cf244
pkgrel=2
pkgdesc="Darling kernel modules sources (darling-mach)"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
groups=('darling-git')
conflicts=('darling-mach-git')
provides=('darling-mach-git')
replaces=('darling-mach-git')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build modules against the Arch kernel'
            'linux-lts-headers: build modules against the LTS kernel'
            'linux-zen-headers: build modules against the ZEN kernel'
            'linux-grsec-headers: build modules against the GRSEC kernel')
source=('git+https://github.com/darlinghq/darling.git'
        'dkms.conf')
md5sums=('SKIP'
         'ecdbe450d66128abda784cf6ec232f25')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD -- 'src/lkm')" "$(git rev-list --abbrev-commit --max-count=1 HEAD -- 'src/lkm')"
}

package() {
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
