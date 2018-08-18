# Maintainer: c6parmak <can6parmak <AT> gmail <DOT> com>
# Contributor: Lucki <Lucki <AT> holarse-linuxgaming <DOT> de>

pkgname=gfxtablet-git
pkgver=48.f0f20fa
pkgrel=1
pkgdesc="Android app to control a virtual Network Tablet on Linux"
arch=('i686' 'x86_64')
url="http://github.com/rfc2822/GfxTablet"
license=('MIT')
makedepends=('git')
source=("$pkgname"::'git://github.com/rfc2822/GfxTablet.git'
        '99-uinput.rules')
md5sums=('SKIP'
         'b5d5b8e5291c08302a7a6dff8aa1ebf2')
install="${pkgname}.install"

pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$pkgname"
   git remote add tonyg https://github.com/tonyg/GfxTablet.git || _r=$?
   git fetch tonyg
   git -c user.email="your@email.com" -c user.name="Your Name" merge -s recursive -Xours tonyg/master
}

build() {
	cd "$pkgname/driver-uinput"
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname/driver-uinput/networktablet" "$pkgdir/usr/bin/networktablet"
	install -Dm644 "$srcdir/99-uinput.rules" "$pkgdir/etc/udev/rules.d/99-uinput.rules"
    install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
