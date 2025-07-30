# Maintainer: jaime [at] jamezrin [dot] name
_pkgname=fido2-manage
pkgname=$_pkgname-git
pkgver=r104.679b85b
pkgrel=1
pkgdesc="Tool allowing to manage FIDO2.1 devices over USB or NFC, including Passkey (resident keys) management"
arch=('x86_64')
url="https://github.com/Token2/fido2-manage"
license=('BSD-2-Clause')
depends=('libfido2' 'libcbor' 'pcsclite' 'openssl' 'systemd-libs' 'tk' 'python' 'bash')
optdepends=('pcsc-tools: for smart card reader utilities')
makedepends=('git' 'cmake' 'zlib' 'pkg-config')
provides=('fido2-manage')
source=("git+https://github.com/Token2/fido2-manage.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  
  # Patch the script to replace ./fido2-manage.sh with fido2-manage
  find . -type f -name "*.py" -o -name "*.sh" -o -name "*.txt" -o -name "*.md" | \
    xargs sed -i 's|./fido2-manage\.sh|fido2-manage|g'
  
  # Update the fido2-manage.sh script to use the correct path for fido2-token2
  sed -i 's|FIDO2_TOKEN_CMD="/usr/local/bin/fido2-token2"|FIDO2_TOKEN_CMD="/usr/bin/fido2-token2"|g' fido2-manage.sh
}

build() {
  cd "$srcdir/$_pkgname"
  
  # Create build directory and configure with cmake
  rm -rf build
  mkdir build
  cd build
  
  # Remove problematic FORTIFY_SOURCE flags to avoid redefinition
  export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}"
  export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=2/}"
  
  # Configure with cmake as per Arch Linux instructions
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_PCSC=ON \
        -DCMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG" \
        ..
  
  # Build the project
  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  # Install only the fido2-token2 binary, not the libfido2 stuff that conflicts
  install -Dm755 build/tools/fido2-token2 "$pkgdir/usr/bin/fido2-token2"
  
  # Install the CLI script as fido2-manage
  install -Dm755 fido2-manage.sh "$pkgdir/usr/bin/fido2-manage"
  
  # Create wrapper script for GUI
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/fido2-manage-gui" <<EOF
#!/bin/bash
cd /usr/share/fido2-manage
python3 gui.py "\$@"
EOF
  
  # Install the Python GUI files
  install -dm755 "$pkgdir/usr/share/fido2-manage"
  install -m644 gui.py "$pkgdir/usr/share/fido2-manage/"
  
  # Install any additional Python files if they exist
  for py_file in *.py; do
    if [ -f "$py_file" ] && [ "$py_file" != "gui.py" ]; then
      install -m644 "$py_file" "$pkgdir/usr/share/fido2-manage/"
    fi
  done 2>/dev/null || true
  
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/fido2-manage.desktop" <<EOF
[Desktop Entry]
Name=FIDO2 Manage
Comment=Tool for managing FIDO2.1 devices over USB or NFC
Exec=fido2-manage-gui
Icon=security-high
Terminal=false
Type=Application
Categories=System;Security;
Keywords=FIDO2;Security;Authentication;USB;NFC;
EOF
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
