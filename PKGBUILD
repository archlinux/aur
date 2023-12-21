pkgname="timedctl"
pkgver=5.9.0
pkgrel=2
pkgdesc="Click CLI for Timed using libtimed"
arch=("any")
url="https://github.com/adfinis/timedctl.git"
license=("AGPL3")
provides=("timedctl")
conflicts=("timedctl")
depends=("python>=3.10" "python-click>=8.1.3" "python-pyfzf>=0.3.1" "python-rich>=13.4.2" "python-libtimed>=0.4.3" "python-tomlkit>=0.11.8" "python-click-aliases>=1.0.1" "fzf>=0.42.0")
makedepends=("python-poetry" "python-installer" "git")
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd "${srcdir}/timedctl"
  git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${srcdir}/timedctl"
  poetry install
  poetry build
}

package() {
  cd "${srcdir}/timedctl"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  _TIMEDCTL_COMPLETE=bash_source timedctl | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/timedctl.bash"
  _TIMEDCTL_COMPLETE=fish_source timedctl | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/timedctl.fish"
  _TIMEDCTL_COMPLETE=zsh_source timedctl | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_timedctl"
}
