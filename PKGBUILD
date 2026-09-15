# Maintainer: Christian Macht <christian dot macht at gmail dot com>
# Contributor: Robert Ulmer <arch.x(at)frontexpers.com>
# Contributor: Adam Jedlička <adajedlicka@gmail.com>

pkgname=filius
pkgver=2.14.0
pkgrel=1
pkgdesc="Network simulation program for education"
arch=('any')
url="http://www.lernsoftware-filius.de"
license=('GPL-2.0-only' 'GPL-3.0-only')
depends=('java-runtime>=17')
source=(
  "http://www.lernsoftware-filius.de/downloads/Setup/${pkgname}-${pkgver}.zip"
  'filius.png'  # 128x128 icon
)
sha256sums=('9b691f995821810428f6f430a2badf7dffea9e7281ef55b42641894749294b9e'
            'faa27deb74b220033294338001b0ffbf5a999756773d0222d4582c4e9d1eea2e')

prepare() {
  rm -f Filius.exe Filius.command
}

package() {
  # Program
  install -Dm644 -t "$pkgdir/usr/share/filius" filius.jar
  install -Dm755 -t "$pkgdir/usr/share/filius" filius.sh
  cp -r config hilfe img lib tmpl "$pkgdir/usr/share/filius/"

  # Normalise permissions from zip file
  find "$pkgdir/usr/share/filius" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/filius" -type f ! -name 'filius.sh' -exec chmod 644 {} +

  # Documentation and licences
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    Changelog.md Einfuehrung_Filius.pdf Introduction_Filius.pdf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" GPLv2.txt GPLv3.txt

  # Launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/filius" <<'EOF'
#!/usr/bin/env sh
[ -n "${WAYLAND_DISPLAY}" ] && export _JAVA_AWT_WM_NONREPARENTING=1
exec /usr/share/filius/filius.sh "$@"
EOF

  # Icon
  install -Dm644 "$srcdir/filius.png" "$pkgdir/usr/share/pixmaps/filius.png"

  # MIME type
  install -Dm644 /dev/stdin "$pkgdir/usr/share/mime/packages/filius.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-filius">
    <comment>Filius file</comment>
    <comment xml:lang="de">Filius-Datei</comment>
    <icon name="filius"/>
    <glob-deleteall/>
    <glob pattern="*.fls"/>
  </mime-type>
</mime-info>
EOF

  # Desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/filius.desktop" <<'EOF'
[Desktop Entry]
Name=Filius
Comment=Learn how computer networks are built
Comment[de]=Lernsoftware zu Rechnernetzen
Exec=filius %U
Icon=filius
Terminal=false
Type=Application
Categories=Education;Network;
StartupNotify=false
StartupWMClass=filius-Main
MimeType=application/x-filius;
EOF
}

# vim:set ts=2 sw=2 et:
