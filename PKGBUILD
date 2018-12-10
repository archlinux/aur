#Maintainer: max-k <max-k AT post DOT com>
pkgname=ampache
pkgver=3.9.0
pkgrel=2
pkgdesc="PHP web based audio/video streaming application and file manager"
arch=('any')
url="http://www.ampache.org/"
license=('GPL')
depends=('mariadb>=5.0' 'php>=5.3')
optdepends=('lame: all transcoding/downsampling'
                'vorbis-tools: all transcoding'
                'flac: flac transcoding/downsampling'
                'faad2: m4a transcoding/downsampling'
                'mp3splt: mp3 and ogg transcoding/downsampling')
conflicts=('ampache-git' 'ampache-development')
install="${pkgname}.install"
_sourcebase="https://github.com/${pkgname}/${pkgname}/releases/download"
source=("${_sourcebase}/${pkgver}/${pkgname}-${pkgver}_all.zip"
        "nginx-example.conf"
        "${pkgname}.install")
sha256sums=('2c232e080eb9ea6c77cea7b078b89e94079f5629cfe7b1de578de92c1240b892'
            'd579f125fc85b6862dc2bd950b6aa3a4ffdad219323b8ee2c93282c8f223c3eb'
            '218f6293f3b63310bba36c6903f907a2b5594013d4d64d206d7ac45c85b1ed26')
options=(!strip)

build() {
  echo "" > /dev/null
}

package() {
  cd "$srcdir" || exit 1
  _targetdir="${pkgdir}/usr/share/webapps/${pkgname}"
  _docdir="${pkgdir}/usr/share/doc/${pkgname}"
  _mandir="${pkgdir}/usr/share/man/man1"
  _vendordir="${_targetdir}/lib/vendor"
  mkdir -p "$_targetdir"
  cp -r ./* "${_targetdir}/"
  unlink "${_targetdir}/${pkgname}-${pkgver}_all.zip"
  unlink "${_targetdir}/nginx-example.conf"
  unlink "${_targetdir}/ampache.install"
  rm -r "${_targetdir}/docs/man"
  mkdir -p "$_docdir"
  mkdir -p "$_mandir"
  install -D -m644 "${srcdir}/docs/man/man1/ampache.1" "${_mandir}/"
  install -D -m644 "${srcdir}/nginx-example.conf" "${_docdir}/"
  find "$_targetdir" -type d -exec chmod 755 {} \;
  find "$_docdir" -type d -exec chmod +x {} \;
  find "$_vendordir" -type d -name '.git' -exec rm -r {} 2>/dev/null \; || true
}
