# Maintainer: Hec <hec@heccraft.com>
_reponame=void-runit
pkgname=cryptsetup-void-runit
pkgver=1.0.r355.42ca737
pkgrel=1
pkgdesc="runit stage1 script for cryptsetup, ripped straight from Void Linux"
arch=('any')
url="https://voidlinux.org"
license=('BSD')
depends=('sh' 'awk' 'runit' 'cryptsetup')
makedepends=('git')
provides=('cryptsetup-runit')
conflicts=('cryptsetup-runit')
source=("git+https://github.com/void-linux/void-runit"
        "cryptsetup")
sha256sums=('SKIP'
'b23600d4218e91546f65d284f6bbbbd8ea966516ea9813180ab4cafa2a0bdf7a'
)

pkgver() {
	cd ${_reponame}
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir "$pkgdir"/usr/lib/rc/sv.d/ -p
	mkdir "$pkgdir"/etc/rc/sysinit/ -p
	mkdir "$pkgdir"/etc/rc/shutdown/ -p
	mkdir "$pkgdir"/etc/runit -p
	install -Dm755 $srcdir/cryptsetup "$pkgdir"/usr/lib/rc/sv.d/cryptsetup
	ln -s /usr/lib/rc/sv.d/cryptsetup "$pkgdir"/etc/rc/sysinit/34-cryptsetup
	ln -s /usr/lib/rc/sv.d/cryptsetup "$pkgdir"/etc/rc/shutdown/65-cryptsetup
	install -Dm644 $_reponame/crypt.awk "$pkgdir"/etc/runit/crypt.awk
}
