# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=7.1.60
pkgrel=3
_mpris_ver=2.1.5
# Commit hash for aunetx/deezer-linux for patches
_patch_commit=74e5c3e2638c00039242d10d466480fb835f0cd4
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom')
depends=('electron39' 'hicolor-icon-theme')
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
sha256sums=('91ca528326494e88529a45d29943f67dbd9b482a3b9caacf66ac886dcf1d705c'
            '41a32f7e595a52c260aa872e8273430d83e4c5fcc8e529e21afa4dab3d6b1d9c'
            '3da0c64c3d9216286601e0a28714e37a4bfaf9f56f35856da75986dfa2eba8fb'
            '951c80c9dc4848b31a5fcc9655b005f3a218b1ff735396168c13922ac658c83b'
            'fe9bab50ef433516105ed2f2c349736c0be87c2f75f8d18bf1f011b2115019c1'
            '181016c614fc62595d604d336cdb43c40645d7cc66a35acaf562c9af26177a6e'
            '0d0034a367fb4e70849b604a2ab35d5ced0dccb67ad16c231783acfc9b8f64ee'
            'a369f25a29b43112cb80873d8e1691a66ea1273fd13507d1e698223bb6233a2b'
            '77eee637ad6f2571169a72f2dda125e004f4ed8471e4de71d7d0175772600cde'
            'a5cda0227476a21f10cb98e6ccde1e53b8dbdfcfdf3a05eb0838f2562bbe4ace'
            '693ead502f9a59ef907aa5a9bfd972069a521b9f3256ec9fe8bda4d46f6c5934'
            'a95a35315d00c353be2aae8cacaab22283377bb0d3177a22c18c220b8f5ece69'
            'd1fe858c87e1d8f36c16b8ce185052e182196e06174f27f9ce5112762282d3d8'
            '81543bb13c0977890c634f8ac150a451a509fc5acecaf1ab6a2abfa50493617d'
            '70daf38a2c14b13e7e1f374ff4ab9220f4e356148eeaf5d9b08b104aaaed0e91'
            'ab25994396bc15cd375ee243c3adffee62202381f45808ceee8a67c149f82fb1'
            '6681e628769fe2267a976d25f07036fe8e6dbc4f59b301d9d7533848fc53dc7b'
            '3ffd80a16d5c30875a12093faec92881f2c004b0bf49e9ba79f70b0f199c7bbd'
            'b061e0eae99322c15e55839c45d86783e64c9851f1ec4608810ade4280503ee5'
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
    done

    install -Dm644 resources/app.asar "$pkgdir/usr/share/deezer/"
    install -Dm644 "$pkgname-desktop.desktop" "$pkgdir/usr/share/applications/"
    install -Dm755 deezer-desktop "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
