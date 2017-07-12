# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl-git
pkgver=2.18.r4.g7696802
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL3")
depends=('ffmpeg' 'php' 'php-mcrypt' 'python2-crypto')
optdepends=('python2-youtube-dl: an alternative downloader backend'
            'rtmpdump: for downloading Areena audio streams')
makedepends=("git")
provides=(${pkgname%-git}=$pkgver)
conflicts=(${pkgname%-git})
source=("$pkgname::git+https://github.com/aajanki/yle-dl.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  # Replace the hardcoded path for AdobeHDS.php
  sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/share/yle-dl/AdobeHDS.php|g' yle-dl
  # Enable required PHP extensions by directly
  #  appending them to the hds_binary arguments list.
  # OR enable them globaly in php.ini
  sed -i "s|^hds_binary = \['php'|hds_binary = \['php', '-dextension=bcmath.so', '-dextension=curl.so', '-dextension=mcrypt.so'|" yle-dl
}

package() {
  cd "$pkgname"
  make prefix=/usr DESTDIR="${pkgdir}" install
}

