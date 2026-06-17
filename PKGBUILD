# Maintainer: MrGodzilla38 <oyunustasigodzilla@gmail.com>
pkgname=rivalcfg-gui
pkgver=1.3.0
pkgrel=1
pkgdesc="GTK3 GUI configuration tool for SteelSeries mice (via rivalcfg)"
arch=('any')
url="https://github.com/MrGodzilla38/rivalcfg-gui"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'python-cairo')
optdepends=('rivalcfg: SteelSeries CLI tool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MrGodzilla38/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6da8c1ca01cdaebcdbe0bc11b4b7d7b381a2d1ed5c70d9798ce17fb010c502f1')

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
