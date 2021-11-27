# Maintainer: Maksymilian Śęk <ohio.mail@zohomail.eu>
pkgname=('linux-kernel-ohio' 'linux-kernel-ohio-headers')
pkgver=5.15.5
pkgrel=1
pkgdesc="A fsync patched, configured kernel, which apparently works now!"
arch=('x86_64')
url="none://none"
license=('GPL')
groups=()
depends=()
makedepends=(bc kmod libelf pahole cpio perl tar xz zstd
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git)
checkdepends=()
optdepends=(ccache linux-docs)
provides=('linux')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.5.tar.xz" "config" "0007-v5.15-fsync.patch" "linux-5.15.5-ohio.preset")
noextract=()
sha256sums=("e9565a301525ac81c142ceb832f9053dd5685e107dbcf753d0de4c58bc98851f" "324a9d46c2338806a0c3ce0880c8d5e85c2ef30d342af3dc96f87b54fae7a586" "6c4f0099896f69e56ebd8c9eac266ac8ad993acecd50945e0e84ef6f95f9ddca"
"e519968bcf581afc67932a888d9a5db14f10d023d292a50646f69f3d597b70f8")
validpgpkeys=()

#prepare and nuker
prepare() {
    if [[ nuke == *"yes" ]] || [[ nuke == *"true" ]]; then
        msg2 "Nuke enabled, removing srcdir..."
        rm $srcdir
    fi
	cd "$srcdir"/linux-$pkgver
	cp ../0007-v5.15-fsync.patch .
	cp ../config ./.config
	patch -p1 -i "$srcdir/linux-$pkgver/0007-v5.15-fsync.patch"
}
#build
build() {
	cd "$srcdir"/linux-$pkgver
	make -j$(nproc)
}
#package
package_linux-kernel-ohio() {

	mkdir -p $pkgdir/boot
	mkdir -p $pkgdir/etc/modprobe.d/
	cp linux-$pkgver-ohio.preset $pkgdir/etc/modprobe.d
	cd "$srcdir"/linux-$pkgver/
	make INSTALL_PATH="$pkgdir"/boot install
	mv $pkgdir/boot/vmlinuz $pkgdir/boot/vmlinuz-linux-$pkgver-ohio
	mv $pkgdir/boot/System.map $pkgdir/boot/System.map-linux-$pkgver-ohio
	msg2 "Run mkinitcpio -P when done with the installation, and then update GRUB!"
}
package_linux-kernel-ohio-headers() {
    pkgdesc="Headers for kernel-ohio"
    provides=("linux-headers")
    builddir="$pkgdir/usr/lib/modules/$pkgver-kernel-ohio/build"
    cd "$srcdir"/linux-$pkgver
    mkdir -p $pkgdir/usr/src
    mkdir -p $builddir
    mkdir -p $pkgdir/usr/lib/modules/$pkgver-kernel-ohio/extra
    mkdir -p $pkgdir/usr/lib/modules/$pkgver-kernel-ohio/kernel
    mkdir -p $pkgdir/usr/lib/modules/$pkgver-kernel-ohio/updates
    mkdir -p $builddir/tools/objtool
	make INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH="$pkgdir"/usr modules_install
	cp Module.symvers $pkgdir/usr/src/linux-$pkgver-ohio
	install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts
    cp -t "$builddir" -a include
    cp -t "$builddir/arch/x86" -a arch/x86/include
    cp -t "$builddir/tools/objtool" -a tools/objtool/objtool
    install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s
    install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
    install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
    install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
    install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h
  # link build to /usr/src/kernel-ohio
    cd "$pkgdir"/usr
    ln -s "$pkgdir"/usr/src/kernel-ohio-$pkgver lib/modules/build
}
