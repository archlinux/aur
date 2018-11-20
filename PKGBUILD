# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>

pkgname=doorpi
pkgver=3.0beta2
pkgrel=1
pkgdesc="VoIP-based door intercom station for Raspberry Pi"
arch=(any)
url="https://www.doorpi.org"
license=('CC BY-NC 4.0')
depends=(python python-requests)
makedepends=(git python-setuptools)
optdepends=('python-piface: Use Piface IO expander'
            'python-picamera: Take and mail snapshots; stream video'
            'python-raspberry-gpio: Use onboard GPIO header'
            'python-pyserial: Use serially connected peripherals like RFID'
            'python-watchdog: Use files as virtual IO pins')
backup=('etc/doorpi/doorpi.ini')
# there aren't any binaries that could be stripped; skip searching for them
options=(!strip)
source=("doorpi::git+https://github.com/Wuestengecko/DoorPi.git#tag=v$pkgver"
        "doorpiweb::git+https://github.com/Wuestengecko/DoorPiWeb.git#tag=v$pkgver"
        "doorpi.ini"
        "0001-disable-gpio-group.diff")
md5sums=('SKIP'
         'SKIP'
         '72bf97148a548a4b6c26a59495b0a251'
         'bae6571520c959d4ba0bd222365c9d88')

pkgver() {
  cd "$srcdir/doorpi"
  #git describe --long --tags | sed 's/^v//;s/\([0-9]\+-g\)/r\1/;s/-/./g'

  # read newest version and its line number from changelog.txt
  local version_line="$(grep -nm1 '^[Vv]ersion:' changelog.txt)"
  local version="${version_line#* }"
  version="${version%% *}"
  version_line="${version_line%%:*}"

  # find out when this line was added to the file
  local version_commit="$(git blame --line-porcelain -L "${version_line},+1" -- changelog.txt | head -c40)"

  # count new commits since last version
  local version_new_commits="$(git rev-list --count "$version_commit..HEAD")"

  # current HEAD commit
  local version_head="$(git rev-parse --short HEAD)"

  printf '%s.r%s.%s' "$version" "$version_new_commits" "$version_head"
}

prepare() {
  cd "$srcdir/doorpi"
  patch -Np1 <"$srcdir/0001-disable-gpio-group.diff"
}

build() {
  cd "$srcdir/doorpi"
  python setup.py build
}

package() {
  install -Dm644 "$srcdir/doorpi.ini" "$pkgdir/etc/doorpi/doorpi.ini"
  cd "$srcdir/doorpi"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  rm -rf "$pkgdir/etc/init.d"

  cd "$srcdir/doorpiweb"
  mkdir -p "$pkgdir/usr/share/webapps/doorpiweb"
  cp -r * "$pkgdir/usr/share/webapps/doorpiweb"
}
