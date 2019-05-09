# Maintainer  : LinRs            <LinRs at users.noreply.github.com>
# Contributor : hexchain         <i at hexchain.org>
# Contributor : Thaodan          <theodorstormgradex {at) gmail [dot} com>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc-git
_pkgname=osc
pkgver=0.162.0.r199.g035cd546
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python' 'python-m2crypto' 'urlgrabber')
makedepends=('git' 'python-setuptools')
optdepends=(
    'obs-build: required to run local builds'
    'obs-service-format_spec_file: for running the format_spec_file source service'
    'obs-service-download_files: for running the download_files source service'
    'python-keyring: keyring support')
conflicts=('osc' 'osc-bash-completion' 'zsh-completion-osc')
replaces=('osc-bash-completion' 'zsh-completion-osc')
source=("git+https://github.com/openSUSE/osc.git#branch=python3")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail;
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

    cd "${pkgdir}/usr/bin"
    ln -s osc-wrapper.py osc
    cd -

    install -Dm644 dist/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
    install -Dm755 dist/osc.complete "${pkgdir}/usr/lib/osc/complete"
}

# vim:set sts=4 ts=4 sw=4 et:
