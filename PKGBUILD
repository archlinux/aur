# Maintainer: KirTrub
pkgname=pyhotspot-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern GUI for Linux Hotspot management (PyQt6 + NetworkManager)"
arch=('any')
url="https://github.com/KirTrub/PyWiHotspot"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-qrcode' 'python-pillow' 'networkmanager' 'sh')
makedepends=('git')
provides=('pyhotspot')
conflicts=('pyhotspot')
source=('git+https://github.com/KirTrub/PyWiHotspot.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir/PyWiHotspot"
  
  install -d "$pkgdir/usr/share/pyhotspot"
  install -d "$pkgdir/usr/bin"
  
  cp -r core ui widgets "$pkgdir/usr/share/pyhotspot/"
  
  echo -e "#!/bin/sh\npython /usr/share/pyhotspot/core/main.py \"\$@\"" > "$pkgdir/usr/bin/pyhotspot"
  chmod +x "$pkgdir/usr/bin/pyhotspot"

  echo "[Desktop Entry]
Name=PyWiHotspot
Exec=pyhotspot
Icon=network-wireless
Terminal=false
Type=Application
Categories=Network;System;" > pyhotspot.desktop
  
  install -Dm644 pyhotspot.desktop "$pkgdir/usr/share/applications/pyhotspot.desktop"


    install -d "$pkgdir/usr/share/pyhotspot"
  cp -r core ui widgets "$pkgdir/usr/share/pyhotspot/"

  # 2. Создаем "запускалку" в /usr/bin/
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\nexec python /usr/share/pyhotspot/core/main.py \"\$@\"" > "$pkgdir/usr/bin/pyhotspot"
  
  # 3. Даем права на исполнение
  chmod +x "$pkgdir/usr/bin/pyhotspot"

  CURRENT_USER="${SUDO_USER:-$USER}"

echo "Настройка прав для пользователя: $CURRENT_USER"

sudo tee /etc/sudoers.d/pyhotspot > /dev/null << EOF
$CURRENT_USER ALL=(ALL) NOPASSWD: /usr/bin/nmcli
$CURRENT_USER ALL=(ALL) NOPASSWD: /usr/sbin/rfkill
$CURRENT_USER ALL=(ALL) NOPASSWD: /usr/sbin/sysctl -w net.ipv4.ip_forward=1
$CURRENT_USER ALL=(ALL) NOPASSWD: /bin/systemctl start NetworkManager
$CURRENT_USER ALL=(ALL) NOPASSWD: /bin/systemctl daemon-reload
$CURRENT_USER ALL=(ALL) NOPASSWD: /bin/systemctl enable pyhotspot.service
$CURRENT_USER ALL=(ALL) NOPASSWD: /bin/systemctl disable pyhotspot.service
$CURRENT_USER ALL=(ALL) NOPASSWD: /bin/rm -f /etc/systemd/system/pyhotspot.service
EOF

sudo chmod 440 /etc/sudoers.d/pyhotspot
sudo chown root:root /etc/sudoers.d/pyhotspot

if sudo visudo -c -f /etc/sudoers.d/pyhotspot; then
    echo "Права настроены успешно"
else
    echo "Ошибка в файле sudoers — удаляем"
    sudo rm /etc/sudoers.d/pyhotspot
    exit 1
fi
}