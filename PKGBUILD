# Maintainer: ronalde <r.v.engelen+aur@gmail.com>
# Contributor: dexterlb <dexterlb@qtrp.org>

_pkgname=roc-toolkit
pkgname=${_pkgname}-git
pkgver=v0.1.5.r41.gc8968733
pkgrel=1
pkgdesc="Real-time audio streaming over network. Compiled without pulseaudio modules."
arch=('x86_64' 'i686' 'armv6l' 'armv7l' 'aarch64' 'armv7h' 'armv6h')
conflicts=(roc)
provides=(roc-toolkit)
url="https://github.com/roc-streaming/roc-toolkit"
license=('MPL2')
depends=('openfec' 'libuv' 'libunwind' 'sox')
makedepends=('scons' 'clang' 'llvm' 'gengetopt' 'python' 'ragel' 'git')
source=('git+https://github.com/roc-streaming/roc-toolkit.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_run_scons() {
  local opts=(
    --prefix="${pkgdir}"/usr
    --disable-tests --disable-examples
    --disable-pulseaudio
    --with-openfec-includes=/usr/include/openfec
  )

  scons ${opts[@]} "${@}"
}

build() {
  cd "${_pkgname}"
  if [ -d 3rdparty ]; then
    _run_scons
  else
    if ! _run_scons; then
      # some libraries bundled as 3rd party components ship an outdated config.guess
      # file, which fails to detect some ARM systems
      find 3rdparty -name config.guess -exec cp -vf config.guess '{}' \;
    fi
    _run_scons
  fi
}

package() {
  cd "${_pkgname}"
  _run_scons install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
