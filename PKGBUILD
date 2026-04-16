# Maintainer: redeyes-jpg <https://github.com/redeyes-jpg>
pkgname=spotybar-git
pkgver=r5.043c194
pkgrel=1
pkgdesc="Waybar widget system for Spotify and MPRIS (spotylike + seekingmpris)"
arch=('any')
url="https://github.com/redeyes-jpg/spotybar"
license=('MIT')
depends=('bash' 'curl' 'playerctl' 'python' 'libnotify' 'systemd' 'bc' 'waybar')
makedepends=('git')
provides=('spotybar')
conflicts=('spotybar')
source=("spotybar::git+https://github.com/redeyes-jpg/spotybar.git")
sha256sums=('SKIP')

pkgver() {
  cd "spotybar"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "spotybar"

  # Install main scripts
  install -Dm755 DATA/spotylike "${pkgdir}/usr/bin/spotylike"
  install -Dm755 DATA/spotylike-token-refresh "${pkgdir}/usr/bin/spotylike-token-refresh"
  install -Dm755 DATA/seekingmpris "${pkgdir}/usr/bin/seekingmpris"
  install -Dm755 DATA/seekingmpris-ctl "${pkgdir}/usr/bin/seekingmpris-ctl"
  install -Dm755 DATA/spotybar "${pkgdir}/usr/bin/spotybar"
  
  # Install private helper
  install -Dm644 DATA/_reauth_helper.py "${pkgdir}/usr/lib/spotybar/_reauth_helper.py"

  # Install systemd user services
  install -Dm644 DATA/spotylike.service "${pkgdir}/usr/lib/systemd/user/spotylike.service"
  install -Dm644 DATA/spotylike-token-refresh.service "${pkgdir}/usr/lib/systemd/user/spotylike-token-refresh.service"

  # Install the setup wizard as a utility
  install -Dm755 wizard.sh "${pkgdir}/usr/bin/spotybar-wizard"

  # Install License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/spotybar/LICENSE"
}
