# Maintainer: Thomas Hügel <thomas huegel -a-t- aquilenet fr>

pkgname=typedb-studio-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="TypeDB Studio: visual interactive environment for TypeDB databases (official binary)"
arch=('x86_64')
url="https://github.com/typedb/typedb-studio"
license=('MPL-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'libappindicator-gtk3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://repo.typedb.com/public/public-release/raw/names/typedb-studio-linux-x86_64/versions/${pkgver}/typedb-studio-linux-x86_64-${pkgver}.deb")
sha256sums=('373b7ebc7702773a71bc383607b1ccd8fbc7f7a1c7f82d7c57097d60cb638aba')

package() {
  # Extraire le .deb
  bsdtar -xf "typedb-studio-linux-x86_64-${pkgver}.deb" -C "${srcdir}"

  # Extraire le data.tar (xz ou gz selon la version)
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" || \
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # Corriger permissions
  chmod -R a+rX,u+w "${pkgdir}"

  # Le binaire principal est souvent dans /usr/bin/ ou /usr/lib/typedb-studio/
  # Vérifie après un premier makepkg (ou extrais manuellement) et ajuste si besoin
  # Exemple courant pour Tauri : /usr/bin/typedb-studio (symlink ou wrapper)

  # .desktop (généralement inclus dans le .deb, mais on le force au cas où)
  install -Dm644 "${pkgdir}/usr/share/applications/typedb-studio.desktop" \
    "${pkgdir}/usr/share/applications/typedb-studio.desktop" || true

  if [[ ! -f "${pkgdir}/usr/share/applications/typedb-studio.desktop" ]]; then
    install -Dm644 /dev/null "${pkgdir}/usr/share/applications/typedb-studio.desktop"
    cat > "${pkgdir}/usr/share/applications/typedb-studio.desktop" << EOF
[Desktop Entry]
Name=TypeDB Studio
Exec=typedb-studio %U
Icon=typedb-studio
Type=Application
Categories=Development;Database;
Terminal=false
StartupWMClass=typedb-studio
EOF
  fi

  # Icône (souvent extraite automatiquement, sinon ajoute dans source=() un .png depuis GitHub)
}