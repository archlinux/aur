pkgname=windows-gaming-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r174.b2cc949
pkgrel=1
pkgdesc="Windows gaming utils"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('qemu-headless' 'sudo' 'libsystemd' 'acl' 'udev' 'coreutils' 'hwids' 'libinput' 'libx11')
optdepends=('samba: shared folder' 'qemu: windowed setup')
makedepends=('git' 'rpmextract' 'curl' 'libarchive' 'cargo' 'mono' 'cdrkit') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install="windows-gaming.install"
source=('git+https://github.com/main--/windows-gaming.git' 'https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.126-2/virtio-win_amd64.vfd')
noextract=()
md5sums=('SKIP' '954ca57735102d16e87a7c4caa979f67')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/$(DESTDIR)\/lib/$(DESTDIR)\/usr\/lib/' Makefile
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
