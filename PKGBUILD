# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

pkgname=playonlinux
pkgver=4.4+29+gd0ae9ce6
pkgrel=2
pkgdesc="GUI for managing Windows programs under linux"
arch=('x86_64')
url="https://www.playonlinux.com/"
license=('GPL')
depends=('wine' 'imagemagick' 'xterm' 'python-wxpython' 'cabextract' 'unzip' 'mesa-utils' 'gnupg'
         'icoutils' 'xdg-user-dirs' 'libxmu' 'netcat' 'wget' 'p7zip' 'jq' 'perl' python-natsort which)
makedepends=(git)
#source=(https://www.playonlinux.com/script_files/PlayOnLinux/${pkgver/.0/}/PlayOnLinux_${pkgver/.0/}.tar.gz
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PlayOnLinux/POL-POM-4/archive/refs/tags/4.4.tar.gz"
source=("playonlinux4::git+https://github.com/PlayOnLinux/POL-POM-4.git#commit=d0ae9ce61668861dacd5c4981e7f3b020e3cc327"
        PlayOnLinuxUrlHandler.desktop)
options=(!strip)
sha256sums=('SKIP'
            '304d8e998d271383c44acdf386c4664cd65463d5f7f5e3c1c7563fbd8f71a6a8')

pkgver() {
  cd "${srcdir}/playonlinux4"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "${srcdir}/playonlinux4"

  #sed -i "s/libexec/bin/g" Makefile

  #make PREFIX=/usr
  #make DESTDIR="${pkgdir}" install
}

package() {
  cd "${srcdir}/playonlinux4"

	install -d "${pkgdir}/usr/share/playonlinux4"
	install -d "${pkgdir}/usr/bin"
	cp -r "${srcdir}/playonlinux4/" "${pkgdir}/usr/share/"
	rm -rf "${pkgdir}/usr/share/playonlinux4/.git"

	echo '#!/bin/bash' > "${pkgdir}/usr/bin/playonlinux4"
	echo "/usr/share/playonlinux4/playonlinux \"\$@\"" >> "${pkgdir}/usr/bin/playonlinux4"
	chmod +x "${pkgdir}/usr/bin/playonlinux4"

	# Needed for wxpython2.8 support, wxpython 3.0 is buggy with POL
	sed -i "s/wxversion.ensureMinimal/wxversion.select/g" "${pkgdir}/usr/share/playonlinux4/python/mainwindow.py"

	install -D -m644 "${srcdir}/playonlinux4/etc/PlayOnLinux.desktop" "${pkgdir}/usr/share/applications/playonlinux4.desktop"
	sed -i 's/ %F//g' "${pkgdir}/usr/share/applications/playonlinux4.desktop"

	# Fixup desktop file
	sed -i 's/playonlinux/playonlinux4/g' "${pkgdir}/usr/share/applications/playonlinux4.desktop"
	sed -i 's/PlayOnLinux/PlayOnLinux 4/g' "${pkgdir}/usr/share/applications/playonlinux4.desktop"

	# Install icons
	for size in 16 22 32; do
		install -Dm644 "${srcdir}/playonlinux4/etc/playonlinux${size}.png" \
		"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/playonlinux4.png"
	done
}
