# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron25
_appname=insomnia
pkgname="$_appname-electron-bin"
_dirname="Insomnia.Core"
pkgver=2023.5.3
pkgrel=1
pkgdesc='Cross-platform HTTP and GraphQL Client'
arch=(any)
_repo=Kong/insomnia
url="https://github.com/$_repo"
license=('MIT')
depends=("$_electron")
makedepends=(asar libicns)
provides=("$_appname")
conflicts=("$_appname")
source=("$url/releases/download/core@$pkgver/$_dirname-$pkgver.tar.gz"
				"https://raw.githubusercontent.com/$_repo/core@$pkgver/LICENSE"
        "$_appname.sh"
				"$_appname.desktop")
b2sums=('665a8f6fa1eb8d5e3d064cf2a5ce4b1e5712885952c0acd9750fc6830420590e0d0276ef0ab3d5b3d38d213f4b5dc2d18709d79c9a6ae04cb5adbf83c1c4d2fa'
        'e6733afc6be4ad5349cfcebaad5644253b67f90ba940722fee181648f4c63a65fb7ce66115f6b14d6b60dcba420cab71d0b34c6e4ce1313bc7ac92f332c04313'
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
