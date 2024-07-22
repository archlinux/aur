# Maintainer: Keiran <keiran0@proton.me>
pkgname=e-zshot
pkgver=1.1.3
pkgrel=1
pkgdesc="CLI to automate taking screenshots and uploading them to e-z.host"
arch=('any')
url="https://github.com/RobinTT69/e-z-screenshot-linux"
license=('custom')
depends=('python-virtualenv' 'python-pyqt5' 'python-pillow' 'python-requests')
source=("https://github.com/RobinTT69/e-z-screenshot-linux/releases/download/v${pkgver}/e-zshot-${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  tar xzf "e-zshot-${pkgver}.tar.gz"
}

package() {
  cd "$srcdir"

  # Create target directories
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  # Install Python scripts
  install -Dm755 e-z-flameshot.py "$pkgdir/usr/share/$pkgname/e-z-flameshot.py"
  install -Dm755 e-z-grim.py "$pkgdir/usr/share/$pkgname/e-z-grim.py"

  # Create a virtual environment in the package directory
  python -m venv "$pkgdir/usr/share/$pkgname/venv"

  # Activate the virtual environment
  source "$pkgdir/usr/share/$pkgname/venv/bin/activate"

  # Install the required Python modules
  pip install pillow pyqt5 requests

  # Deactivate the virtual environment
  deactivate

  # Create wrapper script for e-z-grim
  cat << EOF > "$pkgdir/usr/bin/e-z-grim"
#!/bin/bash

VENV_PATH="/usr/share/e-zshot/venv"
source "$VENV_PATH/bin/activate"
python /usr/share/e-zshot/e-z-grim.py "\$@"
deactivate
EOF

  # Set the wrapper script as executable
  chmod +x "$pkgdir/usr/bin/e-z-grim"

  # Create wrapper script for e-z-flameshot
  cat << EOF > "$pkgdir/usr/bin/e-z-flameshot"
#!/bin/bash

VENV_PATH="/usr/share/e-zshot/venv"
source "$VENV_PATH/bin/activate"
python /usr/share/e-zshot/e-z-flameshot.py "\$@"
deactivate
EOF

  # Set the wrapper script as executable
  chmod +x "$pkgdir/usr/bin/e-z-flameshot"

  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/e-zshot/README.md"

  # Install fonts
  install -Dm644 fonts/impact.ttf "$pkgdir/usr/share/fonts/impact.ttf"
}
