# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator
pkgver=9.0.2
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'riscv64')
url="https://github.com/iNavFlight/inav-configurator"
license=('GPL-3.0-only')
depends=(
	'at-spi2-core' 'libxcb' 'nspr' 'libxfixes' 'cairo' 'alsa-lib'
	'libxcomposite' 'libcups' 'nss' 'libxkbcommon' 'libxext' 'libx11'
	'libxdamage' 'mesa' 'gtk3' 'libxrandr' 'glib2' 'systemd-libs' 'dbus'
	'glibc' 'expat' 'libgcc' 'pango' 'libstdc++' 'nodejs'

)
makedepends=('yarn' 'git')
install=inav-configurator.install
#source=("git+$url#tag=$pkgver")
source=("git+$url#tag=untagged-58a74ccc453672f866b7")
sha512sums=('d2ab7b85a5e2958dd8544d80723ecbc84f8f8ccb3942bafe44fd37c749b4e8708bbf6e043d9b0fafc917fa3c0737ba472deb124dc59e73a9eca5fbf9cfb44eab')

# copied from the 'code' package
case "$CARCH" in
  i686)
    _electron_arch=ia32
    ;;
  x86_64)
    _electron_arch=x64
    ;;
  armv7h)
    _electron_arch=armv7l
    ;;
  aarch64)
    _electron_arch=arm64
    ;;
  riscv64)
    _electron_arch=riscv64
    ;;
  *)
    # Needed for mksrcinfo
    _electron_arch=DUMMY
    ;;
esac

prepare() {
	cd $pkgname
	sed -i 's|/opt/inav/|/opt/|' assets/linux/inav-configurator.desktop
	yarn install --ignore-scripts --frozen-lockfile
}

build() {
	cd $pkgname
	yarn run package --arch="$_electron_arch"
}

package() {
	cd $pkgname
	install -d "$pkgdir/opt/inav-configurator/"
	cp -r "out/INAV Configurator-linux-$_electron_arch"/* "$pkgdir/opt/inav-configurator/"

	install -Dm644 "assets/linux/inav-configurator.desktop" \
		"$pkgdir/usr/share/applications/inav-configurator.desktop"

	install -d "$pkgdir/usr/bin/"
	ln -s "/opt/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"
}
