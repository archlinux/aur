# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
_gitname=marktext
pkgname=marktext-git
pkgver=r461.8399cbe
pkgrel=1
pkgdesc='Next generation markdown editor'
arch=('x86' 'x86_64')
url='https://marktext.github.io/website/'
license=('MIT')
depends=('gconf' 'gtk3' 'libxss' 'nss')
makedepends=('npm')
source=("git+https://github.com/${_gitname}/${_gitname}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    npm install --cache "${srcdir}/npm-cache"
    npm run release:linux
}

package() {
    cd "${srcdir}/${_gitname}"

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
