# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=calibre-git
pkgver=3.39.1.r15.g2866c8dcbf
pkgrel=1
pkgdesc="Ebook management application"
arch=('i686' 'x86_64')
url="https://calibre-ebook.com/"
license=('GPL3')
depends=('chmlib' 'icu' 'jxrlib' 'libmtp' 'libusbx' 'libwmf' 'mathjax' 'mtdev' 'optipng' 'podofo'
         'poppler' 'python2-apsw' 'python2-cssselect' 'python2-feedparser' 'python2-markdown'
         'python2-css-parser' 'python2-dateutil' 'python2-dbus' 'python2-dnspython'
         'python2-dukpy' 'python2-html5-parser' 'python2-mechanize' 'python2-msgpack'
         'python2-netifaces' 'python2-unrardll' 'python2-pillow' 'python2-psutil'
         'python2-pygments' 'python2-pyqt5' 'python2-regex' 'qt5-svg' 'qt5-webkit')
makedepends=('git' 'qt5-x11extras' 'sip' 'xdg-utils' 'rapydscript-ng') #'python2-sphinx')
checkdepends=('xorg-server-xvfb')
optdepends=('ipython2: to use calibre-debug')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/kovidgoyal/${pkgname%-git}.git?signed"
        "git+https://github.com/kovidgoyal/${pkgname%-git}-translations.git?signed"
        "user-agent-data.json")
sha256sums=('SKIP'
            'SKIP'
            'b6da5e354a167f000462cf7964132c6e0749e16588249ef75ab31a62230561b8')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

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
  LANG='en_US.UTF-8' python2 setup.py resources --path-to-mathjax /usr/share/mathjax --system-mathjax

  # manpages simply don't build at the moment:
  # https://github.com/sphinx-doc/sphinx/issues/5150
  #LANG='en_US.UTF-8' python2 setup.py man_pages

  # This tries to download new user-agent data, so pre-seed a
  # recently-generated copy to allow offline builds.
  cp ../user-agent-data.json resources/
  LANG='en_US.UTF-8' python2 setup.py recent_uas || true
}

check() {
  cd "${srcdir}/${pkgname%-git}"

  # without xvfb-run this fails with much "Control socket failed to recv(), resetting"
  # ERROR: test_websocket_perf (calibre.srv.tests.web_sockets.WebSocketTest)
  LANG='en_US.UTF-8' xvfb-run python2 setup.py test
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # If these directories don't exist, zsh completion, icons, and desktop files won't install.
  install -d "${pkgdir}/usr/share/zsh/site-functions" \
      "${pkgdir}"/usr/share/{applications,desktop-directories,icons/hicolor}

  install -Dm644 resources/calibre-mimetypes.xml \
      "${pkgdir}/usr/share/mime/packages/calibre-mimetypes.xml"

  XDG_DATA_DIRS="${pkgdir}/usr/share" LANG='en_US.UTF-8' python2 setup.py install \
    --staging-root="${pkgdir}/usr" --prefix=/usr

  #cp -a man-pages/ "${pkgdir}/usr/share/man"

  sed -i '/^numeric_version = /c\numeric_version = '"$(printf "(%s, %s, %s, '%s', '%s')" ${pkgver//./ })" \
      "${pkgdir}/usr/lib/calibre/calibre/constants.py"

  # not needed at runtime
  rm -r "${pkgdir}"/usr/share/calibre/rapydscript/

  # Compiling bytecode FS#33392
  # This is kind of ugly but removes traces of the build root.
  while read -rd '' _file; do
    _destdir="$(dirname "${_file#${pkgdir}}")"
    python2 -m compileall -d "${_destdir}" "${_file}"
    python2 -O -m compileall -d "${_destdir}" "${_file}"
  done < <(find "${pkgdir}"/usr/lib/ -name '*.py' -print0)
}
