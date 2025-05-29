# Maintainer: Navin <navintiwari08@gmail.com>

_appname="stable-diffusion-webui"
_appprefix="/opt"
_appdataprefix="/var/opt"

pkgname="${_appname}"
pkgver=1.10.1
pkgrel=1
pkgdesc="Stable Diffusion Web UI (AUTOMATIC1111)"
arch=("x86_64")
url="https://github.com/AUTOMATIC1111/$_appname"
license=("AGPL3")
depends=("python311" "wget")
makedepends=("git")
optdepends=("xorg-xhost: GUI forwarding for remote access"
            "nvidia-utils: Required for CUDA")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "stable-diffusion-webui.service"
    "webui.conf"
)
noextract=("v1-5-pruned-emaonly.safetensors")
install="${pkgname}.install"
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

options=('!strip')  # Python scripts shouldn’t be stripped

package() {
    # Install systemd service
    install -Dm644 "$srcdir/stable-diffusion-webui.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"

    # Install default config
    install -d "$pkgdir/usr/share/${pkgname}"
    install -Dm644 "$srcdir/webui.conf" "$pkgdir/usr/share/${pkgname}/webui.conf"

    # Copy source to /opt
    install -d "$pkgdir${_appprefix}/${pkgname}"
    cp -R "$srcdir/${pkgname}/." "$pkgdir${_appprefix}/${pkgname}"
    rm -rf "$pkgdir${_appprefix}/${pkgname}/.git"

    # Fix permissions
    chmod 775 "$pkgdir${_appprefix}/${pkgname}"
    chmod -R u+rwX,go+r "$pkgdir${_appprefix}/${pkgname}"

    # Create empty data dir
    install -d "$pkgdir${_appdataprefix}/${pkgname}"
    chmod 775 "$pkgdir${_appdataprefix}/${pkgname}"
}

