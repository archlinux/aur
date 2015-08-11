# Maintainer: TwoLeaves < ohneherren at gmail dot com >

pkgname=rompr-svn
pkgver=r606
pkgrel=1
pkgdesc="Web frontend to MPD"
arch=('any')
url="http://sourceforge.net/projects/rompr/"
license=('custom:"SpongWare"')
depends=('imagemagick' 'php')
makedepends=('subversion')
optdepends=('apache'
'lighttpd'
'nginx'
'php-jsonreader-git: Low Memory Mode'
'mopidy'
'mpd')
provides=('rompr')
conflicts=('rompr')
source=("rompr-code::svn+http://svn.code.sf.net/p/rompr/code/trunk"
        "LICENSE")
md5sums=('SKIP'
         '01af84e14f9f7a43ce0b408adf3b67b2')

pkgver() {
  cd rompr-code
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/rompr-code"
  sed -i 's|PATH-TO-ROMPR|srv/http/rompr|' apache_conf.d/rompr.conf
}

package() {
  cd "${srcdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/rompr-code/apache_conf.d/rompr.conf" "${pkgdir}/etc/httpd/conf/extra/rompr.conf"
  install -d "${pkgdir}/srv/http"
  cp -ra rompr-code "${pkgdir}/srv/http/rompr"
  rm -rf "${pkgdir}/srv/http/rompr"/{.makepkg,.svn}
}
