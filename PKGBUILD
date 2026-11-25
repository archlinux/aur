# Maintainer: Denis A. Altoé Falqueto
#
# Repackages the prebuilt Linux executable published by the GitLab CI (the release's Package
# Registry), without compiling anything. The binary is built on Ubuntu 22.04 (glibc 2.35) and
# runs on Arch.
pkgname=projetor-missa-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Projects Catholic Mass slides (ODP/PPTX song files) from a .missa file, with a visual editor (Portuguese UI)"
arch=('x86_64')
url="https://gitlab.com/denisfalqueto/projetor-missa"
license=('MIT')
# Linked by the executable (ldd) and loaded at runtime by winit/glow (X11, Wayland, OpenGL).
depends=('glibc' 'gcc-libs' 'libxcb' 'libx11' 'libxcursor' 'libxrandr' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libglvnd' 'dbus'
         'hicolor-icon-theme'
         # Converts the ODP/PPTX files to PDF (soffice): nothing can be projected without it.
         # Both libreoffice-fresh and libreoffice-still provide 'libreoffice'.
         'libreoffice')
optdepends=('xdg-desktop-portal: open and save file dialogs'
            'xdg-utils: "Abrir no Impress" (open in Impress) button in the editor')
provides=('projetor-missa')
conflicts=('projetor-missa')
options=('!strip' '!debug')
_packages="https://gitlab.com/api/v4/projects/denisfalqueto%2Fprojetor-missa/packages/generic/projetor-missa/v${pkgver}"
# The 1.5.0 tarball does not ship the LICENSE or the icon yet, so they come from the tag.
# From the next version on they are inside the tarball (projetor-missa/LICENSE and
# projetor-missa/icone.svg): drop the last two sources and checksums and use those paths in package().
_raw="${url}/-/raw/v${pkgver}"
source=("projetor-missa-linux-x86_64-${pkgver}.tar.gz::${_packages}/projetor-missa-linux-x86_64.tar.gz"
        "LICENSE-${pkgver}::${_raw}/LICENSE"
        "icone-${pkgver}.svg::${_raw}/site/imagens/icone.svg")
# Refresh with `updpkgsums` after publishing a new version.
sha256sums=('1cf6267837fb2f6e47771f665fd142fd83cd5de9d7cf6394a2c86fb1785e7bdb'
            '13e593b3091e033c99ce73387dc6d333160ac60c02a5ee54d1c984b6113ccbfe'
            'c34712e19ce4b032b6dc7165e14ebc122421f5154ae6bde517bc88b9d1b59454')

package() {
  cd "${srcdir}/projetor-missa"

  install -Dm755 projetor-missa "${pkgdir}/usr/bin/projetor-missa"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/projetor-missa/README.md"
  if [ -d docs ]; then
    cp -r docs "${pkgdir}/usr/share/doc/projetor-missa/"
    chmod -R u=rwX,go=rX "${pkgdir}/usr/share/doc/projetor-missa/docs"
  fi
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/icone-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/projetor-missa.svg"

  # Same launchers and .missa file type as packaging/instalar.sh, but system-wide.
  # The pacman hooks update the MIME database, the desktop database and the icon cache.
  # The app's interface is in Portuguese, so the launchers keep a pt_BR translation.
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/projetor-missa.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Mass Projector
Name[pt_BR]=Projetor de Missa
Comment=Projects the Mass slides
Comment[pt_BR]=Projeta os slides da missa
Exec=projetor-missa %f
Icon=projetor-missa
Terminal=false
Categories=Office;Presentation;
MimeType=application/x-projetor-missa;
StartupWMClass=projetor-missa
DESKTOP

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/projetor-missa-editor.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Mass Editor
Name[pt_BR]=Editor de Missa
Comment=Creates and edits the Mass files of the Mass Projector
Comment[pt_BR]=Cria e altera os arquivos de missa do Projetor de Missa
Exec=projetor-missa --editor %f
Icon=projetor-missa
Terminal=false
Categories=Office;Presentation;
MimeType=application/x-projetor-missa;
StartupWMClass=projetor-missa-editor
DESKTOP

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/mime/packages/projetor-missa.xml" <<MIME
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-projetor-missa">
    <comment>Mass Projector Mass file</comment>
    <comment xml:lang="pt_BR">Missa do Projetor de Missa</comment>
    <sub-class-of type="application/yaml"/>
    <sub-class-of type="text/plain"/>
    <glob pattern="*.missa"/>
  </mime-type>
</mime-info>
MIME
}
