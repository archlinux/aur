# Maintainer: Your Name <yatharth3194@gmail.com>
pkgname=bing_points-git
pkgver=1.0.1.r0.gabcdef0 # This will be replaced by the output of pkgver()
pkgrel=1
pkgdesc="A tool to collect Bing Rewards points"
arch=('any')
url="https://github.com/Venom120/Bing-Points"
license=('MIT')
depends=('python' 'python-selenium' 'python-webdriver-manager')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Bing-Points"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/Bing-Points"

  # Install the desktop entry
  install -Dm644 bing_points.desktop "$pkgdir/usr/share/applications/bing_points.desktop"

  # Install the main Python script
  install -Dm755 main.py "$pkgdir/usr/share/bing_points/main.py"
  
  # Install the shell script, then patch it to remove venv activation
  install -Dm755 bing_points.sh "$pkgdir/usr/share/bing_points/bing_points.sh"
  
  # Patch the .sh script for the AUR build
  # 1. Set the correct CD path
  sed -i "s|cd current_directory|cd /usr/share/bing_points|g" "$pkgdir/usr/share/bing_points/bing_points.sh"
  # 2. Comment out the venv activation line, as we use system dependencies
  sed -i "s|^source .venv/bin/activate|# System packages are used, no venv needed|g" "$pkgdir/usr/share/bing_points/bing_points.sh"
}