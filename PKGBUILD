# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=bash-it-git
pkgver=master
pkgrel=1
pkgdesc='A community Bash framework'
arch=('any')
url='https://github.com/Bash-it/bash-it'
license=('custom:undecided')
depends=('bash')
makedepends=()
checkdepends=()
optdepends=(
  'ruby: ruby integration'
  'rbenv: rbenv integration'
)
conflicts=('bash-it')
backup=()
options=()
install="${pkgname}.install"
changelog=
source=(
  'https://github.com/Bash-it/bash-it/tarball/master'
  'LICENSE'
)
sha512sums=(
  'SKIP'
  'SKIP'
)
noextract=("${pkgname}.tar.gz")

build() {
  tar -x \
    -f "${srcdir}/${pkgname}.tar.gz" -z \
    --no-anchored --wildcards -C "${srcdir}" \
    --exclude='test' \
    --strip-components=1 \
    '.editorconfig' 'aliases' 'completion' 'custom' \
    'lib' 'plugins' 'template' 'themes' \
    'CONTRIBUTING.md' 'README.md' '*.sh'

  rm "${srcdir}/${pkgname}.tar.gz"
}

package() {
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  cp --preserve-mode -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" \
    "${srcdir}/LICENSE"

  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    "${srcdir}"/{bash_it,install,uninstall}.sh \
    "${srcdir}"/{aliases,completion,custom,lib} \
    "${srcdir}"/{plugins,themes}

  cp -r --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    "${srcdir}"/template
  cp --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}"/*.md

  _templatedir="${pkgdir}/usr/share/${pkgname}/home_template/.bash_it"

  for _file_type in aliases completion plugins; do
    mkdir -p "${_templatedir}/${_file_type}/available"

    ln -fs \
      "${pkgdir}/usr/lib/${pkgname}/${_file_type}/available"/* \
      "${_templatedir}/${_file_type}/available/"
  done

  cp --preserve=mode -t "${_templatedir}" \
    "${srcdir}/.editorconfig"

  mkdir -p "${_templatedir}"/{custom,lib,template,themes}

  ln -fs \
    "${pkgdir}/usr/lib/${pkgname}"/{bash_it,install,uninstall}.sh \
    "${pkgdir}/usr/share/doc/${pkgname}"/* \
    "${_templatedir}/"

  for _customizable_dir in custom lib themes; do
    ln -fs \
      "${pkgdir}/usr/lib/${pkgname}/${_customizable_dir}"/* \
      "${_templatedir}/${_customizable_dir}/"
  done

  ln -fs \
    "${pkgdir}/usr/share/${pkgname}/template"/* \
    "${_templatedir}/template/"

  cp -r --preserve=mode -t ~/ "${_templatedir}"
}
