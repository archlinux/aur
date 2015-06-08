# Maintainer: Hugo Osvaldo Barrera hugo@osvaldobarrera.com.ar

pkgname=eclipse-changelog
pkgver=0.24
pkgrel=1
pkgdesc="Eclipse CVS ChangeLog Plugin"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/mylyn/"
license=('EPL')
depends=('eclipse')
optdepends=('bugzilla: ticketing support')
source=("svn+http://svn.codespot.com/a/eclipselabs.org/changelog/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  echo 0.$(svnversion | tr -d [A-z])
}

package() {
  _src=$sr"$srcdir/trunk/org.eclipselabs.changelog.update-site"
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd $_src

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf $_src/${_feature}
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}

