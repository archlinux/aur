# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=calibre-git
pkgver=2.77.0.r69.g86f5bb8c6d
pkgrel=1
_mathjax_commit=c493143c02f5809b1112af6c5a2c8eab31050118
pkgdesc="Ebook management application, from git"
arch=('i686' 'x86_64')
url="https://calibre-ebook.com/"
license=('GPL3')
depends=('python2-dateutil' 'python2-cssutils' 'python2-mechanize' 'mtdev'
         'podofo' 'poppler' 'libwmf' 'chmlib' 'python2-lxml'
         'libusbx' 'python2-pillow' 'python2-dnspython'
         'python2-pyqt5' 'python2-psutil' 'icu' 'libmtp' 'python2-dbus'
         'python2-netifaces' 'python2-cssselect' 'python2-apsw'
         'qt5-webkit' 'qt5-svg' 'python2-pygments' 'optipng')
makedepends=('git' 'qt5-x11extras' 'xdg-utils')
optdepends=('ipython2: to use calibre-debug')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/kovidgoyal/${pkgname%-git}.git"
        "git+https://github.com/kovidgoyal/${pkgname%-git}-translations.git"
        "MathJax-${_mathjax_commit}.tar.gz::https://github.com/kovidgoyal/MathJax/archive/${_mathjax_commit}.tar.gz"
        "common-user-agents.txt")
sha256sums=('SKIP'
            'SKIP'
            '27c66730302a589063faa0b47d55e97011d858c12428bdf9e308948be87f29c6'
            '1ecd7d651229b93077fa10832ae2a081f2310b20bf28087894b26144c957e96a')

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
  # xdg *cannot* be kludged into installing mime files properly.
  sed -e "/self.create_uninstaller()/,/os.rmdir(config_dir)/d" \
      -e "/cc(\['xdg-desktop-menu', 'forceupdate'\])/d" \
      -e "/cc(\['xdg-mime', 'install', MIME\])/d" \
      -e "s/^Name=calibre/Name=Calibre/g" \
      -i  src/calibre/linux.py
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  # Don't use the bootstrapper, since it tries to checkout/pull the
  # translations repo and generally touch the internet. Instead call each
  # *needed* subcommmand.
  # LANG='en_US.UTF-8' python2 setup.py bootstrap

  LANG='en_US.UTF-8' python2 setup.py build
  LANG='en_US.UTF-8' python2 setup.py iso639
  LANG='en_US.UTF-8' python2 setup.py iso3166
  LANG='en_US.UTF-8' python2 setup.py translations
  LANG='en_US.UTF-8' python2 setup.py gui
  LANG='en_US.UTF-8' python2 setup.py resources
  # This tries to download a new copy, so instead provide a recently-generated
  # one to allow offline builds.
  # LANG='en_US.UTF-8' python2 setup.py recent_uas
  cp ../common-user-agents.txt resources/
  LANG='en_US.UTF-8' python2 setup.py mathjax --path-to-mathjax="${srcdir}/MathJax-${_mathjax_commit}"
}

package() {
  cd "${srcdir}/${pkgname%-git}"


  # If these directories don't exist, zsh completion, icons, and desktop files won't install.
  install -d "${pkgdir}/usr/share/zsh/site-functions" \
      "${pkgdir}"/usr/share/{applications,desktop-directories,icons/hicolor}

  XDG_DATA_DIRS="${pkgdir}/usr/share" LANG='en_US.UTF-8' python2 setup.py install \
    --staging-root="${pkgdir}/usr" --prefix=/usr

  install -Dm644 resources/calibre-mimetypes.xml "${pkgdir}/usr/share/mime/packages/calibre-mimetypes.xml"

  sed -i "/numeric_version = .*/c\numeric_version = ('""${pkgver//./\', \'}""')" \
      "${pkgdir}/usr/lib/calibre/calibre/constants.py"

  # Compiling bytecode FS#33392
  python2 -m compileall "${pkgdir}/usr/lib/calibre/"
  python2 -O -m compileall "${pkgdir}/usr/lib/calibre/"
}
