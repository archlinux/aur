# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=7.1.210
pkgrel=2
_mpris_ver=2.1.5
# Commit hash for aunetx/deezer-linux for patches
_patch_commit=9cbe22284685c09d0c41f7f4d68fdb64fb4382aa
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom')
depends=('electron41' 'hicolor-icon-theme')
provides=('deezer')
makedepends=('p7zip' 'asar' 'imagemagick' 'npm')
source=("$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact-win32-x86-$pkgver"
    "$pkgname-desktop.desktop"
    "deezer-desktop"
    "prettierrc.json"
    "LICENSE"
    "mpris-service-${_mpris_ver}.tgz::https://registry.npmjs.org/@jellybrick/mpris-service/-/mpris-service-${_mpris_ver}.tgz"
    # Upstream patches from aunetx/deezer-linux
    "01-start-in-tray-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/01-start-in-tray.patch"
    "02-start-without-tray-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/02-start-without-tray.patch"
    "03-disable-auto-updater-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/03-disable-auto-updater.patch"
    "04-remove-os-information-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/04-remove-os-information.patch"
    "05-provide-metadata-mpris-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/05-provide-metadata-mpris.patch"
    "06-control-log-level-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/06-control-log-level.patch"
    "07-improve-responsiveness-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/07-improve-responsiveness.patch"
    "08-hide-offline-banner-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/08-hide-offline-banner.patch"
    "09-disable-animations-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/09-disable-animations.patch"
    "10-disable-notifications-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/10-disable-notifications.patch"
    "11-fix-thumbar-actions-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/11-fix-thumbar-actions.patch"
    "12-adjust-volume-on-wheel-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/12-adjust-volume-on-wheel.patch"
    "13-disable-hardware-acceleration-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/13-disable-hardware-acceleration.patch"

    # Local patches
    "99-systray-icon.patch"
)
sha256sums=('567fe009f67f5249fdef81d1f6555b9a45daf81c93863f1fcb12987c92a257d1'
            'c33b398d8ae279a620cf2914c806f7ee00c47519e4f404874cfd90a68fc8d80f'
            '3a23339b7b00d5d6d59768699f585d2565fc1cd7d2c43a254206de3840546eb6'
            '951c80c9dc4848b31a5fcc9655b005f3a218b1ff735396168c13922ac658c83b'
            'fe9bab50ef433516105ed2f2c349736c0be87c2f75f8d18bf1f011b2115019c1'
            '181016c614fc62595d604d336cdb43c40645d7cc66a35acaf562c9af26177a6e'
            '10f35e6f22e051203310dd98a821edbabf5dc4cc23af1d44146ea9be9496db80'
            '171fd58d2eed2ea90ae0a50e867625203c9042e65ab9c9ce07c5e3ad3e6754bb'
            'd0c246522cdf5c253f7a0583097337ef8c03c558b129f28d4fe29ee26eaacb01'
            'a5cda0227476a21f10cb98e6ccde1e53b8dbdfcfdf3a05eb0838f2562bbe4ace'
            'd2bb57eb4ee458e6c310392a6dbb0fa2ca4d14b9011025968b2c52554de5f31f'
            '44161a21b3aced9d4f6e78bbad0ecca48568fc083283dcffc63a4af050275741'
            'f8af7fe9b406b945f23e3a52b68ac5e9d04ecfef99930c20c591daa01766c2b2'
            'fdc2b1b89c8692608e5a824d29a59d96fda5900113c4fb86f692dfc2c12512fa'
            '2ca84b1a545be3934e00f0432239b45550f1eb84770131be2d78d0d794fad99c'
            '19bf25afb50807b3e5ce7ceb9b9fa93a0e0760c18a783788a9cb0cdd91f330d3'
            '593eaa17fae1360ebd2ace36c4760ac7ef8bb6696db9e1d70983d916f5c69f6e'
            '3ffd80a16d5c30875a12093faec92881f2c004b0bf49e9ba79f70b0f199c7bbd'
            '02f8fb4b8101d7a856cdd82ef17a54bb4de02adcc1de89c5ec7d8bfd9293d65d'
            '2362c52147cf67759388ba6685e2add32c5bcfcdbdbca8e0990f58cafa0392de')

prepare() {
    # Extract app from installer
    7z x -so $pkgname-$pkgver-setup.exe "\$PLUGINSDIR/app-32.7z" >app-32.7z
    # Extract app archive
    7z x -y -bsp0 -bso0 app-32.7z

    # Extract png from ico container
    magick resources/win/app.ico resources/win/deezer-%d.png

    # Install Prettier in the build root
    npm install --no-save --prefix "$srcdir" prettier@3.5.3

    cd resources/
    asar extract app.asar app

    cd "$srcdir/resources/app"
    mkdir -p resources/linux/
    for size in 24 48; do
	    magick "$srcdir/resources/win/deezer-8.png" -resize "${size}x${size}" -strip \
            -define png:compression-filter=5 -define png:compression-level=9 \
            "resources/linux/systray-${size}.png"
    done

    cp "$srcdir/prettierrc.json" .prettierrc
    "$srcdir/node_modules/.bin/prettier" --write "build/*.{js,html}"

    local src
    for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch ${src}..."
      patch -Np1 -l -F3 < "${srcdir}/${src}"
    done

    # Install mpris from verified local tarball
    npm install --no-save "$srcdir/mpris-service-${_mpris_ver}.tgz"

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
        chmod 644 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/deezer-desktop.png"
    done

    install -Dm644 resources/app.asar "$pkgdir/usr/share/deezer/"
    install -Dm644 "$pkgname-desktop.desktop" "$pkgdir/usr/share/applications/"
    install -Dm755 deezer-desktop "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
