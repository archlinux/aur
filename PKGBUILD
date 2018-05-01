# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=marktext
pkgver=0.10.21
pkgrel=1
pkgdesc='Next generation markdown editor'
arch=('x86' 'x86_64')
url='https://marktext.github.io/website/'
license=('MIT')
depends=('gconf' 'gtk3' 'libxss' 'nss')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('2f6d22b69d6f1ea0ff002cd3d1dc7f3ec1f3ab6e44ef5aeb2801fc052ea4320715205d2e4c5dfbc3870c975d9fef6789572a2c04246b6977e7ec72d014d7e5b1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --cache "${srcdir}/npm-cache"
    npm run release:linux
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D "build/linux-unpacked/snapshot_blob.bin" "$pkgdir/usr/lib/$pkgname/snapshot_blob.bin"
    install -D "build/linux-unpacked/content_resources_200_percent.pak" "$pkgdir/usr/lib/$pkgname/content_resources_200_percent.pak"
    install -D "build/linux-unpacked/content_shell.pak" "$pkgdir/usr/lib/$pkgname/content_shell.pak"
    install -D "build/linux-unpacked/icudtl.dat" "$pkgdir/usr/lib/$pkgname/icudtl.dat"
    install -D "build/linux-unpacked/libffmpeg.so" "$pkgdir/usr/lib/$pkgname/libffmpeg.so"
    install -D "build/linux-unpacked/libnode.so" "$pkgdir/usr/lib/$pkgname/libnode.so"
    cp -r "build/linux-unpacked/locales" "$pkgdir/usr/lib/$pkgname/locales"
    install -D "build/linux-unpacked/marktext" "$pkgdir/usr/lib/$pkgname/marktext"
    install -D "build/linux-unpacked/natives_blob.bin" "$pkgdir/usr/lib/$pkgname/natives_blob.bin"
    install -D "build/linux-unpacked/pdf_viewer_resources.pak" "$pkgdir/usr/lib/$pkgname/pdf_viewer_resources.pak"
    cp -r "build/linux-unpacked/resources" "$pkgdir/usr/lib/$pkgname/resources"
    install -D "build/linux-unpacked/ui_resources_200_percent.pak" "$pkgdir/usr/lib/$pkgname/ui_resources_200_percent.pak"
    install -D "build/linux-unpacked/blink_image_resources_200_percent.pak" "$pkgdir/usr/lib/$pkgname/blink_image_resources_200_percent.pak"
    install -D "build/linux-unpacked/views_resources_200_percent.pak" "$pkgdir/usr/lib/$pkgname/views_resources_200_percent.pak"

    # Symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install license file
    install -D LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -D build/linux-unpacked/LICENSE.electron.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -D build/linux-unpacked/LICENSES.chromium.html "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

# vim:ts=4:sw=4:expandtab
