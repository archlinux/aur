# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=poetry
pkgver=0.12.5
pkgrel=3
pkgdesc="Python dependency management and packaging made easy."
arch=('any')
url="https://github.com/sdispater/poetry"
license=('MIT')
depends=(
  'python>=3.4'
)
conflicts=('python-poetry')
options=(!emptydirs)
install="${pkgname}.install"
source=(
  "https://github.com/sdispater/poetry/releases/download/${pkgver}/poetry-${pkgver}-linux.tar.gz"
  "https://github.com/sdispater/poetry/archive/${pkgver}.tar.gz"
  "poetry.py"
)
sha256sums=(
  '67cd337e8697ac6f6218c9519b983d2f1eb67e6442fec1369f46ab3a8b98e48a'
  '95d73348e91f06faf1acaddf5df30fdca2f5eef06206f20f14c81245f534c16e'
  'e9fee925c0fb42df53389bdfc8ebbe01bfd4f6146ed0a55786bd2ba741169c0c'
)

package() {
  cd "${srcdir}"

  rm -rf "${pkgdir}/usr/lib/poetry/poetry"

  install -d "${pkgdir}/usr/lib/poetry"
  cp -r poetry "${pkgdir}/usr/lib/poetry/poetry"

  install -Dm755 poetry.py "${pkgdir}/usr/bin/poetry"

  # Tab completion for Bash
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  cd "${pkgdir}/usr/lib/poetry"
  _completion=`python -B -m poetry completions bash \
    | sed '$d' \
    | sed 's/__main__py/poetry/' \
    | sed 's/__main__.py/poetry/'`
  _last_line=`cat <<< $_completion \
    | tail -1 \
    | sed 's/poetry$/\/usr\/bin\/poetry/'`
  echo -e "$_completion\n$_last_line" > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
