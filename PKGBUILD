# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: redponike <proton (dot) me>
# Contributor: Dogwen <lyw182 at outlook dot com>
# Contributor: Mete Tikici <metetikici at protonmail dot com>
# Contributor: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Benjamin Wilhelm <aur@hedgehogcode.de>
# Package Creator: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname=knime-desktop
_upstream_name="knime"
pkgver=5.12.0
pkgrel=1
pkgdesc="A user-friendly graphical workbench for the entire data analysis process"
url="http://www.knime.org/"
license=('custom')
arch=('x86_64')

conflicts=("${_upstream_name}")
provides=("${_upstream_name}")

depends=('java-runtime>=21' 'bash' 'python' 'gtk3' 'libxtst')
makedepends=('binutils' 'fakeroot' 'imagemagick')

optdepends=('r: Required for R-scriptable nodes'
            'firefox: External browser support'
            'webkit2gtk-4.1: Required for displaying HTML content')
options=('!emptydirs')

source=("https://download.knime.org/analytics-platform/linux/${_upstream_name}_${pkgver}.linux.gtk.${arch}.tar.gz")
sha256sums=('1a13f21310059cfbf272d4f24c7fa86c473ebee350cfecd7798c10d97db94fab')

prepare() {
    # Updated wrapper script for Wayland compatibility and file path migration.
    cat > knime.sh <<EOF
#!/bin/bash
KNIME_HOME="/opt/knime-desktop"
export ECLIPSE_HOME="\$KNIME_HOME"

# Wayland fix here
if [ -z "\$GDK_BACKEND" ]; then
    if [ "\$XDG_SESSION_TYPE" == "wayland" ]; then
        export GDK_BACKEND=x11
    fi
fi

#For the file path
USER_CONF_DIR="\$HOME/.config/knime-desktop"
mkdir -p "\$USER_CONF_DIR"

exec "\$KNIME_HOME/knime" \
  -configuration "\$USER_CONF_DIR/configuration" \
  -data "\$HOME/knime-workspace" \
  "\$@"
EOF

    # Generate the Desktop Entry
    cat > knime-desktop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=KNIME Analytics Platform
Comment=A user-friendly graphical workbench for the entire data analysis process.
Exec=/usr/bin/knime-desktop %F
Icon=knime-desktop
Terminal=false
Categories=Development;Education;Science;DataVisualization;
MimeType=application/x-knime-workflow;
EOF
}

package() {
    # Changed the installation directory to suit the norms better
    local installpath="/opt"
    local programpath="${installpath}/${pkgname}"
    local bin="${pkgdir}/usr/bin"
    local share="${pkgdir}/usr/share"

    local _source_dir="${srcdir}/${_upstream_name}_${pkgver}"

    install -d -m755 "${pkgdir}/${installpath}"
    mkdir -p "${pkgdir}/${programpath}"
    cp -r "${_source_dir}/." "${pkgdir}/${programpath}"

    install -D -m755 "knime.sh" "${bin}/${pkgname}"
    install -d -m755 "${share}/pixmaps"

    # convert is deprecated apparently
    magick "${_source_dir}/icon.xpm" "${share}/pixmaps/${pkgname}.png"

    install -D -m644 "knime-desktop.desktop" "${share}/applications/${pkgname}.desktop"
    install -d -m755 "${share}/licenses/${pkgname}"
    install -m644 "${_source_dir}/LICENSE"* "${share}/licenses/${pkgname}/"

    # Ownership shall fix permission issues with extension installation
    chown -R root:users "${pkgdir}/${programpath}"
    chmod -R g+w "${pkgdir}/${programpath}"
}
