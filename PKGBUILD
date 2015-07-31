# Maintainer: Zeph <zeph33@gmail.com>
pkgname=pluxml
pkgver=5.4
pkgrel=1
name=PluXml
pkgdesc="Light Blog or CMS with XML, no database"
arch=('any')
url="http://www.pluxml.org/"
license=('GPL')
depends=('php' 'php-gd')
makedepends=()
options=('!strip')
downloadergitcommit='3603452af61b8dfbc5e38a5ad3fbf91c16323fa6'
ckeditorver=4.4.7.1
source=("https://github.com/${pkgname}/${name}/archive/${pkgver}.tar.gz"
		"plxPluginDownloader.tar.gz::https://github.com/Pluxopolis/plxMyPluginDownloader/archive/${downloadergitcommit}.tar.gz"
		"plxPluginDownloader.patch::https://github.com/alexandre-lg/plxMyPluginDownloader/commit/691af02d2478c54aa989f1df3ce2047589f3764f.patch"
		"ckeditor.tar.gz::https://github.com/Pluxopolis/ckeditor/archive/${ckeditorver}.tar.gz"
		"apache.example.conf"
		"nginx.example.conf"
		)

#backup=("etc/webapps/${pkgname}/config.php")
md5sums=('ade11b48a08f7d28993ed0ef8f7b5adf'
		 '8851bbd0be028778b172253f97b0396b'
		 'baf7cefff989dbdf8ecac349f970715e'
		 'ce2deb0b42a929da5f7318b6130735fa'
		 'a9f8e4532809d4e7f3b43350e4c04c01'
		 '6ba6afdcf72678226ec77683a9028a21'
		)

prepare() {
  mv "$srcdir/plxMyPluginDownloader-$downloadergitcommit" "$srcdir/${name}-${pkgver}/plugins/plxMyPluginDownloader"
  mv "$srcdir/ckeditor-$ckeditorver" "$srcdir/${name}-${pkgver}/plugins/ckeditor"
  cd $srcdir/${name}-${pkgver}/plugins/plxMyPluginDownloader
  patch -Np1 -i $srcdir/plxPluginDownloader.patch
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
