# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=kde-builder-git
_basename="${pkgname%-git}"
pkgver=r54.4340456
pkgrel=2
pkgdesc="A script to build KDE software"
url="https://invent.kde.org/ashark/kde-builder"
arch=("any")
license=("GPL")
# depends=("python-promise" "python-yaml" "python-setproctitle" "python-overrides")  # When Arch will provide python 3.12 as default.
depends=(python312 python-pipenv)

# optdepends=(  # When Arch will provide python 3.12 as default.
#   "python-pytest: testing support"
#   "python-type-enforced: for developers"
# )

source=("git+https://invent.kde.org/ashark/kde-builder.git"
        "kde-builder-wrapper.sh")
sha256sums=("SKIP"
            "SKIP")

pkgver() {
  cd "${_basename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# package() {  # When Arch will provide python 3.12 as default.
#   mkdir -p "${pkgdir}/usr/share"
#   cp -r "${srcdir}/${_basename}" "${pkgdir}/usr/share/${_basename}"
#   mkdir -p "${pkgdir}/usr/bin"
#   ln -sfv "/usr/share/${_basename}/${_basename}" "${pkgdir}/usr/bin/${_basename}"
#   ln -sfv "/usr/share/${_basename}/${_basename}-launch" "${pkgdir}/usr/bin/${_basename}-launch"
# }

package() {
  mkdir -p "${pkgdir}/usr/share" "${pkgdir}/usr/bin"
  install -D -m755  kde-builder-wrapper.sh "${pkgdir}/usr/bin/kde-builder"
  cp -r "${srcdir}/${_basename}" "${pkgdir}/usr/share/${_basename}"
  cd "${pkgdir}/usr/share/${_basename}"
  PIPENV_VENV_IN_PROJECT=1 pipenv install --dev
}
