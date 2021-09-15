# Maintainer BlivionIaG <kev29lt@gmail.com>

pkgname=fetchcord
pkgver=2.7.7
pkgrel=1
pkgdesc="FetchCord grabs your OS info and displays it as Discord Rich Presence"
arch=('any')
url="https://github.com/MrPotatoBobx/fetchcord"
license=('MIT')
depends=('python')
provides=('fetchcord')
depends=('neofetch' 'python-psutil' 'python-setuptools')
source=("fetchcord::git+$url#branch=testing")
sha256sums=('SKIP')
install=fetchcord.install

pkgver() {
  cd "$srcdir/fetchcord"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fetchcord"
  python setup.py build
}

package() {
  cd "$srcdir/fetchcord"

  python setup.py install --root="$pkgdir" --optimize=1

  systemddir="/usr/lib/systemd/user"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  if [ -e "$systemddir/fetchcord.service" ]; then
    echo "Not overwriting existing fetchcord.service" && install -Dm644 "$systemddir/fetchcord.service" "$pkgdir$systemddir/fetchcord.service";
  else 
    install -Dm644 systemd/fetchcord.service "$pkgdir$systemddir/fetchcord.service";
  fi

}
