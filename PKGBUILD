pkgname=legion-gui
pkgver=0.5.2.r0.4a662fb
pkgrel=3
pkgdesc="Legion GUI (Sparta successor), ported from Kali Linux for Arch Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/legion"
license=('GPL3')
backup=('etc/legion.conf')
depends=('python' 'polkit' 'nmap' 'xterm' 'xdg-utils' 'python-colorama' 'python-pandas' 'python-pyfiglet' 'python-pyqt6' 'python-qasync' 'python-requests' 'python-rich' 'python-service-identity' 'python-six' 'python-sqlalchemy' 'python-termcolor' 'python-urllib3')
optdepends=('nikto: web server scanning actions' 'whatweb: web fingerprinting actions' 'smtp-user-enum-git: SMTP enumeration actions' 'eyewitness: webpage screenshots')
makedepends=('git' 'patch' 'perl')
source=('git+https://gitlab.com/kalilinux/packages/legion.git#branch=kali/master' 'legion-gui.desktop' 'legion-gui-launcher')
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/legion"

  patch -Np1 -i debian/patches/use-python3-shebang.patch
  patch -Np1 -i debian/patches/fix-paths.patch
  patch -Np1 -i debian/patches/Remove-rwho-usage.patch
  patch -Np1 -i debian/patches/Fix-sqlalchemy.exc.ArgumentError.patch
  patch -Np1 -i debian/patches/fix-pyexploitdb-import.patch
  patch -Np1 -i debian/patches/fix-typo-in-ssh-user-list.patch

  sed -i 's|^texteditor-path=.*|texteditor-path=/usr/bin/xdg-open|' legion.conf
  sed -i "s|smtp-user-enum -M|smtp-user-enum.pl -M|" legion.conf
  perl -0pi -e 's/from pyShodan import PyShodan\n/try:\n    from pyShodan import PyShodan\nexcept ImportError:\n    PyShodan = None\n/' scripts/python/pyShodan.py
  perl -0pi -e 's/        try:\n            pyShodanObj = PyShodan\(\)\n/        try:\n            if PyShodan is None:\n                print("pyShodan module not installed.")\n                return {}\n            pyShodanObj = PyShodan()\n/' scripts/python/pyShodan.py
}

package() {
  cd "$srcdir/legion"

  install -d "$pkgdir/usr/share/legion"
  cp -a app controller db images parsers scripts ui utilities wordlists "$pkgdir/usr/share/legion/"
  install -m644 CHANGELOG.txt "$pkgdir/usr/share/legion/CHANGELOG.txt"
  install -m644 LICENSE "$pkgdir/usr/share/legion/LICENSE"
  install -m644 legion.py "$pkgdir/usr/share/legion/legion.py"
  install -m644 nmap.xsl "$pkgdir/usr/share/legion/nmap.xsl"

  install -Dm644 legion.conf "$pkgdir/etc/legion.conf"
  ln -sf /etc/legion.conf "$pkgdir/usr/share/legion/legion.conf"

  install -Dm755 "$srcdir/legion-gui-launcher" "$pkgdir/usr/bin/legion-gui"
  install -Dm644 "$srcdir/legion-gui.desktop" "$pkgdir/usr/share/applications/legion-gui.desktop"
  install -Dm644 images/icons/Legion-N_128x128.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/legion-gui.svg"

  chmod 755 "$pkgdir/usr/share/legion/scripts/"* 2>/dev/null || true
  find "$pkgdir/usr/share/legion" -type d -name '__pycache__' -prune -exec rm -rf {} + 2>/dev/null || true
  find "$pkgdir/usr/share/legion" -type f -name '*.pyc' -delete 2>/dev/null || true
}
