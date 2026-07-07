# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ctf-sniper-git
_name=${pkgname%-git}
_name=${_name#python-}
pkgver=r5.a051af7
pkgrel=1
pkgdesc="Command-line tool to download CTF challenges"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/bjornmorten/ctf-sniper"
backup=(etc/${_name}/config.yaml)
_pydeps=(
    pydantic
    rich
    typer
    yaml
# AUR
    ctfbridge
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'python-ctf-dl: A CTF challenge bulk downloader'
    'python-pwnv: A CTF workspace management tool'
)
license=('MIT')
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

# build() {
    # cd "${srcdir}/${_name}"
    # python -m build --wheel --no-isolation
# }

package() {
    cd "${srcdir}/${_name}"
    # python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm755 ctf-sniper.py "${pkgdir}/usr/bin/${_name}"
    install -Dm644 config.example.yaml ${pkgdir}/etc/${_name}/config.yaml
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
