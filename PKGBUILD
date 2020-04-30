# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=gnome-shell-extension-cast-to-tv
pkgdesc="Cast files to your Chromecast or other devices over local network"
_gnomeextensionname="cast-to-tv@rafostar.github.com"

url="https://github.com/Rafostar/$pkgname"
arch=("x86_64")
license=("GPL2")

pkgver=15
pkgrel=1

depends=(
    "gnome-shell"
    "ffmpeg"
    "nodejs"
)
optdepends=(
    "python-nautilus: Nautilus integration"
)
makedepends=(
    "npm"
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Rafostar/$pkgname/archive/v$pkgver.tar.gz"
    "install_node_modules.patch"
)
sha256sums=(
    "d6cfb02291d8b6edc4b65b59006606bf052aceb0c43843ec654f528a2d4fdaf3"
    "b24fa4e6b04cae500ec267345ac48f9c92452e0d9ad798ac28132984387b98cc"
)

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input "${srcdir}/install_node_modules.patch"
}

package() {
    cd "${pkgname}-${pkgver}"

    npm install --cache "${srcdir}/npm-cache"

    make install PKGDIR="${pkgdir}"

    install \
        -Ddm755 \
        "${pkgdir}/usr/share/locale"
    cp \
        -aR \
        locale/* \
        "${pkgdir}/usr/share/locale/"

    install \
        -Dm644 \
        "README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install \
        -Dm644 \
        "schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml"

    install \
        -Dm644 \
        nautilus/nautilus-cast-to-tv.py \
        "${pkgdir}/usr/share/nautilus-python/extensions/nautilus-cast-to-tv.py"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
