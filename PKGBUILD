# Maintainer: Magnus Groß - For email contact info see email of respective AUR commits
pkgname=veloren-nightly-bin
_pkgver=0.13.0
pkgver=0.13.0.20220811
pkgrel=1
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url='https://veloren.net/'
license=('GPL3')
depends=('alsa-lib' 'glslang' 'libxkbcommon-x11' 'pulseaudio-alsa' 'vulkan-icd-loader')
makedepends=(curl unzip)
provides=("$pkgname" 'veloren')
conflicts=(veloren-git veloren veloren-nightly)
source=('voxygen-wrapper.sh'
	'server-cli-wrapper.sh')
sha512sums=('e35c852bfa8d80a78a4df50c09246e69431efe9ebc208bd3c2a864e7674ee1078ab0d2eb2b2ffc1b67847ab7125a38dd260d8964054f55cdf0305248ece9a11c'
            'a1ec4d3590af0f07be59c22de3de9402e7ed20eff7fb2b086773f04e8019a607a843a9ba0cf59df48431a5d9a3eb1d0c79272dced9a812c11ae7ed52e41bb0d2')
download_url='https://download.veloren.net/latest/linux/x86_64/nightly'

pkgver() {
	cd "$srcdir"
	binary_version="$(./veloren-server-cli --version)"
	printf "$_pkgver." && printf "$binary_version" | grep -Eo '[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}' | sed 's/-//g'
}

prepare() {
	cd "$srcdir"
	curl -L "$download_url" -o veloren.zip
	unzip -q -o veloren.zip
}

package() {
	install -D "$srcdir/veloren-voxygen" -T "$pkgdir/usr/lib/veloren/voxygen"
	install -D "$srcdir/voxygen-wrapper.sh" -T "$pkgdir/usr/bin/veloren-voxygen"
	install -D "$srcdir/veloren-server-cli" -T "$pkgdir/usr/lib/veloren/server-cli"
	install -D "$srcdir/server-cli-wrapper.sh" -T "$pkgdir/usr/bin/veloren-server-cli"
	mkdir -p "$pkgdir/usr/share/veloren"
	cp -a "$srcdir/assets" "$pkgdir/usr/share/veloren/"
	install -Dm 644 "$srcdir/assets/voxygen/net.veloren.veloren.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm 644 "$srcdir/assets/voxygen/net.veloren.veloren.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm 644 "$srcdir/assets/voxygen/net.veloren.veloren.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
}
