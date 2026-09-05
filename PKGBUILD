# Maintainer: ChouChiu <lshengevery@gmail.com>

pkgname=purivox-bin
pkgver=1.0.1
pkgrel=1
_iteration=1
pkgdesc="Reference-guided and neural vocal separation for stage and live recordings"
arch=('x86_64')
url="https://github.com/ChouChiu/Purivox"
license=('AGPL-3.0-or-later')
# The onefile carries its own Python, Qt and DSP stack. Qt still loads EGL and
# PulseAudio from the system, which is what the .deb declares as well.
depends=('libglvnd' 'libpulse')
optdepends=('hicolor-icon-theme: desktop entry icon')
provides=('purivox')
conflicts=('purivox')
# The payload is appended to the executable: stripping it removes the program.
options=('!strip' '!debug')
source=("purivox-${pkgver}.deb::${url}/releases/download/v${pkgver}/purivox_${pkgver}-${_iteration}_amd64.deb")
# The package is the .deb's own tree, so makepkg does not need to unpack the
# 122 MB archive a second time before package() reads it.
noextract=("purivox-${pkgver}.deb")
sha256sums=('bd47430a5d8ab82f63bca41229717b957d98bcccbe6c769bc02d86ee91215a06')

package() {
	# The .deb already stages exactly what a desktop install needs, so the
	# package is its data tree. bsdtar reads the inner archive off stdin, which
	# keeps this working whichever compression fpm picked.
	bsdtar -xOf "purivox-${pkgver}.deb" 'data.tar*' | bsdtar -xp -C "$pkgdir"
	# Debian keeps the licence under /usr/share/doc; Arch has it in
	# /usr/share/licenses, where the same file already landed.
	rm -rf "$pkgdir/usr/share/doc"
}
