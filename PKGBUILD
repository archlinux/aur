# Maintainer: Popolon <popolon @L popolon dot org>
# Contributer: Mark Coolen <mark dot coolen at gmail dot com>
# Contributer: fkxxyz <fkxxyz@163.com>

pkgname='python-mingus'
_module='mingus'
pkgver='0.6.1'
_src_folder="${pkgname}-${pkgver}"
pkgrel=2
pkgdesc="A package for Python used by programmers, musicians, composers and researchers to make and investigate music."
url="https://github.com/bspaans/python-mingus"
depends=('python' 'python-six' 'python-numpy')
optdepends=('lilypond: Score rendering'
            'fluidsynth: Play MIDI output')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:GNU General Public License (GPL)')
arch=('any')
source=("https://github.com/bspaans/python-mingus/archive/${pkgver}.tar.gz")
sha256sums=('05355cd92f4cfe7a25203736482c49fd751cbf9a63201fa0b7a1fb5fd3cd7b10')

prepare() {
    cd "${srcdir}/${_src_folder}"
    sed -i s/fromstring/frombuffer/ mingus/midi/pyfluidsynth.py
    #sed -i s/tostring/tobuffer/ mingus/midi/pyfluidsynth.py
}

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    cd "$pkgdir//usr"
    python_majmin=`python --version | awk '{print $2}'| cut -d . -f 1,2`
    mv mingus_examples lib/python${python_majmin}/site-packages/mingus/examples
}
