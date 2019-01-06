# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=5.8
pkgrel=1
pkgdesc="Literate programmer's editor, outliner, and project manager"
arch=('any')
url="http://leoeditor.com/"
license=('custom')
# Many of these are actually developer-only dependencies, but the launch
# scripts will throw `DistributionNotFound` without them.
#
# Upstream is working on fixing their dependency specifications:
# https://github.com/leo-editor/leo-editor/issues/968#issuecomment-435644438
depends=(
    desktop-file-utils
    jupyter-nbformat
    python-docutils
    python-keyring
    python-pyflakes
    python-pylint
    python-pypandoc
    python-pyqt5
    python-semantic-version
    python-setuptools
    python-sphinx
    python-wheel
    shared-mime-info
    twine
)
optdepends=('python-pyenchant: spellchecking support')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/leo-editor/leo-editor/archive/${pkgver}.tar.gz
    leo-dist.patch
    leo.desktop
    leo.xml
)
sha256sums=(
    ef8413acebb1a032ef8ba6972eb96179a3cd893eb0dd33bf0b84ca78e3c34e31
    5140c9daf92eb0b3bacea022bb6a7e46911cb727d8372fdb756a31f8bcd6c8f0
    7b326791378eefedecee2474c4e1a497838d2a06ff4259a195d817c38588395b
    630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb
)

prepare() {
    cd "leo-editor-${pkgver}"

    # leo's packaging workflow currently requires several workarounds to
    # function:
    #
    # https://github.com/leo-editor/leo-editor/issues/968#issuecomment-451763826
    patch -p1 < ../leo-dist.patch
}

package() {
    cd "leo-editor-${pkgver}"

    # leo's setup.py has a hardcoded clean step that always removes the `build`
    # directory. So providing separate `build()` and `package()` steps is futile.
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/leo.desktop" "$pkgdir/usr/share/applications/leo.desktop"
    install -D -m644 "$srcdir/leo.xml" "$pkgdir/usr/share/mime/packages/leo.xml"
    install -D -m644 "leo/Icons/application-x-leo-outline.png" "$pkgdir/usr/share/pixmaps/leo.png"
}
