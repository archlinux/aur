#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Kristof Jozsa <kjozsa@fsdev.hu>

pkgname=eclipse-scala-ide
pkgver=4.4.0
pkgrel=2
pkgdesc="Scala IDE for Eclipse"
arch=('any')
url="http://www.scala-ide.org/"
license=('custom')
depends=('eclipse>=4.4')

source=($pkgname-$pkgver.zip::"http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/update-site.zip"
	"LICENSE" "scala-ide.desktop" "product.png"
)
md5sums=('3e4f621aca2584ab8eac14815958529d'
         '58b225f304aaf42c8b8738894a10cb96'
         'faf8441d3576d87c227912b3491fdf29'
         'c95b1920928f10d2c982afd7f5827a2c')

package() {
  install -D -m0644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m0644 "${srcdir}"/scala-ide.desktop "${pkgdir}/usr/share/applications/scala-ide.desktop"
  install -D -m0644 "${srcdir}"/product.png "${pkgdir}/usr/lib/eclipse/dropins/scala-ide/icon.png"

  _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"
  cd "${srcdir}/base"

  # Features
  find features -type f | while read -r _feature ; do
    if [[ "${_feature}" =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}/${_feature%*.jar}"
      cd "${_dest}/${_feature/.jar}"
      # extract features (otherwise they are not visible in about dialog)
      jar xf "${srcdir}/base/${_feature}" || return 1
    else
      install -Dm644 "${_feature}" "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read -r _plugin ; do
    install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
  done
}
