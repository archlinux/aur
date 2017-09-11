# Maintainer: rohannb <rohannb30@gmail.com>
pkgname=eclipse-liclipse
pkgver=4.1.1
pkgrel=1
pkgdesc='Lightweight editors, theming and usability improvements for Eclipse'
arch=('any')
url='https://www.liclipse.com/index.html'
license=('custom')
depends=('eclipse>=4.6' 'java-runtime=8')
optdepends=('coffee-script: CoffeeScript support'
            'cmake: CMake support'
	    'dart: Dart support'
	    'python-django: Django Templates support (Python 3)'
	    'python2-django: Django Templates support (Python 2)'
	    'go: Go support'
	    'java-environment-common: Java support'
	    'python-jinja: Jinja2 support (Python 3)'
	    'python2-jinja: Jinja2 support (Python 2)'
	    'julia: Julia support'
	    'python-kivy: Kivy Language support (Python 3)'
	    'python2-kivy: Kivy Language support (Python 2)'
	    'python-mako: Mako Templates support (Python 3)'
	    'python2-mako: Mako Templates support (Python 2)'
	    'nim: Nim support'
	    'perl: PERL support'
	    'python: Python 3 support'
	    'python2: Python 2 support'
	    'ruby: Ruby support')
provides=('eclipse-anyedittools=2.6.1' 'eclipse-eclipsecolortheme=1.2.1' 'eclipse-pydev=5.9.2')
conflicts=('eclipse-anyedittools' 'eclipse-eclipsecolortheme' 'eclipse-pydev')
changelog='changelog'
source=('http://www.mediafire.com/file/52tyeinl5z57fz9/UPDATE_SITE_4.1.1.zip')
sha256sums=('70fde1454daab7d9bd57b15aec885c6e60216d202ac906c311655afcd6d0acbe')

prepare() {
  # remove features and plug-ins containing sources
  rm -f features/*.source_*
  rm -f plugins/*.source_*
  # remove gz files
  rm -f plugins/*.pack.gz
}

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"

  cd "$srcdir/repository_${pkgname/eclipse-}_$pkgver"
  # Features
  find features -type f | while read -r _feature ; do
    if [[ "${_feature}" =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}/${_feature%*.jar}"
      cd "${_dest}/${_feature/.jar}"
      # extract features (otherwise they are not visible in about dialog)
      jar xf "$srcdir/repository_${pkgname/eclipse-}_$pkgver/${_feature}" || return 1
    else
      install -Dm644 "${_feature}" "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read -r _plugin ; do
    install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
  done
  
  install -Dm644 "$srcdir/../LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}

