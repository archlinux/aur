# Maintainer: Carlos Daniel Robaina Rivero <orlando260501@gmail.com>
pkgname=subhunter
pkgver=1.1.0
pkgrel=2
pkgdesc="Automatic subtitle downloader for movies and TV series (GUI)"
arch=('any')
url="https://github.com/Hyzokaaa/SubHunter"
license=('MIT')
depends=('python' 'tk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hyzokaaa/SubHunter/archive/refs/tags/v$pkgver.tar.gz"
        "0001-linux-icon-fix.patch")
sha256sums=('336369eb830325ff1134a2bbf7eb054809f434e719e7cec6029ab275d366981c'
            '0c20f46d40ba330ed39baf7336de99a816e40f3c947a0c227e2a19cbb1b19f99')

prepare() {
  cd "$srcdir/SubHunter-$pkgver"

  # Upstream pyproject.toml has no setuptools package-discovery config,
  # so `pip install .` fails: flat-layout discovery sees assets/ as a
  # second top-level package and refuses to build. Reported upstream;
  # drop this once fixed there.
  cat >> pyproject.toml <<'EOF'

[tool.setuptools.packages.find]
include = ["subhunter*"]
EOF

  # icon.ico is Windows-only for Tk's iconbitmap; on Linux it raises
  # TclError and the app never starts. Switch to icon.png via iconphoto
  # on non-Windows platforms. Reported upstream; drop once fixed there.
  patch -p1 < "$srcdir/0001-linux-icon-fix.patch"
}

package() {
  cd "$srcdir/SubHunter-$pkgver"

  local venv="$pkgdir/opt/$pkgname/venv"
  python -m venv --symlinks "$venv"
  "$venv/bin/pip" install --no-cache-dir --upgrade pip
  "$venv/bin/pip" install --no-cache-dir .

  # pip bakes the build-time staging path ($pkgdir/opt/...) into the
  # shebang of the generated launcher script, which doesn't exist once
  # installed. Point it at the real runtime path instead.
  sed -i "1s|^#!.*|#!/opt/$pkgname/venv/bin/python|" "$venv/bin/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/venv/bin/subhunter" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=SubHunter
Comment=Automatic subtitle downloader for movies and TV series
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=AudioVideo;Video;Utility;
EOF
}
