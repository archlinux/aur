# Maintainer: SiHuaN <sihuan at sakuya dot love>

pkgname=startlive-git
_pkgname=startlive
pkgver=0.6.5.r11.geb42a13
pkgrel=1
pkgdesc="绕过B站直播姬获取推流地址"
arch=('any')
url="https://github.com/Radekyspec/StartLive"
license=('GPL-3.0-only')
depends=('python' 'pyside6' 'python-pillow' 'python-qrcode' 'python-requests'
         'python-pysocks' 'python-obsws' 'python-keyring' 'python-darkdetect'
         'python-pyqtdarktheme-fork')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/Radekyspec/StartLive.git")
sha256sums=('SKIP')
provides=('startlive')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_pkgname"
  sed -i 's|os.path.join("var", "log", "StartLive")|os.path.join(os.path.expanduser("~/.cache"), "StartLive", "logs")|g' models/log/__init__.py
}

package() {
  cd "$_pkgname"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$_pkgname/docs"
  cp -r docs/* "$pkgdir/usr/share/doc/$_pkgname/docs/"
  install -Dm644 docs/images/icon_left.png "$pkgdir/usr/share/pixmaps/startlive.png"

  rm -rf docs .github LICENSE README.md install-requirements.bat requirements.txt
  install -dm755 "$pkgdir/usr/share/startlive"
  cp -r . "$pkgdir/usr/share/startlive/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/startlive" <<'EOF'
#!/bin/sh
INSTALL_DIR="/usr/share/startlive"
ENTRY="StartLive.py"

cd "$INSTALL_DIR" || { echo "startlive: cannot cd $INSTALL_DIR" >&2; exit 1; }
exec python "$INSTALL_DIR/$ENTRY" "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/startlive.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=StartLive
Comment=绕过B站直播姬获取推流地址
Exec=startlive %u
Icon=startlive
Terminal=false
Categories=Network;Video;
Keywords=直播;rtmp;startlive;bilibili;
DESKTOP
}
