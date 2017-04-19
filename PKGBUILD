# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com_

pkgname=dracut
pkgver=045
pkgrel=2
pkgdesc="Generic, modular, cross-distribution initramfs generation tool"
arch=("i686" "x86_64")
url="https://dracut.wiki.kernel.org/"
license=("GPL")
depends=("cpio" "dash" "kbd" "kmod" "util-linux" "systemd>=199" "bash>=4.0")
optdepends=("cryptsetup: Part of the Crypto setup"
	"dmraid: Part of the Raid setup"
	"lvm2: Part of the LVM setup"
	"mdadm: Part of the MDadmin thing"
	"kexec-tools: For switch kernels without reboot support")
makedepends=("docbook-xsl" "asciidoc")
backup=("etc/dracut.conf")
install="dracut.install"
source=("http://www.kernel.org/pub/linux/utils/boot/$pkgname/${pkgname}-${pkgver}.tar.xz"
	"http://www.kernel.org/pub/linux/utils/boot/$pkgname/${pkgname}-${pkgver}.tar.sign")

# Skipp the check since it requiere rpm to work, such portable, wow deb, much other packagemanager
#check() {
# cd "${srcdir}/${pkgname}-${pkgver}"
#
# make check
#}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # For it to work with current dependencies ## 14mRh4X0r 
  sed -i 's|$(arch)|$(uname -m)|g' "${srcdir}/${pkgname}-${pkgver}/modules.d/90crypt/module-setup.sh"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin \
	      --libdir=/usr/lib --libexecdir=/usr/lib/dracut \
	      --systemdsystemunitdir=/usr/lib/systemd/system \
	      --bashcompletiondir=/usr/share/bash-completion/completions \
	      --sysconfdir=/etc --loginstalldir=/var/log/dracut
  make sysconfdir=/etc prefix=/usr \
  	bindir=/usr/bin sbindir=/usr/bin \
  	libdir=/usr/lib libexecdir=/usr/lib/dracut \
	systemdsystemunitdir=/usr/lib/systemd/system \
	bashcompletiondir=/usr/share/bash-completion/completions \
	sysconfdir=/etc loginstall=/var/log/dracut
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" sysconfdir=/etc prefix=/usr \
	bindir=/usr/bin sbindir=/usr/bin \
	libdir=/usr/lib libexecdir=/usr/lib/dracut \
	systemdsystemunitdir=/usr/lib/systemd/system \
	bashcompletiondir=/usr/share/bash-completion/completions \
	sysconfdir=/etc loginstall=/var/log/dracut install
}

validpgpkeys=("4C96E1500F9421CCF82D5DCA034EB370014DF270") # Harald Hoyer
md5sums=('70d8d222dcdd00b9ee3e05e3bc1d9435'
         'SKIP')
