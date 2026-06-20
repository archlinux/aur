# Maintainer: MrGodzilla38 <oyunustasigodzilla@gmail.com>
pkgname=rivalcfg-gui
pkgver=1.4.0
pkgrel=2
pkgdesc="GTK3 GUI configuration tool for SteelSeries mice (via rivalcfg)"
arch=('any')
url="https://github.com/MrGodzilla38/rivalcfg-gui"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'python-cairo' 'rivalcfg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MrGodzilla38/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4f87b1e61d31f3d3aaa6eb104ba95be58e895d5717c4d5b31f7c45f6a6a47b8')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install application files (ALL project files including locale, images, Python files, etc.)
    install -d "${pkgdir}/usr/share/${pkgname}"

    # Copy all project files, excluding only build/CI directories
    rsync -a --exclude='dist/' --exclude='.git/' --exclude='.github/' --exclude='__pycache__/' --exclude='*.pyc' \
      ./ "${pkgdir}/usr/share/${pkgname}/"

    chmod 755 "${pkgdir}/usr/share/${pkgname}/rivalcfg_gui.py"

    # Create symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/rivalcfg_gui.py" "${pkgdir}/usr/bin/${pkgname}"

    # Create desktop entry
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=RivalCFG GUI
Comment=SteelSeries mouse configuration tool
Exec=/usr/share/${pkgname}/rivalcfg_gui.py
Icon=/usr/share/${pkgname}/logo.png
Terminal=false
Categories=Utility;Settings;
StartupWMClass=rivalcfg_gui.py
EOF
}
