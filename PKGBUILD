pkgname=windows-gaming-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r18.85b1ac4
pkgrel=1
pkgdesc="Windows gaming utils"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('qemu-headless' 'sudo' 'libsystemd' 'acl' 'udev' 'coreutils' 'pciutils')
optdepends=('samba: shared folder support')
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

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	cd windows-gaming-driver
	cargo build --release
	cd ..

	cd guest-agent
	xbuild /p:Configuration=Release VfioService/VfioService.sln
	cp VfioService/VfioService/bin/Release/VfioService.exe .
	mkisofs -m VfioService -o windows-gaming-ga.iso -r -J -input-charset iso8859-1 -V "windows-gaming-ga" .
	cd ..

	# grab ovmf
        curl -o ovmf.rpm "https://www.kraxel.org/repos/jenkins/edk2/$(curl -s 'https://www.kraxel.org/repos/jenkins/edk2/' | grep -Eo 'edk2.git-ovmf-x64-[-\.a-z0-9]+\.noarch\.rpm' | head -n1)"
        rpm2cpio ovmf.rpm | bsdtar -xvf - --strip-components 4 './usr/share/edk2.git/ovmf-x64/OVMF_CODE-pure-efi.fd' './usr/share/edk2.git/ovmf-x64/OVMF_VARS-pure-efi.fd'
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -D windows-gaming-driver/target/release/windows-gaming-driver $pkgdir/usr/bin/windows-gaming-driver
	install -D -m644 ovmf-x64/OVMF_CODE-pure-efi.fd $pkgdir/usr/lib/windows-gaming/ovmf-code.fd
	install -D -m644 ovmf-x64/OVMF_VARS-pure-efi.fd $pkgdir/usr/lib/windows-gaming/ovmf-vars.fd
	install -D -m644 guest-agent/windows-gaming-ga.iso $pkgdir/usr/lib/windows-gaming/windows-gaming-ga.iso
	install -D -m644 ../virtio-win_amd64.vfd $pkgdir/usr/lib/windows-gaming/virtio-win.vfd
	install -D -m644 misc/windows.service $pkgdir/usr/lib/systemd/system/windows.service
	install -D -m644 misc/windows.service $pkgdir/usr/lib/systemd/user/windows.service
	install -D -m644 misc/80-vfio.rules $pkgdir/usr/lib/udev/rules.d/80-vfio.rules
}



# JUCK FARO
