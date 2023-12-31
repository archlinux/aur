# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>

pkgname=mopidy-ytmusic
pkgver=0.3.8
pkgrel=3
pkgdesc="Mopidy extension for playing music from Youtube Music"

arch=('any')
url="https://github.com/jmcdo29/mopidy-ytmusic"
license=('APACHE')
depends=(
  'mopidy'
  'python-certifi'
  'python-charset-normalizer'
  'python-idna'
  'python-importlib-metadata'
  'python-pykka'
  'python-pytube'
  'python-setuptools'
  'python-requests'
  'python-tornado'
  'python-urllib3'
  'python-zipp'
  'python-ytmusicapi')
makedepends=('python' 'git')

source=("$pkgname-${pkgver}.zip::$url/archive/refs/heads/master.zip")

package() {
  cd "mopidy-ytmusic-master"

  # change pytube dependency:
  sed -i 's/pytube>=12.1.0,<13.0.0/pytube>=15/' setup.py

  # use oauth in `mopidy ytmusic setup` command:
  sed -i '20s/ytmusicapi import YTMusic/ytmusicapi.setup import setup_oauth/' mopidy_ytmusic/command.py
  sed -i 's/\/auth.json/\/oauth.json/' mopidy_ytmusic/command.py
  sed -i '32,38d' mopidy_ytmusic/command.py
  sed -i 's/print(YTMusic(filepath=str(path)))/setup_oauth(filepath=str(path))/' mopidy_ytmusic/command.py

  python setup.py install --root="${pkgdir}/" --optimize=1
}

sha256sums=('adedacf5192e3b541dd47534902d7f1848478e21bf40b723079a4d85d486a2a1')
