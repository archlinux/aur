# Maintainer: Jason T. Bradshaw <jasontbradshaw@gmail.com>
pkgname=zfsnap
pkgver=2.0.0beta2
pkgrel=1
pkgdesc='A portable, performant script to make rolling ZFS snapshots easy.'
arch=('any')
url='http://www.zfsnap.org/'
license=('BSD')
depends=('sh')
optdepends=(
  'bash: for the corresponding completions',
  'tcsh: for the corresponding completions',
  'zsh: for the corresponding completions'
)
source=(https://github.com/zfsnap/zfsnap/archive/v2.0.0-beta2.tar.gz)
md5sums=('5a933d1f84cb880eb8463868ea1845ec')

# Put the hyphen back between the end of the version and the start of the tag.
_hyphenated_pkgver="$(echo "${pkgver}" | sed -r 's/([0-9])([a-z])/\1-\2/')"
_pkgdirver="${pkgname}-${_hyphenated_pkgver}"

package() {
  cd "${srcdir}/${_pkgdirver}"

  # Script files.
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r share/zfsnap/* "${pkgdir}/usr/share/${pkgname}/"

  # Main executable.
  mkdir -p "${pkgdir}/usr/bin"
  install --mode='755' "sbin/zfsnap.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Man page.
  mkdir -p "${pkgdir}/usr/share/man/man8"
  install --mode='644' 'man/man8/zfsnap.8' "${pkgdir}/usr/share/man/man8/${pkgname}.8"

  # License. Necessary since BSD is unique per-project.
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install --mode='644' 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # `bash` completions.
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  install --mode='644' \
    'completion/zfsnap-completion.bash' \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  # `zsh` completions.
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  install --mode='644' \
    "completion/zfsnap-completion.bash" \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  # NOTE: I have no idea where to put `tcsh` completions :(
}

check() {
  cd "${_pkgdirver}/tests"
  ./run.sh
}
