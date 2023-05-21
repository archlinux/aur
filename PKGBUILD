# Maintainer: willemw <willemw12@gmail.com>

# To install a specific release manually: comment out pkgver(), set the release in "pkgver=" and
# at the end of the "pip install" line (change "sickchill" to "sickchill==<release>").

# This "PIP install" package is similar to a VCS package:
# it has a pkgver() function and a reinstall will update the package.
# That is the only reason why this package ends on -git.

pkgname=sickchill-git
pkgver=2023.1.2.r0
pkgrel=1
pkgdesc="Automatic video library manager for TV shows"
arch=('any')
url="https://sickchill.github.io"
license=('GPL3')
makedepends=('jq' 'python-virtualenv')
optdepends=('libmediainfo: determine the resolution of MKV and AVI files with no resolution in the filename'
            'unrar: for RAR files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install=$pkgname.install
source=('sickchill.service'
        'sickchill.sysusers'
        'sickchill.tmpfiles')
sha256sums=('b417284472d804e634c0dcaac2876ca164ad9a485f947e0f05798d0ce1136d59'
            'aaeb298c9717da8b28853ed15509fb8428d975ae49e8737ebcec15caab9f0978'
            '2069f15e18fc7dd0f0f25b623f2067fc9028b1ca4122021a62364aa39914f88f')

pkgver() {
  local version
  version="$(curl -s "https://pypi.org/pypi/${pkgname%-git}/json" | jq --raw-output --join-output '.info.version')"
  printf "%s.r0" "$version" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"

  #python -m venv build
  export XDG_CACHE_HOME=cache/pip
  VIRTUALENV_OVERRIDE_APP_DATA=cache/virtualenv virtualenv build
  PIP_CONFIG_FILE=/dev/null build/bin/pip install \
      --ignore-installed --isolated --cache-dir=cache --prefix=. --root=build \
      --default-timeout=60 --disable-pip-version-check --no-warn-script-location --progress-bar=off \
      sickchill

  sed -i '1s|.*|#!/opt/sickchill/app/bin/python|' build/bin/SickChill
}

package() {
  install -Dm644 sickchill.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 sickchill.sysusers "$pkgdir/usr/lib/sysusers.d/sickchill.conf"
  install -Dm644 sickchill.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/sickchill.conf"

  install -dm755 "$pkgdir/opt/sickchill"
  cp -a build "$pkgdir/opt/sickchill/app"
}
