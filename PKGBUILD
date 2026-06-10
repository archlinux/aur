# Maintainer: lordhanya <ashifrahman8638471722@gmail.com>

pkgname=iris
pkgver=1.0.0
pkgrel=1
pkgdesc="Infrared Recognition & Identity System - password-less face unlock for SDDM on Thinkpad IR cameras"
arch=('x86_64')
url="https://github.com/lordhanya/iris"
license=('MIT')
depends=(
  'python'
  'python-dlib'
  'python-opencv'
  'python-numpy'
  'v4l-utils'
  'linux-enable-ir-emitter'
)
install=iris.install
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/lordhanya/iris/archive/v$pkgver.tar.gz"
  "face_recognition_models-0.3.0.tar.gz::https://files.pythonhosted.org/packages/source/f/face_recognition_models/face_recognition_models-0.3.0.tar.gz"
)
sha256sums=(
  '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
  'SKIP'
)

package() {
  cd "$srcdir"

  INSTALL_DIR="/usr/share/iris"

  # Create install directories
  install -dm755 "$pkgdir$INSTALL_DIR"/{cli,core,scripts,docs,models}

  # Extract dlib model files from face_recognition_models
  tar xzf face_recognition_models-0.3.0.tar.gz -C "$srcdir"
  cp "$srcdir"/face_recognition_models-0.3.0/face_recognition_models/models/*.dat \
    "$pkgdir$INSTALL_DIR/models/"

  # Install Python modules
  cd "$srcdir/iris-$pkgver"
  install -Dm644 core/*.py "$pkgdir$INSTALL_DIR/core/"
  install -Dm644 cli/*.py "$pkgdir$INSTALL_DIR/cli/"
  install -Dm644 config.example.ini "$pkgdir$INSTALL_DIR/config.example.ini"
  install -Dm644 LICENSE "$pkgdir$INSTALL_DIR/LICENSE"
  install -Dm644 README.md "$pkgdir$INSTALL_DIR/README.md"

  # Install scripts with corrected paths
  for script in scripts/*.sh; do
    sed 's|/home/ashif_dev/Desktop/face-auth-system|'"$INSTALL_DIR"'|g' "$script" > \
      "$pkgdir$INSTALL_DIR/$script"
    chmod 755 "$pkgdir$INSTALL_DIR/$script"
  done

  # Install docs
  install -Dm644 docs/*.md "$pkgdir$INSTALL_DIR/docs/"

  # Convenience wrappers
  install -dm755 "$pkgdir/usr/bin"

  echo '#!/bin/bash
exec python3 /usr/share/iris/cli/enroll.py "$@"' > "$pkgdir/usr/bin/iris-enroll"
  chmod 755 "$pkgdir/usr/bin/iris-enroll"

  echo '#!/bin/bash
exec python3 /usr/share/iris/cli/auth.py "$@"' > "$pkgdir/usr/bin/iris-auth"
  chmod 755 "$pkgdir/usr/bin/iris-auth"

  echo '#!/bin/bash
exec /usr/share/iris/scripts/emergency-disable.sh' > "$pkgdir/usr/bin/iris-disable"
  chmod 755 "$pkgdir/usr/bin/iris-disable"

  echo '#!/bin/bash
exec /usr/share/iris/scripts/emergency-enable.sh' > "$pkgdir/usr/bin/iris-enable"
  chmod 755 "$pkgdir/usr/bin/iris-enable"
}
