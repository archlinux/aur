# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=7.1.20
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2025 Deezer S.A."')
depends=('electron38' 'hicolor-icon-theme')
provides=('deezer')
makedepends=('p7zip' 'asar' 'prettier>=3.0.0' 'imagemagick' 'npm')
source=("$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact-win32-x86-$pkgver"
    "$pkgname-desktop.desktop"
    "deezer-desktop"
    "01-start-hidden-in-tray.patch"
    "02-avoid-change-default-texthtml-mime-type.patch"
    "03-quit.patch"
    "04-disable-auto-updater.patch"
    "05-remove-os-information.patch"
	"06-better-management-of-MPRIS.patch"
	"07-log-level-environment-variable.patch"
	"08-additional-metadata.patch"
    "10-improve-responsiveness.patch"
    "11-hide-appoffline-banner.patch"
    "12-disable-animations.patch"
    "13-disable-notifications.patch"
    "14-thumbar-actions.patch"
    "15-systray-icon.patch")
sha256sums=('48ab73820fe92b66bf610aba82a0df907a089e5028426c2ee8125486fbc9dbee'
            '41a32f7e595a52c260aa872e8273430d83e4c5fcc8e529e21afa4dab3d6b1d9c'
            '14b4b2b553b66e2cf0e45bc7274679dd06bdb891f04f2aa3be7afa96eb84101e'
            '87aba4442321bb80da0847ab555cecf0f421ab3fccc42306f094070021819a7f'
            'b8d18bd684cf608d81668aaa5350e7dfd15ef397d63cf1eef4b0a53208345849'
            '876bed64728d655224b8d226d110d63e40da0d98c2b851a1897560c7b56e943a'
            '64fcd827c29ddbecdb231f45058d5fd0ae9420f183378d2b4203d1490b40a84e'
            '049fccb9969159b5381eb53c592213d758dee1e3e0ee02303be09bb2669d0313'
            'e3ce50a99a94cf01bb16726333fd0c9c70c8fab94cf24be46e4b4c0dd30eaaed'
            '72a57ac93f35e7c3f5dfc9e6f1a5c2ac1eebb156ca62df9a1e644688f0ba1e3f'
            'ee4beb6f49658576696963ab51e277195e74dbcb1381b5f8c9251bc85b3a6d78'
            'd681ec92a3f4409fe61734b09ad0ec5a2aa98fb67e9bc969afd94c2c733d213c'
            '75e27255a2a48fa981b973e2441c35937bcfa682d80a58fd83975ab8c7800156'
            'd22ae848e1e7cf118a0bd092455d24fdb4ef7cd25fa77fb59d04ef7e2f1e6961'
            'e6331b834cff306cec941e16e137787c306b2b0383aeceaec669c028b1ad6dd5'
            '905b30b07698bb104fd2051e12e8ef9accac04bac79d6d3603e888bf797ae7f1'
            'ab7f65e4af1a52d899ba01c3042a1b49a29dec976dae93f17f8f6c4067991c04')

prepare() {
    # Extract app from installer
    7z x -so $pkgname-$pkgver-setup.exe "\$PLUGINSDIR/app-32.7z" >app-32.7z
    # Extract app archive
    7z x -y -bsp0 -bso0 app-32.7z

    # Extract png from ico container
    magick resources/win/app.ico resources/win/deezer-%d.png

    cd resources/
    asar extract app.asar app

    cd "$srcdir/resources/app"
    mkdir -p resources/linux/
    for size in 24 48; do
	    magick "$srcdir/resources/win/deezer-8.png" -resize "${size}x${size}" -strip \
            -define png:compression-filter=5 -define png:compression-level=9 \
            "resources/linux/systray-${size}.png"
    done

    prettier --write "build/*.{js,html}"

    local src
    for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch ${src}..."
      patch -Np1 -l -F3 < "${srcdir}/${src}"
    done

    npm install "@jellybrick/mpris-service"

    cd "$srcdir/resources/"
    asar pack app app.asar
}

package() {
    mkdir -p "$pkgdir/usr/share/deezer"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin/"
    for size in 16 22 24 32 48 64 128 256 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        magick resources/win/deezer-8.png -resize "${size}x${size}" -strip \
            -define png:compression-filter=5 -define png:compression-level=9 \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/deezer-desktop.png"
    done

    install -Dm644 resources/app.asar "$pkgdir/usr/share/deezer/"
    install -Dm644 "$pkgname-desktop.desktop" "$pkgdir/usr/share/applications/"
    install -Dm755 deezer-desktop "$pkgdir/usr/bin/"
}
