pkgname=walltone-git
_pkgname=walltone
pkgver=r40.gd20a29a
pkgrel=1
pkgdesc="Wallpaper and theme management application"
arch=("x86_64")
url="https://github.com/kasper24/walltone"
license=("GPL3")
depends=("nss" "libsecret" "swaybg" "mpvpaper" "linux-wallpaperengine" "cage" "grim" "wayland-utils")
makedepends=("npm" "nodejs" "git")
source=("$pkgname::git+$url.git#branch=dev")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    npm ci
    npm run package
}

package() {
    install -d -m755 "${pkgdir}/opt/${_pkgname}"
    install -d -m755 "${pkgdir}/usr/bin"
    install -d -m755 "${pkgdir}/usr/share/"{applications,pixmaps,licenses/${_pkgname}}

    cp -r "${srcdir}"/"${pkgname}"/out/Walltone-*/. "${pkgdir}/opt/${_pkgname}/"
    chmod -R a+rx "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/Walltone" "${pkgdir}/usr/bin/walltone"
    ln -s "/opt/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "$srcdir/${pkgname}/walltone.desktop" "${pkgdir}/usr/share/applications/walltone.desktop"
    install -Dm644 "$srcdir/${pkgname}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/walltone.png"
}
