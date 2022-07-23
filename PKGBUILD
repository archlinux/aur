# Maintainer: JaydenDev <jdev0894@gmail.com>

pkgname=gnome-shell-extension-background-logo-git
_name=background-logo-extension
pkgver=42.0+0095b25
pkgrel=1
pkgdesc="GNOME Shell extension to overlay a logo over the default background"
arch=(any)
url="https://pagure.io/background-logo-extension"
depends=('gnome-shell')
source=(git+${url} 'archlinux-wm-gnome.svg')
sha256sums=('SKIP' 'ae3223dab86d51ed54ac22c0518102bcd965fe0576839a038e559301cf94cc2c')
license=(GPL3)
makedepends=(git meson)

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson background-logo-extension build
  ninja -C build
}

package() {
    cd "${srcdir}/${_name}"
    sed -i "s@/usr/share/fedora-logos/fedora_lightbackground.svg@/usr/share/archlinux-logos/archlinux_lightbackground.svg@g" schemas/org.fedorahosted.background-logo-extension.gschema.xml
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 "${srcdir}"/archlinux-wm-gnome.svg $pkgdir/usr/share/archlinux-logos/archlinux_lightbackground.svg
}
