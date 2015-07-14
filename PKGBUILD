# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

pkgname=calibre-git
pkgver=2.31.0.r80.gf7d246f
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
source=("git://github.com/kovidgoyal/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}/${pkgname%-git}"

  sed -i "s/shlex.split(ldflags)/& + ['-fPIC']/" setup/extensions.py

  # Use python2
  sed -i 's:\(env[ ]\+python$\|/usr/bin/python$\):\12:g' $(find . -regex ".*\.py\|.*\.recipe")

  # Desktop integration (e.g. enforce arch defaults)
  sed -e "/self.create_uninstaller()/,/os.rmdir(config_dir)/d" \
      -e "/\(cc('xdg-icon-resource\|self.icon_resources.append\|'128'))\)/d" \
      -e "/render_img/ s/\('calibre-.*\.png'\)/os.path.join(dir, \1)/g" \
      -e "/dir, 'calibre-lrf.png'/i \
\                dir = os.path.join(self.opts.staging_sharedir,'../pixmaps')\n\
\                os.mkdir(dir)" \
      -e "/f = open/ s/\('calibre-.*\.desktop'\)/os.path.join(dir, \1)/g" \
      -e "/dir, 'calibre-lrfviewer.desktop'/i \
\                dir = os.path.join(self.opts.staging_sharedir,'../applications')\n\
\                os.mkdir(dir)" \
      -e "s/'ctc-posml'/'text' not in mt and 'pdf' not in mt and 'xhtml'/" \
      -e "s/^Name=calibre/Name=Calibre/g" \
      -i  src/calibre/linux.py
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  LANG='en_US.UTF-8' python2 setup.py build
  # LANG='en_US.UTF-8' python2 setup.py resources

  # Don't build translations since building them is broken badly
  #LANG='en_US.UTF-8' python2 setup.py translations
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Fix the environment module location
  sed -i -e "s|(prefix=.*)|(prefix='$pkgdir/usr')|g" setup/install.py

  install -d "${pkgdir}/usr/lib/python2.7/site-packages" \
             "${pkgdir}/usr/share/zsh/site-functions"

  LANG='en_US.UTF-8' python2 setup.py install --root="${pkgdir}" --prefix=/usr \
    --staging-bindir="${pkgdir}/usr/bin" \
    --staging-libdir="${pkgdir}/usr/lib" \
    --staging-sharedir="${pkgdir}/usr/share"

  # Compiling bytecode FS#33392
  python2 -m compileall "${pkgdir}/usr/lib/calibre/"
  python2 -O -m compileall "${pkgdir}/usr/lib/calibre/"
}
