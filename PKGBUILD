# Maintainer: willemw <willemw12@gmail.com>

# NOTE This "PIP install" package is like a VCS package: it has a pkgver() function and to update do a reinstall.
#      That is the only reason why this package ends on -git.

pkgname=sickchill-git
pkgver=2020.11.24.post1.r0
pkgrel=2
pkgdesc="Automatic video library manager for TV shows"
arch=('any')
url="https://sickchill.github.io"
license=('GPL3')
makedepends=('jq' 'python-virtualenv')
optdepends=('libmediainfo: determine the resolution of MKV and AVI files with no resolution in the filename'
            'unrar: for RAR archives')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install=$pkgname.install
source=('sickchill.service'
        'sickchill.sysusers'
        'sickchill.tmpfile')
md5sums=('309b8555af7b355f16a3ec784771f426'
         '97fb191af2e326d5aba2cf58270b4feb'
         '515f13e391105a716ef6763ba8533fc7')

export PIP_DEFAULT_TIMEOUT=60

pkgver() {
  curl -s "https://pypi.org/pypi/${pkgname%-git}/json" | jq --raw-output --join-output '.info.version'
  printf ".r0"
}

build() {
  #python -m venv build
  virtualenv --quiet build
  build/bin/pip install --quiet --quiet --isolated --no-warn-script-location --root=build --prefix=. sickchill

  sed -i '1s|.*|#!/opt/sickchill/app/bin/python|' build/bin/SickChill.py
}

package() {
  install -Dm644 sickchill.service "$pkgdir/usr/lib/systemd/system/sickchill.service"
  install -Dm644 sickchill.sysusers "$pkgdir/usr/lib/sysusers.d/sickchill.conf"
  install -Dm644 sickchill.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickchill.conf"

  install -dm755 "$pkgdir/opt/sickchill/data"

  cp -a build "$pkgdir/opt/sickchill/app"
}

