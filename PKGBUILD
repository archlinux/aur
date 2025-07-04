# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=not1mm-9m2pju-git
_pkgname=not1mm
pkgver=r2188.05119a4
pkgrel=1
pkgdesc="Ham Radio Contest Logger - Blatant ripoff of N1MM - Git version (uses Python venv)"
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('GPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-virtualenv')
depends=('bash')
optdepends=('hamlib' 'flrig')
provides=('not1mm')
conflicts=('not1mm' 'not1mm-git')
source=("$_pkgname::git+$url.git"
        "$pkgname.install")
install="$pkgname.install"
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir/$_pkgname"

  python -m venv venv
  source venv/bin/activate
  python -m pip install --upgrade pip
  python -m pip install .
  deactivate
}

package() {
  cd "$srcdir/$_pkgname"

  # Install to /opt
  install -d "$pkgdir/opt/$_pkgname"
  cp -a venv "$pkgdir/opt/$_pkgname/venv"

  # Symlink launcher
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/not1mm" <<EOF
#!/bin/bash
source /opt/$_pkgname/venv/bin/activate
exec python -m not1mm "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/not1mm"

  # Desktop integration
  install -Dm644 "not1mm/data/k6gte-not1mm.desktop" "$pkgdir/usr/share/applications/k6gte-not1mm.desktop"
  install -Dm644 "not1mm/data/k6gte.not1mm-128.png" "$pkgdir/usr/share/pixmaps/k6gte-not1mm.png"
}
