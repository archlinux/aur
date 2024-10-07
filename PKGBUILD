# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron31
_appname=insomnia
pkgname="$_appname-electron-bin"
_dirname="Insomnia.Core"
epoch=1
pkgver=10.0.0
pkgrel=2
pkgdesc='Cross-platform HTTP and GraphQL Client'
arch=(any)
_repo=Kong/insomnia
url="https://github.com/$_repo"
license=('Apache-2.0')
depends=("$_electron")
makedepends=(asar libicns)
provides=("$_appname")
conflicts=("$_appname")
source=("$url/releases/download/core@$pkgver/$_dirname-$pkgver.tar.gz"
				"https://raw.githubusercontent.com/$_repo/core@$pkgver/LICENSE"
        "$_appname.sh"
				"$_appname.desktop")
b2sums=('4b91deb30d1936f4d1e3e7ef9bba8d69164470476909bff1ab784a0c96a409231bc17d22c45e27b94f9aad6f1658cb15522137f7c9e5efc292e1c47f5fa1cf23'
        'f80a889547df667636d5b177cf98dbc66dece9263aa8da57003223d38ffad9e5ff24c0dde35e29a60bb41a1069e802a910314ae3711fe41594a0d3b6cb259ff2'
        'fc24b3075490bfed6f56aba46b33b50edcc9ead95e00d8209d38ed052f5d3514ea789a13c51eb1cf7d53807f6aa171c833222122634bfff6edc5c5f7936f1eff'
        'd7f795312b38ccd63cdc9a9333a5cdb3d1271b07d6855bc10c4711e143f0a30bd819cda931d99ed0090536ffa84b551a8d134299f614506b0e344c15afe19f6c')

prepare() {
	cd "$srcdir"
	sed -i "s~@ELECTRON@~$_electron~" "$_appname.sh"
}

package() {
	install -Dm755 "$_appname.sh" "$pkgdir/usr/bin/$_appname"
	install -Dm644 "$_appname.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	cd "$_dirname-$pkgver"

	# Fix file permissions in resources dir
	find resources -type f -exec chmod 644 {} \;

	install -d "$pkgdir/usr/lib/$_appname"
	cp -r "resources/." "$pkgdir/usr/lib/$_appname"

  asar ef resources/app.asar icon.icns
  icns2png -x icon.icns
  install -Dm644 icon_512x512x32.png "$pkgdir/usr/share/pixmaps/$_appname.png"
}
