# Maintainer: stratum nine <strata@dropswitch.net>
pkgname=zeya-git
pkgver=20150130
pkgrel=1
pkgdesc="Zeya is a media player that lets you bring your music to any computer with a web browser."
arch=('any')
url="http://web.psung.name/zeya/"
license=('AGPL3')
depends=('python2' 'vorbis-tools' 'python2-tagpy' 'boost')
makedepends=('git')
optdepends=('flac: Flac decoders.' 'mpg123: MP3 decoders.' 'faad2: M4A decoders.')
source=('zeya.run')
md5sums=('50317c1d4675b37943d44678cc726887')

_gitroot="git://github.com/psung/zeya.git"
_gitname="zeya"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  sed -i 's,/bin/python,/bin/python2,' zeyaclient.py
  sed -i 's,/bin/python,/bin/python2,' zeyatest.py
  sed -i 's,/bin/python,/bin/python2,' zeya.py
}

package() {
  mkdir -p "${pkgdir}/usr/lib/zeya"
  mkdir -p "${pkgdir}/usr/bin"
  install -m 755 ../zeya.run "${pkgdir}/usr/bin/zeya"
  cp -r ${srcdir}/zeya-build/* "${pkgdir}/usr/lib/zeya/"
}

# vim:set ts=2 sw=2 et:
