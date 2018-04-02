# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl-git
pkgver=2.31.r10.g61df175
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL3")
depends=('ffmpeg' 'php' 'python-pyamf' 'python-pycryptodomex'
         'python-future' 'python-lxml' 'python-pysocks' 'python-requests' 'wget')
optdepends=('youtube-dl: an alternative downloader backend to AdobeHDS.php'
            'rtmpdump: for downloading Areena audio streams')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-git}=$pkgver)
conflicts=(${pkgname%-git})
source=("$pkgname::git+https://github.com/aajanki/yle-dl.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  # Enable required PHP extensions by directly
  #  appending them to the hds_binary arguments list.
  # OR enable them globaly in php.ini
  sed -i "s|\['php'|\['php', '-dextension=bcmath.so', '-dextension=curl.so'|" yledl/downloaders.py
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

