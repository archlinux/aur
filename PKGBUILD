# Maintainer: Lev Lybin <lev.lybin at gmail dot com>
# Maintainer: Maksym Sheremet <msheremet at sheremets dot com>

pkgname=upwork
pkgver=5.3.3.871
_rawver=${pkgver//./_}
_hashver='51d563431f844aff'
pkgrel=3
pkgdesc='Desktop Application'
arch=(x86_64)
url='https://www.upwork.com/downloads/'
license=(custom)
conflicts=(upwork-alpha)
depends=(gtk3 libxss nss)
source=(https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb
	LICENSE
	upwork)
sha256sums=('53a8cf15610563475e45127522f230f4fcfdc7b70cf915e3d573845bad0c19fd'
            '793d8d7bc0f088c48798bda3d5483972636c6b8c5dcd9aeaf85411f7d4547b38'
            '8b9006e78723394776518847a8dd7f45eb797b51514359727d0fe3e3207e9452')

prepare() {
    tar -xJf data.tar.xz
}

package() {
    # Base
    install -dm755 $pkgdir/opt/$pkgname
    cp -dr --no-preserve=ownership opt/upwork/* $pkgdir/opt/$pkgname/

    # Code ref: https://github.com/electron-userland/electron-builder/blob/master/packages/app-builder-lib/templates/linux/after-install.tpl
    # SUID chrome-sandbox for Electron 5+
    test -e $pkgdir/opt/$pkgname/chrome-sandbox && chmod 4755 $pkgdir/opt/$pkgname/chrome-sandbox || true

    # Exec
    install -dm755 $pkgdir/usr/bin/
    install -Dm755 upwork $pkgdir/usr/bin/

    # Menu
    install -Dm644 usr/share/applications/upwork.desktop $pkgdir/usr/share/applications/$pkgname.desktop

    # Icons
    for size in 16 32 48 64 128 256 512 1024; do
	install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/upwork.png" \
		"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done

    # License
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
