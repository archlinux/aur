# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron38
_appname=insomnia
pkgname="$_appname-electron-bin"
_dirname="Insomnia.Core"
epoch=1
pkgver=12.0.0 # renovate: datasource=github-tags depName=Kong/insomnia extractVersion=^core@(?<version>(?:[^2].*|2(?:$|[^0].*)|20(?:$|[^2].*)|202(?:$|[^0-3].*|[0-3](?:$|[^.].*))))
pkgrel=1
pkgdesc='Cross-platform HTTP and GraphQL Client'
#arch=('x86_64' 'aarch64')
arch=('x86_64')
_repo=Kong/insomnia
url="https://github.com/$_repo"
license=('Apache-2.0')
depends=("$_electron")
makedepends=(asar libicns)
provides=("$_appname")
conflicts=("$_appname")
source=("https://raw.githubusercontent.com/$_repo/core@$pkgver/LICENSE"
        "$_appname.sh"
				"$_appname.desktop")
source_x86_64=("$url/releases/download/core@$pkgver/$_dirname-$pkgver.tar.gz")
#source_aarch64=("$url/releases/download/core@$pkgver/$_dirname-$pkgver-arm64.tar.gz")
b2sums=('f80a889547df667636d5b177cf98dbc66dece9263aa8da57003223d38ffad9e5ff24c0dde35e29a60bb41a1069e802a910314ae3711fe41594a0d3b6cb259ff2'
        'fc24b3075490bfed6f56aba46b33b50edcc9ead95e00d8209d38ed052f5d3514ea789a13c51eb1cf7d53807f6aa171c833222122634bfff6edc5c5f7936f1eff'
        'd7f795312b38ccd63cdc9a9333a5cdb3d1271b07d6855bc10c4711e143f0a30bd819cda931d99ed0090536ffa84b551a8d134299f614506b0e344c15afe19f6c')
b2sums_x86_64=('8c042bb20fad41f96188ace2b11d8ea39edffb152cea57a7bb23a31417f6e9b2c7b2372c806c50c904d6197f97da0af8d3de4860db72fa5f7ac81d4bfe3440fb')
#b2sums_aarch64=('7309729d4f504d21bee83cd6bd2dd83858078e76075126df61ba0f4466e091611d200bfa051bf81f2a31e79ade1184948ae8d3ff0fac1faa3a2e84e9b427b485')

prepare() {
	cd "$srcdir"
	sed -i "s~@ELECTRON@~$_electron~" "$_appname.sh"
}

package() {
	install -Dm755 "$_appname.sh" "$pkgdir/usr/bin/$_appname"
	install -Dm644 "$_appname.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	if [[ $CARCH == 'x86_64' ]]; then
		cd "$_dirname-$pkgver"
	elif [[ $CARCH == 'aarch64' ]]; then
		cd "$_dirname-$pkgver-arm64"
	else
		echo "Unsupported architecture: $CARCH"
		exit 1
	fi

	# Fix file permissions in resources dir
	find resources -type f -exec chmod 644 {} \;

	install -d "$pkgdir/usr/lib/$_appname"
	cp -r "resources/." "$pkgdir/usr/lib/$_appname"

  asar ef resources/app.asar icon.icns
  icns2png -x icon.icns
  install -Dm644 icon_512x512x32.png "$pkgdir/usr/share/pixmaps/$_appname.png"
}
