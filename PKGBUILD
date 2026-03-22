# Maintainer: Ismet Togay <ismet.togay@gmail.com>
pkgname=threadstepper-git
pkgver=r122.bb0f93a
pkgrel=6
pkgdesc="A stability and stress tester for AMD Curve Optimizer and PBO on Linux"
arch=('x86_64')
url="https://github.com/gazpitchy92/threadstepper"
license=('GPL3')
depends=('python' 'python-ttkbootstrap' 'python-pillow' 'python-psutil' 'stress-ng' 'p7zip' 'tk' 'fuse2')
makedepends=('git')
provides=('threadstepper')
conflicts=('threadstepper') 
source=("${pkgname}::git+https://github.com/gazpitchy92/threadstepper.git"
        "threadstepper.sh"
        "threadstepper.desktop"
        "https://github.com/ungoogled-software/ungoogled-chromium-portablelinux/releases/download/144.0.7559.59-1/ungoogled-chromium-144.0.7559.59-1-x86_64.AppImage")
sha256sums=('SKIP'
            'bc6fb1439de8a01112042d5d85be3fa8c2617a4bddb0a2ca1c4ce4f8283fa97a'
            '198d8ca5320f9efb350eb721e963c7870229f5fbff3d8d7c7b19105d9c1f54d8'
            '6a47926dd39dacd7a42624e341b6de2f43d60968cae5be0c703f08e528dfae33')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install wrapper script
  install -Dm755 "$srcdir/threadstepper.sh" "$pkgdir/usr/bin/threadstepper"

  # Install desktop and icon
  install -Dm644 "$srcdir/threadstepper.desktop" "$pkgdir/usr/share/applications/threadstepper.desktop"
  install -Dm644 "$srcdir/$pkgname/favicon.png" "$pkgdir/usr/share/pixmaps/threadstepper.png"

  # Copy application files
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir/opt/threadstepper"
  cp -a start.py threadstepper settings functions tests logs favicon.png "$pkgdir/opt/threadstepper/"
  
  # Install License
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  # Enforce sane permissions on logs directory
  chmod -R root:root "$pkgdir/opt/threadstepper/logs" 2>/dev/null || true
  chmod -R 755 "$pkgdir/opt/threadstepper/logs"
  
  # Ensure tests browser directory exists and copy AppImage
  install -dm755 "$pkgdir/opt/threadstepper/tests/browser"
  install -m755 "$srcdir/ungoogled-chromium-144.0.7559.59-1-x86_64.AppImage" "$pkgdir/opt/threadstepper/tests/browser/"

  # Ensure script is executable
  chmod +x "$pkgdir/opt/threadstepper/threadstepper"
}
