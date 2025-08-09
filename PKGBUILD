# Maintainer: Your Name <your.email@example.com>
# Contributor: Phantom Browser Shell Team
pkgname=phantom-wallet
pkgver=1.0.0
pkgrel=1
pkgdesc="A cryptocurrency wallet for managing digital assets"
arch=('x86_64')
url="https://github.com/wakeupwakeupwakeup/phantom-browser-shell"
license=('GPL-3.0')
depends=('nodejs>=16.0.0')
makedepends=('git' 'npm' 'yarn>=1.10.0')
optdepends=('cups: printing support'
            'alsa-lib: sound support'
            'libnotify: desktop notifications')
provides=('phantom-wallet')
conflicts=('phantom-browser')
source=("git+https://github.com/wakeupwakeupwakeup/phantom-browser-shell.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/phantom-browser-shell"
  printf "%s" "$(grep '"version"' package.json | cut -d'"' -f4)"
}

prepare() {
  cd "$srcdir/phantom-browser-shell"
  
  # Install dependencies
  yarn install --frozen-lockfile
}

build() {
  cd "$srcdir/phantom-browser-shell"
  
  # Build all packages
  yarn run build:context-menu && yarn run build:extensions
  
  # Build the shell package
  cd packages/shell
  yarn run package
}

package() {
  cd "$srcdir/phantom-browser-shell"
  
  # Create directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  
  # Copy built application
  cp -r "packages/shell/out/Phantom Wallet-linux-x64"/* "$pkgdir/usr/lib/$pkgname/"
  
  # Copy icon
  if [ -f "packages/shell/out/Phantom Wallet-linux-x64/resources/assets/icon.png" ]; then
    install -m644 "packages/shell/out/Phantom Wallet-linux-x64/resources/assets/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  elif [ -f "packages/shell/assets/icon.png" ]; then
    install -m644 packages/shell/assets/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  elif [ -f "chrome.png" ]; then
    install -m644 chrome.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  elif [ -f "icon512.png" ]; then
  install -m644 icon512.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  else
    echo "Warning: Icon file not found, using default"
  fi
  
  # Copy extensions directory if it exists
  if [ -d "extensions" ]; then
    install -dm755 "$pkgdir/usr/lib/$pkgname/extensions"
    cp -r extensions/* "$pkgdir/usr/lib/$pkgname/extensions/"
  fi
  
  # Create desktop entry
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Phantom
Comment=Phantom Wallet
Exec=/usr/bin/$pkgname
Icon=/usr/share/pixmaps/$pkgname.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;Finance;
Keywords=phantom;wallet;cryptocurrency;blockchain;bitcoin;ethereum;solana;polygon;sui;defi;nft;web3;crypto;btc;eth;sol;matic;dapp;trading;exchange;swap;bridge;staking;yield;farming;ledger;trezor;hardware;cold;storage;
EOF
  
  # Create launcher script
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
exec /usr/lib/$pkgname/"Phantom Wallet" "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
  
  # Copy license
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  
  # Fix permissions
  find "$pkgdir/usr/lib/$pkgname" -type f -exec chmod 644 {} \;
  find "$pkgdir/usr/lib/$pkgname" -type d -exec chmod 755 {} \;
  chmod +x "$pkgdir/usr/lib/$pkgname/Phantom Wallet"
}