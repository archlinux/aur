# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.6 (Alibaba).

pkgname=pachub
pkgver=2.0
pkgrel=1
pkgdesc="A powerful Pacman/AUR front end using GTK4 and libadwaita"
arch=('any')
url="https://github.com/mrks1469/PacHub"
license=('GPL3')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject')
optdepends=('yay: AUR support' 'paru: AUR support')
options=('!strip')

_tag="Pachub_2.0"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrks1469/PacHub/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('00e662bf012ae93e639693f6a3de006609968a4260e1f2880fb944ef0ac4a876')

package() {
    cd "${srcdir}/PacHub-${_tag}"

    local app_name="pachub"
    local data_dir="/usr/share/${app_name}"
    local icon_id="io.github.mrks1469.pachub"

    # Install Python modules
    install -d "${pkgdir}${data_dir}"
    for f in app.py backend.py dialogs.py models.py styles.py window.py; do
        install -m 644 "${f}" "${pkgdir}${data_dir}/${f}"
    done

    # Install icon
    install -Dm644 "${icon_id}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${icon_id}.svg"

    # Create launcher
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${app_name}" <<EOF
#!/usr/bin/env bash
export PYTHONPATH="${data_dir}:\${PYTHONPATH:-}"
exec python3 "${data_dir}/app.py" "\$@"
EOF

    # Create desktop entry
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/${icon_id}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=PacHub
GenericName=Package Manager
Comment=A powerful Pacman/AUR front end
Exec=/usr/bin/${app_name}
Icon=${icon_id}
Categories=System;PackageManager;
Keywords=pacman;aur;packages;arch;
Terminal=false
StartupWMClass=pachub
EOF
}
