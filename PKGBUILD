# Maintainer: Savely Krasovsky <savely@krasovs.ky>
pkgname=reform-tools
pkgver=1.7
pkgrel=2
pkgdesc="MNT Reform laptop tools"
arch=('x86_64' 'aarch64')
url="https://mntre.com/reform2/handbook/index.html"
license=('GPL3')
depends=('python'
         'python-psutil'
         'rsync'
         'alsa-utils'
         'systemd'
         'procps-ng'
         'busybox')
optdepends=('ircii'
            'pavucontrol')
_commit=2e0cff9b45d45237822a1d27e40dfd74af9476d0
source=("$pkgname-$pkgver.tar.gz::https://source.mnt.re/reform/reform-tools/-/archive/$_commit/reform-tools-$_commit.tar.gz"
        'motd-full'
	'motd-rescue')
sha256sums=('edfb6e261a4174b983bb27a1dab370e96800a6b545b1225c5715bef960305a05'
            '569b5310fa33ca99cfe08afb06e4cf7906233cca74acda70a6bdaa5ba01f6643'
            'f7986b5dce945a9dcc923bbc66db11f6f5cba1e78576873b644fadff4dc5ad8d')

prepare() {
	cd reform-tools-$_commit

	mkdir -p $srcdir/usr/share/fonts
	rm -rf $srcdir/usr/share/fonts/Iosevka-Term
	mv Iosevka-Term $srcdir/usr/share/fonts

	mkdir -p $srcdir/usr/lib/udev/rules.d
	mv audio/99-reform.rules $srcdir/usr/lib/udev/rules.d
	mkdir -p $srcdir/usr/share/pulseaudio/alsa-mixer/paths
	mv audio/analog-input-reform.conf $srcdir/usr/share/pulseaudio/alsa-mixer/paths
	mkdir -p $srcdir/var/lib/alsa
	mv audio/asound.state $srcdir/var/lib/alsa
	mkdir -p $srcdir/usr/share/pulseaudio/alsa-mixer/profile-sets
	mv audio/reform.conf $srcdir/usr/share/pulseaudio/alsa-mixer/profile-sets

	mkdir -p $srcdir/usr/bin
	mv bin/* $srcdir/usr/bin

	mkdir -p $srcdir/etc
	rm -rf $srcdir/etc/*
	mv etc/* $srcdir/etc

	mkdir -p $srcdir/usr/bin
	mv sbin/* $srcdir/usr/bin

	mkdir -p $srcdir/usr/lib/systemd/system-shutdown
	mv systemd/reform-poweroff $srcdir/usr/lib/systemd/system-shutdown
	mkdir -p $srcdir/usr/lib/systemd/sleep.conf.d
	mv systemd/reform-sleep.conf $srcdir/usr/lib/systemd/sleep.conf.d

	mkdir -p $srcdir/usr/lib/systemd/system
	cp debian/reform-tools.reform-sleep.service $srcdir/usr/lib/systemd/system/reform-sleep.service
	cp debian/reform-tools.reform-hw-setup.service $srcdir/usr/lib/systemd/system/reform-hw-setup.service

	rm -rf ../reform-tools-$_commit
}

package() {
	cp -dr --no-preserve=ownership $srcdir/* $pkgdir/
	install -Dm644 $srcdir/motd-full -t $pkgdir/etc
	install -Dm644 $srcdir/motd-rescue -t $pkgdir/etc
}
