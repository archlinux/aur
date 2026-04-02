pkgname=urdu-translator-git
pkgver=v1.0.0.r1.g6e4d704
pkgrel=1
pkgdesc="A screenshot-to-translation app using EasyOCR and Google Gemini"
arch=('x86_64')
url="https://github.com/AMVZEN/UrduLiveTranslator"
license=('MIT')
depends=('python' 'python-pip' 'nss' 'alsa-lib' 'gtk3' 'grim' 'slurp')
makedepends=('npm' 'git')
provides=('urdu-translator')
conflicts=('urdu-translator')

# IMPORTANT: Before publishing to AUR, push your code to GitHub and update the URL below!
# For local testing, we can use a local file path, but pacman/makepkg restricts it. 
# You should uncomment the github link when doing this for real.
source=("git+https://github.com/AMVZEN/UrduLiveTranslator.git"
        "urdu-translator.sh"
        "urdu-translator.desktop")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/UrduLiveTranslator"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo $pkgver
}

build() {
  cd "$srcdir/UrduLiveTranslator/frontend"
  
  # Install frontend dependencies
  npm install
  
  # Build the React vite app
  npm run build
  
  # Package the electron app for Linux (dir format instead of AppImage makes it easier to bundle in /opt)
  npx electron-builder --linux dir
}

package() {
  # 1. Prepare installation directories
  install -d "$pkgdir/opt/urdu-translator/frontend"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"

  # 2. Copy the Frontend Electron Bundle
  cp -r "$srcdir/UrduLiveTranslator/frontend/dist/linux-unpacked/"* "$pkgdir/opt/urdu-translator/frontend/"
  
  # 3. Copy the Backend Source
  # We copy everything in backend so the launcher script can venv/pip install on first run
  cp -r "$srcdir/UrduLiveTranslator/backend" "$pkgdir/opt/urdu-translator/"

  # Fix permissions
  chmod -R 755 "$pkgdir/opt/urdu-translator"

  # 4. Install the Desktop entry and Launcher Script
  install -m 755 "$srcdir/urdu-translator.sh" "$pkgdir/usr/bin/urdu-translator"
  install -m 644 "$srcdir/urdu-translator.desktop" "$pkgdir/usr/share/applications/"

  # (Extra) Setup icon if you have one. You'll need to add it to your repo and install it here.
  # install -Dm644 "$srcdir/UrduTranslator/icon.png" "$pkgdir/usr/share/pixmaps/urdu-translator.png"
}
