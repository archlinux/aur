# Maintainer: Rafael Just <rafaeljust@proton.me>
pkgname="sunshine-virt-display-git"
pkgver=r71.03de048
pkgrel=1
pkgdesc="A script to dynamically create virtual displays for Sunshine game streaming on Linux using EDID overrides."
arch=('any')
url="https://github.com/frostplexx/sunshine_virt_display"
license=("MIT")
depends=('python' 'python-jeepney')
makedepends=('git' 'rsync')
source=('sunshine_virt_display::git+https://github.com/frostplexx/sunshine_virt_display.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sunshine_virt_display"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/sunshine_virt_display"
    install -d "$pkgdir/opt/sunshine-vd"
    rsync -a \
        --exclude='.git' \
        --exclude='__pycache__' \
        --exclude='*.pyc' \
        --exclude='.coverage' \
        --exclude='custom_edid.bin' \
        --exclude='virt_display.state' \
        --exclude='install.sh' \
        . "$pkgdir/opt/sunshine-vd"

    # Systemd service
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -m 644 src/daemon/sunshineVD.service -t "$pkgdir/usr/lib/systemd/system/"

    #Install license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    # Notify user
    echo "Please enable the new SunshineVD.service with \"systemctl enable --now sunshineVD.service\""
    echo "Also view the github page for additional configuration on Sunshine's end: https://github.com/frostplexx/sunshine_virt_display"
}
