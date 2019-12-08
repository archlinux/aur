# Maintainer: Mathieu Lemay <acidrain1@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=poetry-beta
_pkgname=poetry
pkgver=1.0.0b9
pkgrel=1
pkgdesc="Python dependency management and packaging made easy (pre-release version)"
arch=('any')
url="https://poetry.eustace.io/"
license=('MIT')
depends=('python')
conflicts=('python-poetry' 'poetry')
options=(!emptydirs)
source=(
  "https://github.com/sdispater/poetry/releases/download/${pkgver}/poetry-${pkgver}-linux.tar.gz"
  "https://github.com/sdispater/poetry/archive/${pkgver}.tar.gz"
  "poetry.py"
)
sha256sums=('aeb25c1f6cde4972b6631ee4061ca46bedf69b2db66ea4c74f096f30ad66e021'
            'ac50505e9e89eded5a2c63b57164a8b32c4468adc3e97aae99ead6984782eb99'
            'e9fee925c0fb42df53389bdfc8ebbe01bfd4f6146ed0a55786bd2ba741169c0c')

package() {
  cd "${srcdir}"

  rm -rf "${pkgdir}/usr/lib/poetry/poetry"

  install -d "${pkgdir}/usr/lib/poetry"
  cp -r poetry "${pkgdir}/usr/lib/poetry/poetry"

  install -Dm755 poetry.py "${pkgdir}/usr/bin/poetry"

  cd "${pkgdir}/usr/lib/poetry"

  # Tab completion for Bash
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  python -B -m poetry completions bash \
    | sed '$s/\ \/.*\/pkg\/poetry\/usr\/lib\/poetry\/poetry\/__main__.py/\ \/usr\/bin\/poetry/' \
    | sed 's/__main__py/poetry/' \
    | sed 's/__main__.py/poetry/' \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"

  # Tab completion for Zsh
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  python -B -m poetry completions zsh \
    | sed '$s/\ \/.*\/pkg\/poetry\/usr\/lib\/poetry\/poetry\/__main__.py/\ \/usr\/bin\/poetry/' \
    | sed 's/__main__py/poetry/' \
    | sed 's/__main__.py/poetry/' \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

  # Tab completion for Fish
  install -d "${pkgdir}/usr/share/fish/vendor_completions"
  python -B -m poetry completions fish \
    | sed 's/__main__py/poetry/' \
    | sed 's/__main__.py/poetry/' \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${_pkgname}/CONTRIBUTING.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
