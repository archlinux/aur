# Maintainer BlivionIaG <kev29lt@gmail.com>
# Maintainer SimPilotAdamT <adam_tazul@outlook.com>

pkgname=fetchcord-testing
pkgver=2.7.8
pkgrel=22
pkgdesc="FetchCord grabs your OS info and displays it as Discord Rich Presence"
arch=('any')
url="https://github.com/fetchcord/fetchcord/tree/testing/"
license=('MIT')
depends=('python' 'neofetch' 'python-psutil' 'python-setuptools' 'python-pypresence')
optdepends=('systemd: Systemd user service' 'python-pyqt5: GUI')
provides=('fetchcord')
source=("fetchcord::git+https://github.com/fetchcord/fetchcord/#branch=testing")
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
  else
    echo "If you see a command not found here, don't worry. It's normal on non-systemd systems."
  fi

}
