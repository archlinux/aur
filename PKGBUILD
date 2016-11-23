# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=windows-gaming-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r5.61e377b
pkgrel=1
pkgdesc="Windows gaming utils"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('qemu-headless' 'sudo' 'libsystemd')
optdepends=('samba: shared folder support')
makedepends=('git' 'rpmextract' 'curl' 'libarchive' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=('etc/windows-gaming-driver.toml')
options=()
install=
source=('git+https://github.com/main--/windows-gaming.git')
noextract=()
md5sums=('SKIP')

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

	# grab ovmf
        curl -o ovmf.rpm "https://www.kraxel.org/repos/jenkins/edk2/$(curl -s 'https://www.kraxel.org/repos/jenkins/edk2/' | grep -Eo 'edk2.git-ovmf-x64-[-\.a-z0-9]+\.noarch\.rpm' | head -n1)"
        rpm2cpio ovmf.rpm | bsdtar -xvf - --strip-components 4 './usr/share/edk2.git/ovmf-x64/OVMF_CODE-pure-efi.fd' './usr/share/edk2.git/ovmf-x64/OVMF_VARS-pure-efi.fd'
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -D windows-gaming-driver/target/release/windows-gaming-driver $pkgdir/usr/lib/windows-gaming/windows-gaming-driver
	cp ovmf-x64/OVMF_CODE-pure-efi.fd $pkgdir/usr/lib/windows-gaming/ovmf-code.fd
	cp ovmf-x64/OVMF_VARS-pure-efi.fd $pkgdir/usr/lib/windows-gaming/ovmf-vars.fd
	install -D -m644 config-sample.toml $pkgdir/etc/windows-gaming-driver.toml
	install -D -m644 windows.service $pkgdir/usr/lib/systemd/system/windows.service
}
