# Maintainer BlivionIaG <kev29lt@gmail.com>
# Maintainer SimPilotAdamT <adam_tazul@outlook.com>

pkgname=fetchcord-testing
pkgver=de98dee
pkgrel=2
pkgdesc="FetchCord grabs your OS info and displays it as Discord Rich Presence"
arch=('any')
url="https://github.com/MrPotatoBobx/fetchcord/#branch=testing"
license=('MIT')
depends=('python' 'neofetch' 'python-psutil' 'python-setuptools' 'python-pypresence')
optdepends=('systemd: SystemD user service')
provides=('fetchcord')
source=("fetchcord::git+$url#branch=testing")
sha256sums=('SKIP')
install=fetchcord.install

build() {
  cd "$srcdir/fetchcord"
  python setup.py build
}

package() {
  cd "$srcdir/fetchcord"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  if [[ `systemctl` =~ -\.mount ]]; then
    systemddir="/usr/lib/systemd/user"
    if [ -e "$systemddir/fetchcord.service" ]; then
      echo "Not overwriting existing fetchcord.service" && install -Dm644 "$systemddir/fetchcord.service" "$pkgdir$systemddir/fetchcord.service";
    else 
      install -Dm644 systemd/fetchcord.service "$pkgdir$systemddir/fetchcord.service";
    fi
  fi

}
