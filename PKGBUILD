# Maintainer: Yakuda <yakuda-stack@users.noreply.github.com>
#
# Praat as a Python library. Not in the AUR yet, so it ships alongside
# dream-voicetraining. Builds the bundled Praat sources with scikit-build,
# which takes a few minutes.
#
# Geprueft: baut mit cmake 3.28 und ninja durch, das erzeugte Wheel laesst
# sich installieren und misst korrekt.
#
# If the build fails after a Python version bump in Arch, use
# PKGBUILD.python-praat-parselmouth-bin instead — it installs the official
# wheel and needs no compiler.
pkgname=python-praat-parselmouth
_name=praat-parselmouth
_dist=praat_parselmouth
pkgver=0.4.7
pkgrel=1
pkgdesc="Praat in Python, the Pythonic way"
arch=('x86_64')
url="https://github.com/YannickJadoul/Parselmouth"
license=('GPL-3.0-or-later')
depends=('python' 'python-numpy' 'gcc-libs' 'glibc')
makedepends=(
  'cmake'
  'ninja'
  'pybind11'
  'python-build'
  'python-installer'
  'python-scikit-build'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_dist}-${pkgver}.tar.gz")
sha256sums=('6dd81d246ce1eef5fd93d8cbdaf1bef61ca40ef1d2fc12aa23996a28071181e6')

build() {
  cd "$srcdir/${_dist}-${pkgver}"
  # --skip-dependency-check ist noetig: pyproject.toml verlangt "cmake>=3.18"
  # als Python-Distribution. Arch liefert cmake als Systemprogramm, das der
  # Pruefer nicht sieht. Der Bau selbst benutzt danach das echte cmake.
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$srcdir/${_dist}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
