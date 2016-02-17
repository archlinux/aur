# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=thingspeak-git
_gitname=thingspeak
pkgver=r294.9d4b74d
pkgrel=1
pkgdesc='An open source “Internet of Things” application and API to store and retrieve data'
arch=('any')
url='https://thingspeak.com'
license=('GNU GPLv3+')
depends=('mariadb' 'xml2' 'libxslt' 'git' 'curl' 'ruby-bundler')
source=("git://github.com/iobridge/${_gitname}" 'Gemfile.lock.patch')
sha256sums=('SKIP'
            '485557a42780867d931514acf4e6d9cf4de418085a7c18bce501578cddeded88')

PKGEXT='.pkg.tar'

pkgver() {
  cd ${srcdir}/$_gitname/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/$_gitname/
  patch -Np1 -i "${srcdir}/Gemfile.lock.patch"
}

#build() {
#  cd $_gitname/
#  mkdir -p ${pkgdir}/ruby/2.3.0
#  bundle install --path ${pkgdir}
#}

package() {
  cd ${srcdir}/$_gitname/
  bundle install --path ${pkgdir}/usr/lib || true
  #bundle update json eventmachine
  cp config/database.yml.example config/database.yml
  mkdir ${pkgdir}/opt
  cp -a ${srcdir}/$_gitname/ ${pkgdir}/opt

  mkdir -p "$pkgdir/etc/profile.d"
  RUBY_VER=$(basename ${pkgdir}/usr/lib/ruby/*)
  echo "export PATH=/usr/lib/ruby/${RUBY_VER}/bin:"'$PATH' > "$pkgdir/etc/profile.d/thingspeak.sh"

	#ln -sf "FreeCADCmd" "${pkgdir}/usr/bin/freecadcmd"

	#cp -ra "${pkgdir}/usr/Mod" "${pkgdir}/usr/share/freecad/"
	#rm -r "${pkgdir}/usr/Mod"

	# install the desktop icon
	#install -m644 -D ${srcdir}/freecad/src/Gui/Icons/freecad.svg -t ${pkgdir}/usr/share/icons

	# Install pixmaps and desktop shortcut
	#desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/freecad/package/debian/freecad.desktop"
}

