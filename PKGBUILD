# Maintainer: pioner14
pkgname=cerastilo
pkgver=0.2.1
pkgrel=1
pkgdesc="Scheduler for the Life and Ministry meeting: assignments, letters, export (PySide6)"
arch=('any')
url="https://github.com/pioner14/Cerastilo"
license=('LicenseRef-Cerastilo')
depends=(
  'python'
  'pyside6'
  'python-sqlalchemy'
  'python-alembic'
  'python-pillow'
  'python-requests'
  'python-beautifulsoup4'
  'python-lxml'
  'python-docx'
  'python-openpyxl'
  'hicolor-icon-theme'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pioner14/Cerastilo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5c680ebfdfa5c56bb4b0e1c4c8bd4f825c03488955e6c4c04f7ab555a6098c2')

package() {
  cd "$srcdir"/*-"$pkgver" || return 1

  local app="$pkgdir/usr/share/$pkgname"
  install -d "$app" "$app/docs"
  cp -r main.py core ui modules migrations alembic.ini assets "$app/"
  install -Dm644 scripts/import_emails_from_xlsx.py "$app/scripts/import_emails_from_xlsx.py"
  cp -r docs/help "$app/docs/"
  install -m644 PT_Sans-Narrow-Web-*.ttf "$app/"

  # без кэша и ненужных файлов
  find "$app" -name '__pycache__' -type d -prune -exec rm -rf {} +
  rm -f "$app"/assets/icon.ico

  python -m compileall -q -d "/usr/share/$pkgname" "$app"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cerastilo"
mkdir -p "$DATA_DIR"
export DB_PATH="$DATA_DIR/scheduler.db"
# обновления приходят через AUR — автопроверку в программе по умолчанию выключаем
export CERASTILO_UPDATE_CHECK_DEFAULT="${CERASTILO_UPDATE_CHECK_DEFAULT:-off}"
cd "$DATA_DIR" || exit 1
exec python /usr/share/cerastilo/main.py "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Name=Cerastilo
GenericName=Планировщик собраний
Comment=Расписание встречи «Жизнь и служение»: назначения, письма, экспорт
Exec=cerastilo
Icon=cerastilo
Terminal=false
Type=Application
Categories=Office;
StartupWMClass=cerastilo
EOF

  install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 assets/icon-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 assets/favicon-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
