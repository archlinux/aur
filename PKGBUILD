# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl-git
pkgver=2.23.r4.g76ab1fb
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL3")
depends=('php' 'php-mcrypt' 'python2-crypto' 'python2-lxml' 'python2-requests' 'python2-progress')
optdepends=('ffmpeg: might be needed very rarely for some Areena video streams'
            'python2-youtube-dl: an alternative downloader backend'
            'rtmpdump: for downloading Areena audio streams')
makedepends=('git' 'python2-setuptools')
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
  sed -i "s|\['php'|\['php', '-dextension=bcmath.so', '-dextension=curl.so', '-dextension=mcrypt.so'|" yledl/downloaders.py
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
