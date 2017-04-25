# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: <haagch@studi.informatik.uni-stuttgart.de>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: lagrange <flkazemakase@gmail.com>
# Contributor: mid-kid <esteve.varela@gmail.com>

pkgbase=python-kivy-git
pkgname=('python-kivy-git' 'python2-kivy-git')
_gitname=kivy
pkgver=1.9.1.r1497.g75cf7bf7b
pkgrel=1
pkgdesc="A software library for rapid development of hardware-accelerated multitouch applications."
arch=('i686' 'x86_64')
url="http://kivy.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2' 'gstreamer' 'sdl2_ttf'
             'sdl2_mixer' 'sdl2_image' 'git')
checkdepends=('python-nose' 'python2-nose' 'python2-mock' 'python-coverage' 'python2-coverage'
              'python-dbus' 'python2-dbus' 'python-gobject' 'python2-gobject' 'xorg-server-xvfb'
              'git' 'mtdev' 'xclip' 'xsel' 'gst-plugins-base' 'gst-plugins-good')
source=("${_gitname}::git+https://github.com/kivy/kivy.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_gitname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # For better metadata
  export KIVY_USE_SETUPTOOLS=1

  export LC_CTYPE=en_US.UTF-8

  rm -rf "${_gitname}-py2"
  cp -a "${_gitname}"{,-py2}
}

build() {
  cd "${srcdir}"/${_gitname}
  python setup.py build build_ext --inplace

  cd "${srcdir}"/${_gitname}-py2
  python2 setup.py build build_ext --inplace
}

check() {
  cd "${srcdir}"/${_gitname}
  PYTHONPATH="$PWD:$PYTHONPATH" xvfb-run -s "-screen 0 1280x720x24 -ac +extension GLX" make test

  cd "${srcdir}"/${_gitname}-py2
  PYTHONPATH="$PWD:$PYTHONPATH" xvfb-run -s "-screen 0 1280x720x24 -ac +extension GLX" make PYTHON=python2 test
}

package_python-kivy-git() {
  depends=('python' 'gstreamer' 'sdl2_ttf' 'sdl2_mixer' 'sdl2_image')
  provides=('python-kivy')
  conflicts=('python-kivy')

  cd ${_gitname}
  python setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-kivy-git() {
  depends=('python2' 'gstreamer' 'sdl2_ttf' 'sdl2_mixer' 'sdl2_image')
  provides=('python2-kivy')
  conflicts=('python2-kivy')

  cd ${_gitname}-py2
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

  mv "${pkgdir}"/usr/share/kivy{,2}-examples
}
