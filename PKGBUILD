# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=nickvision-money-git
_pkgname=nickvisionmoney
_pkgid=org.nickvision.money
pkgver=2023.1.0.beta1.r8.ge218ffa
pkgrel=1
pkgdesc="A personal finance manager"
arch=('aarch64' 'armv7h' 'x86_64' 'i686')
url=https://github.com/nlogozzo/$_pkgname
license=('GPL3')
depends=('dotnet-runtime' 'libadwaita')
makedepends=('dotnet-sdk' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url)
b2sums=(SKIP)

if [ "$CARCH" = x86_64 ]; then
	_arch=x64
elif [ "$CARCH" = i686 ]; then
	_arch=x86
elif [ "$CARCH" = aarch64 ]; then
        _arch=arm64
elif [ "$CARCH" = armv7h ]; then
        _arch=arm
fi

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname/NickvisionMoney.GNOME
	desktop-file-edit --set-key='Exec' --set-value="/usr/bin/$_pkgid" $_pkgid.desktop
}

build() {
	cd $_pkgname
	dotnet build NickvisionMoney.GNOME -a $_arch
	glib-compile-resources NickvisionMoney.GNOME/Resources/$_pkgid.gresource.xml
}

package() {
	cd $_pkgname/NickvisionMoney.Shared/Resources
	find . \( -name "$_pkgid*" ! -name "*symbolic*" \) -exec install -Dm644 "{}" "$pkgdir/usr/share/icons/hicolor/scalable/apps/{}" \;
	find . -name "*-symbolic.svg" -exec install -Dm644 "{}" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/{}" \;
	cd ../../NickvisionMoney.GNOME
	install -Dm644 Resources/$_pkgid.gresource -t "$pkgdir"/usr/share/$_pkgid
	install -Dm775 $_pkgid.desktop -t "$pkgdir"/usr/share/applications
	install -Dm644 $_pkgid.metainfo.xml -t "$pkgdir"/usr/share/metainfo
	dotnet publish --no-build -o "$pkgdir"/usr/share/$_pkgid -a $_arch
	mkdir "$pkgdir"/usr/bin
	ln -s /usr/share/$_pkgid/NickvisionMoney.GNOME "$pkgdir"/usr/bin/$_pkgid
}
