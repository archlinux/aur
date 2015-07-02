# Mantainer: 3ED <kas1987@o2.pl>

arch=('any')
license=('GPL')
pkgname=ceemedia
pkgver=0.5.4
_rev=113
pkgrel=4.1
pkgdesc="CeeMedia is a program for cataloging your movie collection."
depends=('python>=2.3' 'pygtk>=2.6' 'libglade>=2.5')
makedepends=('bzr')
url="http://ceemedia.sosdg.org/index.html"
source=("${pkgname}-bzr::bzr+http://bazaar.launchpad.net/~vcs-imports/ceemedia/stable/#revision=revno:$_rev")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}-bzr/src
  #./update_pot.sh
  #./update_po.sh

  perl -ni -e '(/^#!/) and print "#!/usr/bin/python2\n" or print' ceemedia

  install -dm755 i18n/{da,es,fr,pl,ru}/LC_MESSAGES
  ./update_mo.sh
}

package() {
  cd ${pkgname}-bzr/src

  install -dm755 "$pkgdir"/usr/{bin,share/{applications,pixmaps,ceemedia/{plugins,images}}}

  install -m755 ceemedia "$pkgdir"/usr/bin/
  install -m644 ceemedia.desktop "$pkgdir"/usr/share/applications/
  install -m644 ceemedia.glade *.py "$pkgdir"/usr/share/ceemedia/
  install -m644 plugins/* "$pkgdir"/usr/share/ceemedia/plugins/
  install -m644 images/* "$pkgdir"/usr/share/ceemedia/images/

  ln -s ../ceemedia/images/ceemedia.png "$pkgdir"/usr/share/pixmaps/ceemedia.png

  #### locale ####
  cd i18n
  for i in */; do
    test -f ${i}LC_MESSAGES/ceemedia.mo || continue
    install -dm755 "$pkgdir"/usr/share/locale/${i}LC_MESSAGES
    install -m644 ${i}LC_MESSAGES/ceemedia.mo "$pkgdir"/usr/share/locale/${i}LC_MESSAGES/ceemedia.mo
  done
}
