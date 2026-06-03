# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Anna <morganamilo@gmail.com>

pkgname=super-productivity-git
_name=super-productivity
pkgver=18.8.0.r82.gfcc421639
pkgrel=1
pkgdesc="An advanced todo list app with timeboxing and time tracking capabilities"
arch=('any')
url="https://super-productivity.com"
license=('MIT')
_electron=electron41
depends=('bash' $_electron 'hicolor-icon-theme')
makedepends=('cargo' 'nvm' 'git')
provides=($_name 'superproductivity')
conflicts=($_name 'superproductivity')
source=(
	"git+https://github.com/super-productivity/super-productivity"
	"$_name.desktop"
	"$_name.sh"
)
sha256sums=('SKIP'
            '195157267a8c6159a7ecbf47930431f46913d1e06edb96ed200e3a77f9e8ee45'
            '6d4e3f28b3be0530a473af6a6f6270045cc2c60cac8cf02a9a3bd43036ccd448')

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="$srcdir/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	_ensure_local_nvm

	sed -i "s/@ELECTRON@/$_electron/" $_name.sh

	cd $_name
	nvm install
}

pkgver() {
	cd $_name
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_ensure_local_nvm

	cd $_name
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	npm install
	npm run build
	npx electron-builder --linux --dir \
		--config.electronDist="/usr/lib/$_electron" \
		--config.electronVersion="$(cat /usr/lib/$_electron/version)"
}

package() {
	install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name"
	install -Dm644 $_name.desktop -t "$pkgdir/usr/share/applications/"

	cd $_name
	install -Dm644 .tmp/app-builds/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$_name/"
	for i in 16 32 48 64 128 256 512 1024; do
		install -Dm644 "build/icons/${i}x${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_name.png"
	done
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
