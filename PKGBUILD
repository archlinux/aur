pkgname=gnome-shell-extension-screen-autorotate
pkgver=24.1
_pkgver=24
pkgrel=1
pkgdesc="A GNOME extension to auto-rotate screen regardless of touch mode"
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate-git")
source=("$pkgname-${_pkgver}.tar.gz::$url/archive/v${_pkgver}.tar.gz"
        "0001-Add-GNOME-48-supported.patch"
        )
sha256sums=('1ea2469b5d87af792435806b5d200549cf63c0df453c6c7483360e2ab0cfeb6b'
            'db0d51bf2d955c9a1bd8857df2351131a1a216619b34ca961127b6490dfb110d')

_uuid="screen-rotate@shyzus.github.io"

prepare() {
    source_dir="$srcdir/$pkgname-${_pkgver}"
    cd "$source_dir"
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"

        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

package() {

  source_dir="$srcdir/$pkgname-${_pkgver}/$_uuid"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm755 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" "${source_dir}"/*.*

  install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "${source_dir}/schemas"/*.xml

}