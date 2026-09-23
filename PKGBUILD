# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=visage
pkgname="$_pkgbase-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc='Linux face authentication via PAM with persistent daemon, IR camera support, ONNX inference'
arch=('x86_64')
url='https://sovren.software/#/visage'
license=('MIT')
depends=('gcc-libs' 'glibc' 'pam' 'dbus' 'systemd')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install='setup.install'
_raw="https://raw.githubusercontent.com/sovren-software/$_pkgbase/v$pkgver"
source=("visage-has-session-$pkgver::$_raw/contrib/pam/visage-has-session"
        "pam-README-$pkgver.md::$_raw/contrib/pam/README.md")
source_x86_64=("$_pkgbase-$pkgver.deb::https://github.com/sovren-software/$_pkgbase/releases/download/v$pkgver/${_pkgbase}_$pkgver-1_amd64.deb")
sha256sums=('a393b963e544df241f77fbfa31a1166460467ad7d489493b646d171247ef1284'
            '08b05fa763a75069a901fbb4e3546579b7e23634569c09306a3f9427a1567b06')
sha256sums_x86_64=('565b57f1bc0cc87031b7cdbed3e68c41c1223fb422485474a0939dbebb351139')

prepare() {
	bsdtar -xf "$_pkgbase-$pkgver.deb"
}

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"
	install -Dm0644 "$pkgdir/usr/share/doc/$_pkgbase/copyright" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
	install -Dm755 "visage-has-session-$pkgver" "$pkgdir/usr/lib/visage/visage-has-session"
	install -Dm644 "pam-README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgbase/pam/README.md"
	sed -i -e 's|/usr/local/libexec/visage-has-session|/usr/lib/visage/visage-has-session|g' \
		-e 's|^sudo install .*|# The visage package already installs this helper.|' \
		"$pkgdir/usr/share/doc/$_pkgbase/pam/README.md"
	install -dm700 "$pkgdir/var/lib/visage/models"
	rm -rf "$pkgdir/usr/share/pam-configs"
}
