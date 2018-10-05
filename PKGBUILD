# Maintainer: Cravix <dr.neemous@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: AlexanderR <rvacheva@nxt.ru>
# Contributor: zhn <zhangn1985@gmail.com>

pkgbase=renpy6
pkgname=('python2-renpy6' 'renpy6' 'renpy6-demos')
pkgver=6.99.14.3
pkgrel=2
pkgdesc="Ren'Py visual novel engine (legacy 6.x version)"
arch=('x86_64')
url='http://www.renpy.org'
license=('MIT')
makedepends=('cython2' 'ffmpeg' 'glew' 'python2-pygame-sdl2')
source=("http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-source.tar.bz2"
        'renpy'
        'renpy.desktop'
        'renpy.png')
sha256sums=('e37450d8baf201df2da71db3cc196af8b22377a92f0c06eb72f632ba964fc296'
            'd12cccb8d5acbe28f6740d7efc58ceb78fb4f303a50724a43c47812d51897c6a'
            'fccde3461617a098a78d938d9db782d403eda410a84ab52825a597498ab95834'
            '611edc07a40ccb8e04e8858847fc1d2a066d29c2ed54e5b357880a0605818dc5')

prepare() {
  cd renpy-${pkgver}-source

  sed 's/python/python2/' -i renpy.py launcher/game/tkaskdir.py
}

build() {
  cd renpy-${pkgver}-source

  export RENPY_CYTHON='cython2'

  python2 module/setup.py build
}

package_python2-renpy6() {
  pkgdesc="Base libs of Ren'Py visual novel engine (legacy 6.x version)"
  depends=('ffmpeg' 'glew' 'python2' 'sdl2')

  cd renpy-${pkgver}-source

  python2 module/setup.py install --root="${pkgdir}" --prefix='/usr' --optimize='1'

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s renpy "${pkgdir}"/usr/share/licenses/python2-renpy
}

package_renpy6() {
  arch=('any')
  pkgdesc="Data files of Ren'Py visual novel engine (legacy 6.x version)"
  depends=('python2-pygame-sdl2' 'python2-renpy6')
  optdepends=('renpy6-demos: Tutorial and The Question demos'
              'tk: Set projects directory')
  provides=('renpy')
  conflicts=('renpy')

  cd renpy-${pkgver}-source

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,pixmaps,renpy,doc}}

  cp -dr --no-preserve='ownership' doc launcher renpy renpy.py templates "${pkgdir}"/usr/share/renpy/
  ln -s /usr/share/renpy/doc "${pkgdir}"/usr/share/doc/renpy

  install -m 755 ../renpy "${pkgdir}"/usr/bin/
  install -m 644 ../renpy.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 ../renpy.png "${pkgdir}"/usr/share/pixmaps/

  install -dm 755 "${pkgdir}"/usr/share/licenses/renpy
  install -m 644 LICENSE.txt "${pkgdir}"/usr/share/licenses/renpy/
}

package_renpy6-demos() {
  arch=('any')
  pkgdesc="Demos for renpy6"
  depends=('renpy6')
  provides=('renpy-demos')
  conflicts=('renpy-demos')

  cd renpy-${pkgver}-source

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve='ownership' the_question tutorial "${pkgdir}"/usr/share/renpy/

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s renpy "${pkgdir}"/usr/share/licenses/renpy-demos
}

# vim: ts=2 sw=2 et:
