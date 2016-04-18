# Maintainer: Peter Schneider <e.at.chi.kaen@gmail.com>
pkgname='trustedgrub2-git' # '-bzr', '-git', '-hg' or '-svn'
pkgver=r9387.6750c4e
pkgrel=1
pkgdesc="TPM enabled GRUB2 Bootloader"
arch=('x86' 'x86_64')
url="https://github.com/Sirrix-AG/TrustedGRUB2/"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'autogen' 'autoconf' 'automake' 'gcc' 'bison' 'flex') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}" "grub")
conflicts=("${pkgname%-git}" "grub")
replaces=("grub")
backup=()
options=()
install=
source=('git+https://github.com/Sirrix-AG/TrustedGRUB2'
		'grub.default')
noextract=()
md5sums=('SKIP'
         '860933e5027697900a13e9b592cb4ca6')

pkgver() {
	cd "$srcdir/TrustedGRUB2"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/TrustedGRUB2"
}

build() {
	cd "$srcdir/TrustedGRUB2"
	./autogen.sh
	./configure --prefix=/usr \
				--bindir="/usr/bin" \
				--sbindir="/usr/bin" \
				--mandir="/usr/share/man" \
				--infodir="/usr/share/info" \
				--datarootdir="/usr/share" \
				--sysconfdir="/etc" \
				--with-bootdir="/boot" \
				--with-grubdir="grub" \
				--enable-grub-mkfont \
				--enable-grub-mount \
				--target=i386 -with-platform=pc
	make CFLAGS+="-fno-stack-protector"
}

check() {
	cd "$srcdir/TrustedGRUB2"
	#make -k check CFLAGS+="-fno-stack-protector"
}

package() {
	cd "$srcdir/TrustedGRUB2"
	make DESTDIR="$pkgdir/" bashcompletiondir="/usr/share/bash-completion/completions" install
	mkdir -p "${pkgdir}/usr/etc/default"
	msg "Install /etc/default/grub (used by grub-mkconfig)"
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
}
