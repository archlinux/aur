# Maintainer: envolution
# Contributor:  Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=leo
pkgver=6.8.3
pkgrel=1
pkgdesc="Outliner, Editor, and Personal Information Manager"
arch=('any')
url='https://github.com/leo-editor/leo-editor'
license=('MIT' 'BSD')
depends=(
  'jupyter-nbformat'
  'python-asttokens'
  'python-black'
  'python-docutils'
  'python-flexx'
  'python-meta'
  'python-pyflakes'
  'python-pylint'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-pyshortcuts'
  'python-sphinx'
  'shared-mime-info')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
optdepends=('python-pyenchant: spellchecking support')
# checkdepends=('python-pytest')
provides=('leo-editor')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/leo/leo-${pkgver/_/-}.tar.gz"
  'leo.desktop'
  'leo.xml')
sha256sums=('75f1cb7c8f98b526e800b59ce5070f155cca5f8a2dc97c1953944508bb7f3b97'
            '4633876eb91eff206660359ee7da459211e8f87fd73ebbc680fd437c70b63467'
            '630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dvm644 "$srcdir/leo.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dvm644 "$srcdir/leo.xml" -t "$pkgdir/usr/share/mime/packages/"
  install -Dvm644 "leo/Icons/application-x-leo-outline.png" "$pkgdir/usr/share/pixmaps/leo.png"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/leo-${pkgver%_*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:
