# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

pkgname=calibre-git
pkgver=2.36.0.r5.g1654895
pkgrel=1
pkgdesc="Ebook management application, from git"
arch=('i686' 'x86_64')
url="http://calibre-ebook.com/"
license=('GPL3')
depends=('python2-dateutil' 'python2-cssutils' 'python2-mechanize' 'mtdev'
         'podofo' 'poppler' 'libwmf' 'imagemagick' 'chmlib' 'python2-lxml'
         'libusbx' 'python2-pillow' 'shared-mime-info' 'python2-dnspython'
         'python2-pyqt5' 'python2-psutil' 'icu' 'libmtp' 'python2-dbus'
         'python2-netifaces' 'python2-cssselect' 'python2-apsw' 'xdg-utils'
         'qt5-webkit' 'desktop-file-utils' 'qt5-svg' 'python2-pygments')
makedepends=('git' 'qt5-x11extras')
optdepends=('ipython2: to use calibre-debug'
            'udisks: required for mounting certain devices')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=calibre.install
source=("git://github.com/kovidgoyal/${pkgname%-git}.git"
        "git://github.com/kovidgoyal/${pkgname%-git}-translations.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}/${pkgname%-git}"

  # Link translations to build dir
  ln -sfT ../calibre-translations translations

  # Desktop integration (e.g. enforce arch defaults)
  # Use uppercase naming scheme, don't create uninstaller.
  # xdg *cannot* be kludged into installing mime or desktop files properly.
  sed -e "/self.create_uninstaller()/,/os.rmdir(config_dir)/d" \
      -e "/f = open/ s/\('calibre-.*\.desktop'\)/os.path.join(dir, \1)/g" \
      -e "/dir, 'calibre-lrfviewer.desktop'/i \
\                dir = os.path.join(self.opts.staging_sharedir,'../applications')\n\
\                os.mkdir(dir)" \
      -e "s/xdg-\(desktop-menu\|mime\)/true/g" \
      -e "s/^Name=calibre/Name=Calibre/g" \
      -i  src/calibre/linux.py
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  # Don't use the bootstrapper, since it tries to checkout/pull
  # the translations repo. Instead call each subcommand.
  # LANG='en_US.UTF-8' python2 setup.py bootstrap

  LANG='en_US.UTF-8' python2 setup.py build
  LANG='en_US.UTF-8' python2 setup.py iso639
  LANG='en_US.UTF-8' python2 setup.py iso3166
  LANG='en_US.UTF-8' python2 setup.py translations
  LANG='en_US.UTF-8' python2 setup.py gui
  LANG='en_US.UTF-8' python2 setup.py resources
}

package() {
  cd "${srcdir}/${pkgname%-git}"


  # If these directories don't exist, zsh completion and icons won't install.
  install -d "${pkgdir}/usr/share/zsh/site-functions" \
      "${pkgdir}"/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/{mimetypes,apps}

  XDG_DATA_DIRS="${pkgdir}/usr/share" LANG='en_US.UTF-8' python2 setup.py install \
    --staging-root="${pkgdir}/usr" --prefix=/usr

  install -Dm644 resources/calibre-mimetypes.xml "${pkgdir}/usr/share/mime/packages/calibre-mimetypes.xml"

  sed -i "/numeric_version = .*/c\numeric_version = ('""${pkgver//./\', \'}""')" \
      "${pkgdir}/usr/lib/calibre/calibre/constants.py"

  # Compiling bytecode FS#33392
  python2 -m compileall "${pkgdir}/usr/lib/calibre/"
  python2 -O -m compileall "${pkgdir}/usr/lib/calibre/"
}
