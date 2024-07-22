# Maintainer: Keiran <keiran0@proton.me>
pkgname=e-zshot
pkgver=1.1.2
pkgrel=1
pkgdesc="CLI to automate taking screenshots and uploading them to e-z.host"
arch=('any')
url="https://github.com/RobinTT69/e-z-screenshot-linux"
license=('custom')
depends=('python-virtualenv' 'python-pyqt5' 'python-pillow' 'python-requests')  # Add additional system-level dependencies if needed
source=("https://github.com/RobinTT69/e-z-screenshot-linux/releases/download/v${pkgver}/e-zshot-${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  tar xzf e-zshot-${pkgver}.tar.gz
}

package() {
  cd "$srcdir"

  install -Dm755 e-z-flameshot.py "$pkgdir/usr/share/$pkgname/e-z-flameshot.py"
  install -Dm755 e-z-grim.py "$pkgdir/usr/share/$pkgname/e-z-grim.py"

  python -m venv "$pkgdir/usr/share/$pkgname/venv"

  source "$pkgdir/usr/share/$pkgname/venv/bin/activate"

  pip install pillow requests pyqt5

  deactivate

  cat << 'EOF' > "$pkgdir/usr/bin/e-z-grim"
#!/bin/bash

VENV_PATH="/usr/share/e-zshot/venv"

source "$VENV_PATH/bin/activate"

python /usr/share/e-zshot/e-z-grim.py "$@"

deactivate
EOF

  chmod +x "$pkgdir/usr/bin/e-z-grim"

  cat << 'EOF' > "$pkgdir/usr/bin/e-z-flameshot"
#!/bin/bash

VENV_PATH="/usr/share/e-zshot/venv"

source "$VENV_PATH/bin/activate"

python /usr/share/e-zshot/e-z-flameshot.py "$@"

deactivate
EOF

  chmod +x "$pkgdir/usr/bin/e-z-flameshot"

  install -Dm644 README.md "$pkgdir/usr/share/doc/e-zshot/README.md"
  install -Dm644 fonts/impact.ttf "$pkgdir/usr/share/fonts/impact.ttf"
}
