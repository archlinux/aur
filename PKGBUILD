# Maintainer: Denis A. Altoé Falqueto
#
# Empacota o executável Linux publicado pelo CI no GitLab (Package Registry da versão),
# sem compilar nada. O binário é feito num Ubuntu 22.04 (glibc 2.35) e roda no Arch.
pkgname=projetor-missa-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Projeta os slides da missa (cantos em ODP/PPTX) a partir de um arquivo .missa, com editor visual"
arch=('x86_64')
url="https://gitlab.com/denisfalqueto/projetor-missa"
license=('MIT')
# Ligados ao executável (ldd) e abertos em tempo de execução pelo winit/glow (X11, Wayland, OpenGL).
depends=('glibc' 'gcc-libs' 'libxcb' 'libx11' 'libxcursor' 'libxrandr' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libglvnd' 'dbus'
         'hicolor-icon-theme'
         # Converte os ODP/PPTX em PDF (soffice): sem ele nada é projetado.
         # Tanto o libreoffice-fresh quanto o libreoffice-still oferecem 'libreoffice'.
         'libreoffice')
optdepends=('xdg-desktop-portal: janelas de abrir e salvar arquivos'
            'xdg-utils: botão "Abrir no Impress" do editor')
provides=('projetor-missa')
conflicts=('projetor-missa')
options=('!strip' '!debug')
_pacotes="https://gitlab.com/api/v4/projects/denisfalqueto%2Fprojetor-missa/packages/generic/projetor-missa/v${pkgver}"
# Na 1.5.0 o tar.gz ainda não traz o LICENSE nem o ícone: vêm da tag. A partir da versão
# seguinte eles estão dentro do tar.gz (projetor-missa/LICENSE e projetor-missa/icone.svg):
# tire as duas últimas fontes e os dois SKIP e use esses caminhos no package().
_raw="${url}/-/raw/v${pkgver}"
source=("projetor-missa-linux-x86_64-${pkgver}.tar.gz::${_pacotes}/projetor-missa-linux-x86_64.tar.gz"
        "LICENSE-${pkgver}::${_raw}/LICENSE"
        "icone-${pkgver}.svg::${_raw}/site/imagens/icone.svg")
# Atualize com `updpkgsums` depois de publicar a versão.
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

  # Os mesmos atalhos e o mesmo tipo .missa do packaging/instalar.sh, só que para o sistema todo.
  # Os hooks do pacman atualizam o banco de MIME, o de atalhos e o cache de ícones.
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/projetor-missa.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Projetor de Missa
Comment=Projeta os slides da missa
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
Name=Editor de Missa
Comment=Cria e altera os arquivos de missa do Projetor de Missa
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
    <comment>Missa do Projetor de Missa</comment>
    <sub-class-of type="application/yaml"/>
    <sub-class-of type="text/plain"/>
    <glob pattern="*.missa"/>
  </mime-type>
</mime-info>
MIME
}
