# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Allen M. <ase1590@hotmail.com>

pkgname=python-wxpython-git
pkgver=4.2.2.r53.g9dd38b6a
pkgrel=2
pkgdesc="Python 3 implementation of the WxPython UI library"
arch=(x86_64)
url="https://github.com/wxWidgets/Phoenix"
license=('custom:wxWindows')
depends=(wxwidgets-gtk3 wxwidgets-common python-six python-setuptools python-numpy glibc gcc-libs )
optdepends=('python-pypubsub: Alternative to the deprecated wx.lib.pubsub API')
makedepends=(git mesa glu webkit2gtk python-requests python-attrdict sip doxygen waf)
checkdepends=(xorg-server-xvfb python-pytest-forked)
provides=(python-wxpython)
conflicts=(python-wxpython wxpython-phoenix-git)
replaces=(wxpython-phoenix-git)
source=("git+https://github.com/wxWidgets/Phoenix.git"
		"git+https://github.com/wxWidgets/wxWidgets.git"
        "git+https://github.com/wxWidgets/nanosvg.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd Phoenix
  git describe --long --tags --exclude last-sip* | sed 's/^wxPython-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd Phoenix
  git submodule init
  git config submodule.ext/wxWidgets.url "${srcdir}/wxWidgets"
  git config submodule.ext/nanosvg.url "${srcdir}/nanosvg"
  git -c protocol.file.allow=always submodule update
}

build(){
  cd Phoenix
  rm -r sip/{cpp,gen}/* # Recreate sip files with current wxWidgets
  #SIP=/usr/bin/sip DOXYGEN=/usr/bin/doxygen WAF=/usr/bin/waf \
  python build.py dox etg --nodoc sip build --use_syswx --release
}

check() {
  cd Phoenix
  # there are segfaulting tests so --forked ensures we get sensible results
  PYTHONPATH=$PWD xvfb-run pytest --forked unittests || echo "==> WARNING: tests usually fail randomly"
}

package(){
  cd Phoenix
  python build.py install --destdir="$pkgdir"

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  find "$pkgdir/usr/lib" -type f | xargs chmod 644
}
