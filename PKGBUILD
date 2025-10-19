# Maintainer: Laurent <ton.email@exemple.com>

pkgname=gnome-icon-theme-gartoon-redux
pkgver=1.11
pkgrel=1
pkgdesc="Cartoon-style SVG icon theme based on Gartoon (from Ubuntu package)"
arch=('any')
url="https://launchpad.net/gartoon-redux"
license=('GPL2')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
source=("https://archive.ubuntu.com/ubuntu/pool/universe/g/gartoon-redux/${pkgname}_${pkgver}-0ubuntu1_all.deb")
sha256sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/deb"
  # Extraire le .deb
  bsdtar -xf "${pkgname}_${pkgver}-0ubuntu1_all.deb" -C "$srcdir/deb"
  # Extraire le contenu data.tar.* dans deb/
  cd "$srcdir/deb"
  data_archive=$(find . -type f -name 'data.tar.*')
  bsdtar -xf "$data_archive" -C "$srcdir/deb"
}

package() {
  cd "$srcdir/deb"

  # Trouver automatiquement le dossier d’icônes
  themedir=$(find usr/share/icons -maxdepth 1 -type d ! -path 'usr/share/icons' | head -n 1)
  if [ -z "$themedir" ]; then
    echo "❌ Aucun thème trouvé dans usr/share/icons"
    exit 1
  fi

  install -dm755 "$pkgdir/usr/share/icons/GartoonRedux"
  cp -a "$themedir/." "$pkgdir/usr/share/icons/GartoonRedux/"

  find "$pkgdir/usr/share/icons/GartoonRedux" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/icons/GartoonRedux" -type f -exec chmod 644 {} \;

  install -Dm755 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/gtk-icon-cache-gartoon-redux.hook" <<'EOF'
[Trigger]
Type = File
Operation = Install
Operation = Upgrade
Operation = Remove
Target = usr/share/icons/GartoonRedux/*

[Action]
Description = Updating icon cache for GartoonRedux...
When = PostTransaction
Exec = /usr/bin/gtk-update-icon-cache -q -t -f /usr/share/icons/GartoonRedux
EOF
}

