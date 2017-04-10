# Maintainer: Zeph <zeph33@gmail.com>
pkgname=pluxml
pkgver=5.6
pkgrel=1
name=PluXml
pkgdesc="Light Blog or CMS with XML, no database"
arch=('any')
url="http://www.pluxml.org/"
license=('GPL')
depends=('php' 'php-gd')
makedepends=()
options=('!strip')
downloaderver=1.3
ckeditorver=4.5.11
source=("https://github.com/${pkgname}/${name}/archive/${pkgver}.tar.gz"
		"plxPluginDownloader.tar.gz::https://github.com/Zeph33/plxMyPluginDownloader/archive/${downloaderver}.tar.gz"
		"ckeditor.tar.gz::https://github.com/Pluxopolis/ckeditor/archive/${ckeditorver}.tar.gz"
		"apache.example.conf"
		"nginx.example.conf"
		)

#backup=("etc/webapps/${pkgname}/config.php")
md5sums=('1663b67b1ca83f9c70047819b5d2c4ea'
		 '256254e70385b198bffcf0ebe9601776'
		 'bc7e89baea504460dbb8f68f0a27f420'
		 'a9f8e4532809d4e7f3b43350e4c04c01'
		 '6ba6afdcf72678226ec77683a9028a21'
		)

prepare() {
  mv "$srcdir/plxMyPluginDownloader-$downloaderver" "$srcdir/${name}-${pkgver}/plugins/plxMyPluginDownloader"
  mv "$srcdir/ckeditor-$ckeditorver" "$srcdir/${name}-${pkgver}/plugins/ckeditor"
}

package() {
  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${name}-${pkgver} ${pkgdir}/usr/share/webapps/${pkgname}
  chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}

  # install config file
  install -d  ${pkgdir}/etc/webapps/${pkgname}

  # move config to /etc
#  mv ${pkgdir}/usr/share/webapps/${pkgname}/data/configuration ${pkgdir}/etc/webapps/${pkgname}/config
#  chown -R http:http ${pkgdir}/etc/webapps/${pkgname}
#  ln -s /etc/webapps/${pkgname}/config ${pkgdir}/usr/share/webapps/${pkgname}/data/configuration
#  chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}/data/configuration

  # install apache config file
  install -d  ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/nginx.example.conf  ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/${pkgname}
  chown -R http:http ${pkgdir}/etc/webapps/${pkgname}

  find ${pkgdir}/usr/share/webapps/${pkname} -type f -exec chmod 0644 {} \;
  find ${pkgdir}/usr/share/webapps/${pkname} -type d -exec chmod 0755 {} \;
}
