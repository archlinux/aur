# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
_basename=dbd-icon-toolbox
_nodeversion=14
pkgname="$_basename-git"
pkgver=2.8.4.r0.g7d83022
pkgrel=1
pkgdesc="Application for browsing/installing custom Dead by Daylight Perks/Icons/Char Portraits"
arch=(x86_64)
url=https://github.com/nrcrast/DbdPerkTool
license=(MIT)
groups=()
depends=()
makedepends=(git yarn nvm)
provides=("$_basename")
conflicts=("$_basename")
source=("$pkgname::git+https://github.com/nrcrast/DbdPerkTool.git"
        Dead-by-Daylight-Icon-Toolbox.desktop
        linux-support.patch
        16x16.png
        32x32.png
        48x48.png
        64x64.png
        128x128.png
        256x256.png)
sha256sums=('SKIP'
            'cea0d489bf7840398ab3c9ca12f6025055798c029da4b00061daaddae54e3365'
            '31e4d9908c8ee4b378fdb15093b33015cd5f3e4028a510fb6b3858ed10a579ca'
            '1779077f3baa180f06c10d243072483e41195926d7a6deae39f2227c1d067205'
            '63558e3f9b4b461c873cb7f692a12ef45ed755e80818bcdae5b6982cf40bbbc6'
            '561cb8dd13bcd7f3c3b2a715dac96cdd2115c2cb095010d19bb268fc19bf733e'
            'd047b05d8b6de32a3c519028083c9124e20da052ac1dad938cc077f1fe33d3e7'
            'c7fcdcf453d37aa4f1bd6a349ee0e36de13792be25aa982ae16810cbeb5c95ae'
            '36bd5df3142bcb0c335768f9b0ed192371086316d497b892324e839d839addfd')

pkgver() {
	cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
    export npm_config_cache="$srcdir/npm_cache"
    _ensure_local_nvm
    nvm install $_nodeversion

    patch -p1 < "$srcdir"/linux-support.patch
    # Copy png icons
    for i in 16 32 48 64 128 256; do
        cp "$srcdir"/${i}x${i}.png resources
    done
}

build() {
	cd "$srcdir/$pkgname"

    _ensure_local_nvm
    nvm use $_nodeversion
    yarn
    yarn package-linux --dir
}

package() {
	cd "$srcdir/$pkgname"

    install -d "$pkgdir"/usr/lib/$_basename

    cp -r release/linux-unpacked/. "$pkgdir"/usr/lib/$_basename

    install -Dm644 ../Dead-by-Daylight-Icon-Toolbox.desktop -t "$pkgdir"/usr/share/applications/ 

    # Icons
    install -Dm644 resources/256x256.png "$pkgdir"/usr/share/icons/hicolor/scalable/apps/dbdicontoolbox.png
    for i in 16 32 48 64 128 256; do
        install -Dm644 resources/${i}x${i}.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/dbdicontoolbox.png
    done
}

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}
