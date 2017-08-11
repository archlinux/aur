#Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-jd
pkgver=1.0.0
pkgrel=1
pkgdesc='Java decompiler (JD-Eclipse) to display sources for compiled classes and libraries.'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('eclipse>=4.5.0')
options=('!strip')
source=("download.zip::https://github.com/java-decompiler/jd-eclipse/releases/download/v$pkgver/jd-eclipse-site-$pkgver-RC2.zip")
sha256sums=('6a127dac2742538f572edcf21b1aa116313d87a5e06a4541570c49ec995cc368')

package() {
  cd $srcdir
  _dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  # extract features (otherwise features are not recognized)
  find features -type f | while read _feature ; do
    if [[ $_feature =~ (.*\.jar$) ]] ; then
      install -dm755 $_dest/${_feature%*.jar}
      cd $_dest/${_feature/.jar}
      jar xf $srcdir/$_feature || return 1
    else
      install -Dm644 $srcdir/$_feature $_dest/$_feature
    fi
  done
  # copy plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 $_plugin $_dest/$_plugin
  done
}

