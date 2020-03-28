# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=gnome-shell-extension-cast-to-tv-git
pkgdesc="Cast files to your Chromecast or other devices over local network"
_gnomeextensionname="cast-to-tv@rafostar.github.com"

url="https://github.com/Rafostar/$pkgname"
arch=("x86_64")
license=("GPL")

pkgver=v12.r33.g1483c4e
pkgrel=1

provides=("gnome-shell-extension-cast-to-tv")
conflicts=("gnome-shell-extension-cast-to-tv")

depends=(
    "gnome-shell"
    "ffmpeg"
    "nodejs"
)
optdepends=(
  "python-nautilus: Nautilus integration"
)
makedepends=(
    "git"
    "npm"
)

source=(
    "${pkgname}::git+https://github.com/Rafostar/gnome-shell-extension-cast-to-tv.git"
    "install_node_modules.patch"
)
sha256sums=(
    "SKIP"
    "b24fa4e6b04cae500ec267345ac48f9c92452e0d9ad798ac28132984387b98cc"
)

pkgver() {
  cd "${pkgname}"
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    patch --forward --strip=1 --input "${srcdir}/install_node_modules.patch"
}

package() {
    cd "${pkgname}"

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
        "schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml"

    install \
        -Dm644 \
        nautilus/nautilus-cast-to-tv.py \
        "$pkgdir/usr/share/nautilus-python/extensions/nautilus-cast-to-tv.py"
}
