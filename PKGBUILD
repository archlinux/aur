# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Original Maintainer: Nolan Haynes <nolan haynes at gmail dot com>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=qtsixa-git
pkgver=1.5.1.74.c2f4ed9
pkgrel=1
pkgdesc="An utility to configure and use sixaxis controller via bluetooth."
url="http://sourceforge.net/projects/qtsixa/"
arch=('i686' 'x86_64' 'ppc')
license=('GPL')
install=qtsixa.install
backup=('etc/default/sixad')
depends=('bluez' 'python2-pyqt' 'qt4' 'python2' 'bluez-utils' 'bluez-libs' 'jack' 'libusb-compat')
makedepends=('patch' 'pyqt' 'bluez-libs')
conflicts=('sixpair' 'qtsixa')
replaces=('qtsixa')
source=(git+git://qtsixa.git.sourceforge.net/gitroot/qtsixa/qtsixa
	    sixad-init.patch
	    sixad-bin.patch
	    sixad.service
	    qtsixa-dbus.patch
	    qtsixa-gksudo.patch
      sixad-lq.patch
      sixad-notify.patch
      bluetooth
      97-sixpair.rules)

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir"/qtsixa
  
  version=$(grep "QtSixA version" qtsixa/gui/main.py | sed 's/  print "QtSixA version: //' | sed 's/"//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash  
}

prepare() {
	# patch files for Arch Linux's filesystem heirarchy
	pushd "$srcdir"/qtsixa
	sed -i 's:/sbin/:/bin/:g' qtsixa/gui/qtsixa_main.py
	sed -i 's: /bin/: /usr/bin/:g' qtsixa/gui/qtsixa_main.py
	sed -i 's:/sbin/:/bin/:g' utils/Makefile
	sed -i 's:/sbin/:/bin/:g' sixad/Makefile
	sed -i 's: /sbin/: /usr/bin/:g' sixad/sixad
	sed -i 's: /usr/sbin/: /usr/bin/:g' sixad/sixad
	sed -i 's:/sbin/:/bin/:g' sixad/bluetooth.cpp
	popd
	
	# patch for sixad daemon
	echo "Patching sixad..."
	patch -p0 < "$srcdir"/sixad-init.patch
	patch -p0 < "$srcdir"/sixad-bin.patch
	patch -p0 < "$srcdir"/qtsixa-dbus.patch
	patch -p0 < "$srcdir"/qtsixa-gksudo.patch
  patch -p0 < "$srcdir"/sixad-lq.patch
  patch -p0 < "$srcdir"/sixad-notify.patch
	
	cd "$srcdir"/qtsixa/qtsixa/gui/
	echo "Fixing python shebangs..."
	find . -name "*.py" -exec sed -i "s/python/python2/g" '{}' \;
	sed -i 's/python/python2/g' ../qtsixa
}

build() {	
	cd "$srcdir"/qtsixa

	make all || exit 1

}

package() {
## Qtsixa installation, adapted from makefile of qtsixa folder ##
## make directories
mkdir -p \
	"$pkgdir"/usr/bin/ \
  "$pkgdir"/usr/lib/udev/rules.d/ \
	"$pkgdir"/usr/share/applications/ \
	"$pkgdir"/usr/share/pixmaps/ \
	"$pkgdir"/usr/share/qtsixa/ \
	"$pkgdir"/usr/share/qtsixa/game-profiles/ \
	"$pkgdir"/usr/share/qtsixa/gui/ \
	"$pkgdir"/usr/share/qtsixa/icons/ \
	"$pkgdir"/usr/share/qtsixa/pics/ \
	"$pkgdir"/usr/share/qtsixa/profiles
#	"$pkgdir"/usr/share/doc/qtsixa/manual
#	"$pkgdir"/usr/share/qtsixa/lang/ \
#	"$pkgdir"/usr/share/doc/qtsixa/ \


## systemd
mkdir -p "$pkgdir"/usr/lib/systemd/system/
install -m 644 "$srcdir"/sixad.service "$pkgdir"/usr/lib/systemd/system/

cd "$srcdir/qtsixa/qtsixa"

## Install files
	install -m 755 qtsixa "$pkgdir"/usr/bin/
	install -m 755 sixad-lq "$pkgdir"/usr/bin/
	install -m 755 sixad-notify "$pkgdir"/usr/bin/
#	install -m 644 manual/* "$pkgdir"/usr/share/doc/qtsixa/manual/
  install -m 644 "$srcdir"/97-sixpair.rules "$pkgdir"/usr/lib/udev/rules.d/
	install -m 644 game-profiles/* "$pkgdir"/usr/share/qtsixa/game-profiles/
	install -m 644 gui/*.py "$pkgdir"/usr/share/qtsixa/gui/
	install -m 644 icons/* "$pkgdir"/usr/share/qtsixa/icons/
	install -m 644 pics/* "$pkgdir"/usr/share/qtsixa/pics/
	install -m 644 profiles/* "$pkgdir"/usr/share/qtsixa/profiles/
#	install -m 644 lang/* "$pkgdir"/usr/share/qtsixa/lang/
	install -m 644 sixad-notify.desktop "$pkgdir"/usr/share/qtsixa/
	install -m 644 qtsixa.desktop "$pkgdir"/usr/share/applications/
	install -m 644 qtsixa.xpm "$pkgdir"/usr/share/pixmaps/

## Sixad installation, adapted from makefile of sixad folder ##
## Make directories

  mkdir -p \
	"$pkgdir"/etc/default/ \
	"$pkgdir"/etc/rc.d/ \
	"$pkgdir"/etc/logrotate.d/ \
	"$pkgdir"/var/lib/sixad/ \
	"$pkgdir"/var/lib/sixad/profiles/

  chmod 775 -R "$pkgdir"/var/lib/sixad/

  cd ../sixad

# Install files
	install -m 644 sixad.default "$pkgdir"/etc/default/sixad
	install -m 755 sixad.init "$pkgdir"/etc/rc.d/sixad
  install -m 755 "$srcdir"/bluetooth "$pkgdir"/etc/rc.d/
	install -m 644 sixad.log "$pkgdir"/etc/logrotate.d/sixad
	install -m 755 sixad "$pkgdir"/usr/bin/
	install -m 755 bins/sixad-bin "$pkgdir"/usr/bin/
	install -m 755 bins/sixad-sixaxis "$pkgdir"/usr/bin/
	install -m 755 bins/sixad-remote "$pkgdir"/usr/bin/
	install -m 755 bins/sixad-3in1 "$pkgdir"/usr/bin/
	install -m 755 bins/sixad-raw "$pkgdir"/usr/bin/
	#chmod 777 -R "$pkgdir"/var/lib/sixad/

## Utils installation, adapted from makefile of utils folder ##
## Install files

  cd ../utils
	install -m 755 bins/sixpair "$pkgdir"/usr/bin/
	install -m 755 bins/sixpair-kbd "$pkgdir"/usr/bin/
	install -m 755 bins/hidraw-dump "$pkgdir"/usr/bin/
	install -m 755 bins/sixad-jack "$pkgdir"/usr/bin/

} 

