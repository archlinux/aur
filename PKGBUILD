# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=tf2cdownloader-git
_pkgname=tf2cdownloader
pkgver=r162.84ebd28
pkgrel=1
pkgdesc="Open Fortress's quick-n-easy downloading solution"
arch=("x86_64")
url="https://github.com/tf2classic/TF2CDownloader"
license=('GPL3')
depends=("python-pyzstd" "python-rich" "python-tqdm" "python-httpx")
makedepends=("pyinstaller")
provides=("tf2cdownloader")
conflicts=("tf2cdownloader")
install=tf2cdownloader-git.install
source=("git+$url.git"
		"tmp.patch::https://patch-diff.githubusercontent.com/raw/tf2classic/TF2CDownloader/pull/44.patch"
		"tf2cdownloader")
sha256sums=('SKIP'
            '6b89833010dbe0300a1bb473a891f3b033bf8277912ef980d6a78a026ec2eeb7'
            '0e4d597a3af9eef5b930f374f5ffe2dda54831b2c2a2b6c75e594d20662c00f3')
pkgver() {
  cd "TF2CDownloader"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/TF2CDownloader"
	patch -p1 < "$srcdir/tmp.patch"
}

build() {
	cd "$srcdir/TF2CDownloader"
	pyinstaller tf2c_downloader.spec
}

package() {
	cd "$srcdir/TF2CDownloader"
	install -Dm755 "$srcdir/TF2CDownloader/dist/tf2c_downloader" "$pkgdir/usr/share/tf2cdownloader/tf2cdownloader"
	install -Dm755 "$srcdir/tf2cdownloader" "$pkgdir/usr/bin/tf2cdownloader"
}
