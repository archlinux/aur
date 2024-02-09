# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: hl037 <hl037 dot prog at gmail dot com>
# Contributor: d1t2 <dieterplex at gmail dot com>

pkgname='eclipse-testng'
pkgver='7.9.0'
pkgdate='202312310355'
pkgrel='1'
pkgdesc='A testing framework plugin for Eclipse IDE inspired by JUnit and NUnit'
arch=('any')
url='http://testng.org/'
license=('APACHE')
depends=('eclipse>=4.5.0')
options=('!strip')
#_url="https://github.com/cbeust/testng-eclipse/raw/master/testng-eclipse-update-site"
#_url="https://dl.bintray.com/testng-team/testng-eclipse-release/updatesites/$pkgver.$pkgdate"
_url="https://testng.org/testng-eclipse-update-site/zipped/$pkgver.$pkgdate/org.testng.eclipse.updatesite.zip"
_path="org.testng.eclipse_$pkgver.$pkgdate"
_path2features="org.testng.eclipse.maven.feature_$pkgver.$pkgdate"
_path2plugins="org.testng.eclipse.maven_$pkgver.$pkgdate"
source=($_url)
_dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"

sha256sums=('f74491ec18c75a85e8114aa3e27a45b9ba1fe96774ab7c3b2db1759eb782362d')

package() {
  # remove features and plug-ins containing sources
#  rm features/*.source_*
  rm plugins/*.source_*
  # remove gz files
#  rm plugins/*.pack.gz
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  # extract features (otherwise features are not recognized)
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done
  # copy plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
